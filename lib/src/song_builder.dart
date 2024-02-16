import 'package:antlr4/antlr4.dart';
import './part_builder.dart';

import './song/LatexSongParser.dart' as song_parser;
import './song/LatexSongListener.dart' as song_listener;
import 'musicalstate.dart';
import 'parser.dart';
import 'part_item.dart';

class ChordsheetBuilder implements song_listener.LatexSongListener {
  List<Chordsheet> chordsheets = [];
  Chordsheet get chordsheet => chordsheets.last;
  PartItemGroup? group;
  CommandStack states = CommandStack();
  int depth = 0;
  String? title;
  @override
  void exitSong_part(song_parser.Song_partContext ctx) {
    String text = ctx.text;
    parsePart(chordsheet, text);
  }

  @override
  void enterCommand(song_parser.CommandContext ctx) {}

  @override
  void enterElement(song_parser.ElementContext ctx) {
    depth += 1;
  }

  @override
  void enterEveryRule(ParserRuleContext node) {}

  @override
  void enterProg(song_parser.ProgContext ctx) {
    group = PartItemGroup(parent: null);
  }

  @override
  void enterReg_group(song_parser.Reg_groupContext ctx) {
    group = PartItemGroup(parent: group);
  }

  @override
  void enterSong(song_parser.SongContext ctx) {
    chordsheets.add(Chordsheet(parent: group));
    group = chordsheet;
    title = null;
    states.addCommand(ctx, (state) {
      chordsheet.title = state.arguments[0]!.getText();
    }, 1, depth + 1);
  }

  @override
  void enterSong_part(song_parser.Song_partContext ctx) {}

  @override
  void enterSub_group(song_parser.Sub_groupContext ctx) {}

  @override
  void exitCommand(song_parser.CommandContext ctx) {
    switch (ctx.children![1].text!) {
      case 'repeatpart':
        states.addCommand(ctx, (state) {
          ChordsheetRepeat(
              parent: group,
              title: state.arguments[0]!.getText(),
              repeats: state.arguments[0]!.options["count"] ?? 1);
        }, 1, depth);
        break;
      case 'rep':
        states.addCommand(ctx, (state) {
          group!.options["count"] = int.parse(state.arguments[0]!.getText());
        }, 1, depth);
        break;
      case 'beatunit':
        states.addCommand(ctx, (state) {
          PartItemText(kvList['beatunit'].toString(), parent: group);
        }, 0, depth);
        break;
      case 'beatcount':
        states.addCommand(ctx, (state) {
          PartItemText(kvList['beatcount'].toString(), parent: group);
        }, 0, depth);
        break;

      case 'transpose':
        states.addCommand(ctx, (state) {
          PartItemTranspose(int.parse(state.arguments[0]!.getText()),
              parent: group);
        }, 1, depth);
        break;
      case 'meter':
        states.addCommand(ctx, (state) {
          PartItemMeasure(
              parent: group,
              lower: int.parse(state.arguments[0]!.getText()),
              upper: int.parse(state.arguments[1]!.getText()));
        }, 2, depth);
        break;
      case 'singer':
        states.addCommand(ctx, (state) {}, 1, depth);
        break;
      case 'capo':
        states.addCommand(ctx, (state) {}, 1, depth);
        break;
      case 'preferflats':
        break;
      case 'tempo':
        states.addCommand(ctx, (state) {
          PartItemMeasure(
              parent: group, bpm: int.parse(state.arguments[0]!.getText()));
        }, 1, depth);
        break;
      case 'transposehere':
        states.addCommand(ctx, (p1) {
          final temp = PartItemGroup(parent: group);
          temp.options["transpose"] = true;
          p1.arguments[0]!.parent = temp;
        }, 1, depth);

      case 'musicnote':
        break;
      default:
        // print("$depth - ${ctx.children![1].text}");
        break;
    }
  }

  @override
  void exitElement(song_parser.ElementContext ctx) {
    if (states.isNotEmpty) {
      if (depth == states.last.depth) {
        if (!ctx.children!.contains(states.last.context)) {
          if (group!.children.lastOrNull != null) {
            states.addArgument(group!.children.removeLast());
          }
        }
      } else {
        // print(ctx.parent.runtimeType);
      }
    }
    depth -= 1;
  }

  @override
  void exitEveryRule(ParserRuleContext node) {
    // TODO: implement exitEveryRule
  }
  Map<String, dynamic> kvList = {};
  PartItemGroup? _group;
  int? _depth;
  @override
  void enterKeyvaluelist(song_parser.KeyvaluelistContext ctx) {
    _group = group;
    group = PartItemGroup(parent: null);
    _depth = depth;
    depth = 0;

    kvList = {'beatcount': 4, 'beatunit': 4};
  }

  @override
  void enterKvelement(song_parser.KvelementContext ctx) {
    group = PartItemGroup(parent: group);
  }

  @override
  void exitKeyvaluelist(song_parser.KeyvaluelistContext ctx) {
    for (PartItem item in group!.children) {
      PartItemGroup group = (item as PartItemGroup);
      final text = group.children[0].getText();
      final key = text.split("=")[0].trim();
      dynamic value = text.split("=")[1].trim();
      if (group.children.length > 1) {
        value = group.children[1].getText();
      }
      if (RegExp(r"-?\d+").matchAsPrefix(value) != null) {
        value = int.parse(value);
      }
      kvList[key] = value;
    }
    chordsheet.initialState = MusicalState(
        scale: null,
        bpm: kvList["bpm"],
        upper: kvList["beatcount"],
        lower: kvList["beatunit"]);
    group = _group;
    _group = null;
    depth = _depth!;
    _depth = null;
  }

  @override
  void exitKvelement(song_parser.KvelementContext ctx) {
    group = group!.parent;
  }

  @override
  void exitProg(song_parser.ProgContext ctx) {}

  @override
  void exitReg_group(song_parser.Reg_groupContext ctx) {
    group = group!.parent;
  }

  @override
  void exitSong(song_parser.SongContext ctx) {
    group = group!.parent;
  }

  @override
  void exitSub_group(song_parser.Sub_groupContext ctx) {}

  @override
  void visitErrorNode(ErrorNode node) {}

  void _addText(String text) {
    if (text.contains('\n')) {
      if (RegExp(r'[^\s\n]').hasMatch(text)) {
        text.splitMapJoin(
          '\n',
          onMatch: (p0) {
            PartItemLineBreak(parent: group);
            return "";
          },
          onNonMatch: (p0) {
            _addText(p0);
            return "";
          },
        );
      }
      PartItemLineBreak(parent: group);
      return;
    }
    if (group!.children.lastOrNull is PartItemText) {
      (group!.children.last as PartItemText).text += text;
    } else {
      PartItemText(text, parent: group);
    }
  }

  @override
  void visitTerminal(TerminalNode node) {
    if (node.parent is song_parser.ElementContext) {
      _addText(node.text!);
    } else if (node.parent is song_parser.KvelementContext) {
      _addText(node.text!);
    }
  }
}
