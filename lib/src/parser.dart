import 'package:antlr4/antlr4.dart';
// ignore: implementation_imports
import 'package:antlr4/src/util/bit_set.dart';
import 'package:quiver/collection.dart';
import './part_item.dart';

import './song/LatexSongParser.dart' as song_parser;
import './song/LatexSongLexer.dart' as song_lexer;
import 'song_builder.dart';

class CommandState {
  final void Function(CommandState) function;
  final List<PartItem?> arguments;
  final RuleContext context;
  final int nArgs;
  final String command;
  int? depth;
  int _argn = 0;
  CommandState(this.command, this.context,
      {required this.function, required this.nArgs, required this.depth})
      : arguments = List.filled(nArgs, null);
  bool add(dynamic arg) {
    if (_argn == nArgs) {
      throw Exception("No more space");
    }
    arguments[_argn++] = arg;
    if (_argn == nArgs) {
      function(this);
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return command;
  }
}

class CommandStack extends DelegatingList<CommandState> {
  List<CommandState> list = <CommandState>[];
  @override
  List<CommandState> get delegate => list;
  void addCommand(RuleContext ctx, void Function(CommandState) function,
      int nArgs, int depth) {
    if (nArgs > 0) {
      list.add(CommandState(ctx.text, ctx,
          function: function, nArgs: nArgs, depth: depth));
    } else {
      function(CommandState(ctx.text, ctx,
          function: function, nArgs: 0, depth: depth));
    }
  }

  bool addArgument(PartItem item) {
    CommandState? state = list.lastOrNull;
    if (state == null) {
      return false;
      // throw StateError("Illegal State: Cannot add argument while there is no commands running");
    }
    if (state.add(item)) {
      if (list.lastOrNull == state) {
        list.remove(state);
      }
    }
    return true;
  }

  @override
  String toString() {
    return [for (CommandState state in list) state.command].join(', ');
  }
}

class ExitErrorListener extends ErrorListener {
  final void Function(String msg, int? line, int? charPositionInLine) exit;

  ExitErrorListener(this.exit);
  @override
  void reportAmbiguity(Parser recognizer, DFA dfa, int startIndex,
      int stopIndex, bool exact, BitSet? ambigAlts, ATNConfigSet configs) {}

  @override
  void reportAttemptingFullContext(Parser recognizer, DFA dfa, int startIndex,
      int stopIndex, BitSet? conflictingAlts, ATNConfigSet configs) {}

  @override
  void reportContextSensitivity(Parser recognizer, DFA dfa, int startIndex,
      int stopIndex, int prediction, ATNConfigSet configs) {}

  @override
  void syntaxError(
      Recognizer<ATNSimulator> recognizer,
      Object? offendingSymbol,
      int? line,
      int charPositionInLine,
      String msg,
      RecognitionException<IntStream>? e) {
    print(msg);
    exit(msg, line, charPositionInLine);
  }
}

Future<List<Chordsheet>> parseChordsheets(String path) async {
  final inputstream = await InputStream.fromPath(path);
  final songlexer = song_lexer.LatexSongLexer(inputstream);
  final tokenstream = CommonTokenStream(songlexer);
  final parser = song_parser.LatexSongParser(tokenstream);
  final builder = ChordsheetBuilder();
  String? error;
  parser.addErrorListener(ExitErrorListener((msg, line, charPositionInLine) {
    error = "$path [$line,$charPositionInLine] $msg";
  }));
  parser.addParseListener(builder);

  parser.prog();

  if (error != null) {
    throw Exception(error);
  }

  return builder.chordsheets;
}
