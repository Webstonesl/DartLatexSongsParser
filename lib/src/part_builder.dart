import 'package:antlr4/antlr4.dart';

import './part/LatexPartParser.dart' as part_parser;
import './part/LatexPartLexer.dart' as part_lexer;
import './part/LatexPartListener.dart' as part_listener;
import 'parser.dart';
import 'part_item.dart';

class PartBuilder implements part_listener.LatexPartListener {
  ChordsheetPart? part;
  late PartItemGroup group;
  List<dynamic> values = [];
  CommandStack states = CommandStack();
  int n = 0;
  final PartItemGroup parent;

  PartBuilder({required this.parent});

  @override
  void enterCommand(part_parser.CommandContext ctx) {}

  @override
  void enterElement(part_parser.ElementContext ctx) {
    n += 1;
  }

  @override
  void enterEveryRule(ParserRuleContext node) {}

  @override
  void enterPart(part_parser.PartContext ctx) {
    part = ChordsheetPart(parent: parent);
    group = part!;
  }

  @override
  void enterPartcontent(part_parser.PartcontentContext ctx) {}

  @override
  void enterRaised(part_parser.RaisedContext ctx) {
    group = PartItemGroup(parent: group);

    group.options["raised"] = true;
    group.options["transpose"] = true;
  }

  @override
  void enterReg_group(part_parser.Reg_groupContext ctx) {
    final group2 = PartItemGroup(parent: group);
    group = group2;
  }

  @override
  void exitCommand(part_parser.CommandContext ctx) {
    if ((ctx.children ?? []).length == 2) {
      switch (ctx.children![1].text!) {
        case 'textnote':
        case 'musicnote':
          states.addCommand(ctx, (p0) {
            p0.arguments[0]!.options['note'] = ctx.children![1].text;
            p0.arguments[0]!.parent = group;
          }, 1, n);
        case 'versetitle':
          states.addCommand(ctx, (state) {
            states.remove(state);
            part!.title =
                state.arguments[0]!.getText().replaceAll(":", "").trim();
          }, 1, n);
          break;
        case 'transpose':
          states.addCommand(ctx, (state) {
            PartItemTranspose(int.parse(state.arguments[0]!.getText()),
                parent: group);
          }, 1, n);

          break;
        case 'mbar':
          states.addCommand(ctx, (state) {
            PartItemMeasure(
                upper: int.tryParse(state.arguments[0]!.getText()),
                lower: int.tryParse(state.arguments[1]!.getText()),
                parent: group);
          }, 2, n);
          break;
        case 'hfill':
          states.addCommand(ctx, (p0) {}, 1, n);
          break;

        case 'rep':
          states.addCommand(ctx, (state) {
            states.remove(state);
            int.parse(state.arguments[0]!.getText());
          }, 1, n);
          break;
        case 'lrep':
          final group2 = PartItemGroup(parent: group);
          group2.options["repeatmeasures"] = true;
          group = group2;
          break;
        case 'rrep':
          group = group.parent!;
          break;
        case 'nolyrics':
          group.options["oneline"] = true;
          break;
        case 'halfspace':
          PartItemLineBreak(parent: group);
          break;
        case 'notrans':
          states.addCommand(ctx, (state) {
            state.arguments[0]!.options["transpose"] = false;
            group.children.add(state.arguments[0]!);
          }, 1, n);
          break;
        case 'textit':
          states.addCommand(ctx, (state) {
            state.arguments[0]!.options["italics"] = true;

            group.children.add(state.arguments[0]!);
          }, 1, n);
          break;
        case 'texttt':
          states.addCommand(ctx, (state) {
            state.arguments[0]!.options["texttype"] = true;

            group.children.add(state.arguments[0]!);
          }, 1, n);
          break;
        case 'echo':
        case 'crowd':
          states.addCommand(ctx, (state) {
            state.arguments[0]!.options["reply"] = true;

            group.children.add(state.arguments[0]!);
          }, 1, n);
          break;
        case 'translation':
          states.addCommand(ctx, (state) {
            state.arguments[0]!.options["translation"] = true;

            group.children.add(state.arguments[0]!);
          }, 1, n);
          break;
        case 'singer':
          states.addCommand(ctx, (state) {
            states.remove(state);
          }, 1, n);
          break;
        case 'indent':
        case 'quad':
          _addText('\t');
          break;
        case 'ifchorded':
          final group2 = PartItemGroup(parent: group);
          group = group2;
          group.options["show"] = "chorded";
          break;
        case 'fi':
          group = group.parent!;
          break;
        default:
          print(ctx.children![1].text);

          break;
      }
    }
  }

  @override
  void exitElement(part_parser.ElementContext ctx) {
    if (states.isNotEmpty) {
      if (n == states.last.depth) {
        if (!ctx.children!.contains(states.last.context)) {
          if (group.children.lastOrNull != null) {
            states.addArgument(group.children.removeLast());
          }
        }
      }

      // if (states.last.context.parent!.parent == ctx.parent) {}
    }

    n -= 1;
  }

  @override
  void exitEveryRule(ParserRuleContext node) {}

  @override
  void exitPart(part_parser.PartContext ctx) {
    part!.format();
    if (group is! ChordsheetPart) {
      throw FormatException("Group must end as a ChordsheetPart");
    }
  }

  @override
  void exitPartcontent(part_parser.PartcontentContext ctx) {}

  @override
  void exitRaised(part_parser.RaisedContext ctx) {
    group = group.parent!;
  }

  @override
  void exitReg_group(part_parser.Reg_groupContext ctx) {
    group = group.parent!;
  }

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
    if (group.children.lastOrNull is PartItemText) {
      (group.children.last as PartItemText).text += text;
    } else {
      PartItemText(text, parent: group);
    }
  }

  @override
  void visitTerminal(TerminalNode node) {
    if (node.parent is part_parser.ElementContext) {
      switch (node.symbol.type) {
        case part_lexer.LatexPartLexer.TOKEN_PUNCTUATION: // fall through
        case part_lexer.LatexPartLexer.TOKEN_WORD: // fall through
        case part_lexer.LatexPartLexer.TOKEN_WS:
          _addText(node.text!);
          break;
        case part_lexer.LatexPartLexer.TOKEN_METRE_BAR:
          PartItemMeasure(parent: group);
      }
    }
  }
}

void parsePart(Chordsheet chordsheet, String text,
    [int? line = 0, int charPositionInLine = 0]) {
  final lexer = part_lexer.LatexPartLexer(InputStream.fromString(text));
  final tokenstream = CommonTokenStream(lexer);
  final parser = part_parser.LatexPartParser(tokenstream);

  final builder = PartBuilder(parent: chordsheet);
  Exception? exception;

  parser.addErrorListener(ExitErrorListener((msg, line2, charPositionInLine2) {
    exception = Exception([
      msg,
      line! + line2!,
      charPositionInLine2! + (line2 == 0 ? charPositionInLine : 0)
    ]);
  }));
  parser.addParseListener(builder);

  parser.part_();
  if (exception != null) throw exception!;
}
