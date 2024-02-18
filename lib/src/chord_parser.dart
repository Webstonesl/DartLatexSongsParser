import 'package:antlr4/antlr4.dart';
import 'package:latexsongparser/latexsongparser.dart';
import 'package:latexsongparser/src/chord/ChordsLexer.dart';
import 'package:latexsongparser/src/chord/ChordsParser.dart';

int _getNumber(String? ctx, String n) {
  final exp = RegExp(r'([#b&]*)(\d+)');
  final match = exp.matchAsPrefix(n)!;
  late int interval;
  if (ctx == null) {
    interval = <int, int>{
      1: 0,
      2: 2,
      3: 4,
      4: 5,
      5: 7,
      6: 9,
      7: 10,
      9: 14,
      11: 17
    }[int.parse(match.group(2)!)]!;

    // print(n);
  } else if (ctx == 'maj') {
    interval = <int, int>{
      1: 0,
      2: 2,
      3: 4,
      4: 5,
      5: 7,
      6: 9,
      7: 11,
      9: 14,
      11: 17
    }[int.parse(match.group(2)!)]!;

    // print(n);
  }

  if (match.group(1)?.isNotEmpty ?? false) {
    String s = match.group(1) ?? "";
    for (int i = 0; i < s.length; i++) {
      String c = s.substring(i, i + 1);
      switch (c) {
        case '#':
          interval += 1;
          break;
        case '&':
        case 'b':
          interval -= 1;
          break;
        default:
          return interval;
      }
    }
  }
  return interval;
}

Map<String, Set<int>> _getBasedOnContext(RuleContext context) {
  CommonToken ctx = context.getChild(0)!.payload;

  int? n;
  if (context.childCount == 2) {
    String? ctxs;
    switch (ctx.type) {
      case ChordsLexer.TOKEN_ADD:
      case ChordsLexer.TOKEN_SUS:
      case ChordsLexer.TOKEN_DIM:
        break;
      case ChordsLexer.TOKEN_MAJ:
        ctxs = 'maj';
      default:
        break;
    }

    n = _getNumber(ctxs, context.getChild(1)!.text!);
  }

  switch (ctx.type) {
    case ChordsLexer.TOKEN_SUS:
      if (n == null) {
        return {
          'set': {0, 2, 5, 7}
        };
      } else {
        return {
          'set': {0, n, 7}
        };
      }

    default:
      return {
        'add': {n!}
      };
  }
}

Map<String, Set<int>> _getBasedOnCommonToken(CommonToken token) {
  if (token.type == ChordsLexer.TOKEN_MIN) {
    return {
      'set': {0, 3, 7}
    };
  } else if (token.type == ChordsLexer.TOKEN_AUG) {
    return {
      'set': {0, 4, 8}
    };
  } else if (token.type == ChordsLexer.TOKEN_DIM) {
    return {
      'set': {0, 3, 6}
    };
  } else if (token.type == ChordsLexer.TOKEN_NUMBER) {
    return {
      'add': {0, 7, _getNumber(null, token.text!)}
    };
  }
  print("${token.startIndex}:${token.text}");

  return {};
}

Chord? parseChord(String s) {
  final inputstream = InputStream.fromString(s);
  final lexer = ChordsLexer(inputstream);

  final stream = CommonTokenStream(lexer);
  final parser = ChordsParser(stream);

  ChordContext? context = parser.chord();
  if (context.key(0) != null) {
    Note? n = Note.tryParse(context.key(0)!.text);
    if (n == null) return null;
    Note? b =
        context.key(1) == null ? null : Note.tryParse(context.key(1)!.text);
    Set<int> notes = {0, 4, 7};
    String mod = context.mod()?.text ?? "";
    if (context.mod()?.children == null) {
    } else {
      for (ParseTree child in context.mod()!.children!) {
        late Map<String, Set<int>> result;
        if (child.payload is CommonToken) {
          result = _getBasedOnCommonToken(child.payload);
        } else if (child.payload is RuleContext) {
          result = _getBasedOnContext(child.payload);
        } else {
          result = {};
        }
        if (result.containsKey('set')) {
          notes = result['set']!;
        }
        if (result.containsKey('remove')) {
          notes.removeAll(result['remove']!);
        }
        if (result.containsKey('add')) {
          notes.addAll(result['add']!);
        }
      }
      // print(notes);
    }
    return Chord(n, bass: b, mod: mod, intervals: notes);
  }

  return null;
}
