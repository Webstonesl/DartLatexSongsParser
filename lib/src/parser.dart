import 'package:antlr4/antlr4.dart';
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

Future<List<Chordsheet>> parseChordsheets(String path) async {
  final inputstream = await InputStream.fromPath(path);
  final songlexer = song_lexer.LatexSongLexer(inputstream);
  final tokenstream = CommonTokenStream(songlexer);
  final parser = song_parser.LatexSongParser(tokenstream);
  final builder = ChordsheetBuilder();
  parser.addParseListener(builder);
  try {
    parser.prog();
  } on Exception catch (e) {
    print(
        "$path: [${parser.currentToken.line}:${parser.currentToken.charPositionInLine}(${parser.currentToken.text})] ($e)");
  }
  return builder.chordsheets;
}
