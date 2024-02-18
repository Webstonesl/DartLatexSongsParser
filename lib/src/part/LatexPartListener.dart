// Generated from LatexPart.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'LatexPartParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [LatexPartParser].
abstract class LatexPartListener extends ParseTreeListener {
  /// Enter a parse tree produced by [LatexPartParser.part].
  /// [ctx] the parse tree
  void enterPart(PartContext ctx);
  /// Exit a parse tree produced by [LatexPartParser.part].
  /// [ctx] the parse tree
  void exitPart(PartContext ctx);

  /// Enter a parse tree produced by [LatexPartParser.partcontent].
  /// [ctx] the parse tree
  void enterPartcontent(PartcontentContext ctx);
  /// Exit a parse tree produced by [LatexPartParser.partcontent].
  /// [ctx] the parse tree
  void exitPartcontent(PartcontentContext ctx);

  /// Enter a parse tree produced by [LatexPartParser.element].
  /// [ctx] the parse tree
  void enterElement(ElementContext ctx);
  /// Exit a parse tree produced by [LatexPartParser.element].
  /// [ctx] the parse tree
  void exitElement(ElementContext ctx);

  /// Enter a parse tree produced by [LatexPartParser.raised].
  /// [ctx] the parse tree
  void enterRaised(RaisedContext ctx);
  /// Exit a parse tree produced by [LatexPartParser.raised].
  /// [ctx] the parse tree
  void exitRaised(RaisedContext ctx);

  /// Enter a parse tree produced by [LatexPartParser.command].
  /// [ctx] the parse tree
  void enterCommand(CommandContext ctx);
  /// Exit a parse tree produced by [LatexPartParser.command].
  /// [ctx] the parse tree
  void exitCommand(CommandContext ctx);

  /// Enter a parse tree produced by [LatexPartParser.reg_group].
  /// [ctx] the parse tree
  void enterReg_group(Reg_groupContext ctx);
  /// Exit a parse tree produced by [LatexPartParser.reg_group].
  /// [ctx] the parse tree
  void exitReg_group(Reg_groupContext ctx);
}