// Generated from Chords.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'ChordsParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [ChordsParser].
abstract class ChordsListener extends ParseTreeListener {
  /// Enter a parse tree produced by [ChordsParser.testfile].
  /// [ctx] the parse tree
  void enterTestfile(TestfileContext ctx);
  /// Exit a parse tree produced by [ChordsParser.testfile].
  /// [ctx] the parse tree
  void exitTestfile(TestfileContext ctx);

  /// Enter a parse tree produced by [ChordsParser.chord].
  /// [ctx] the parse tree
  void enterChord(ChordContext ctx);
  /// Exit a parse tree produced by [ChordsParser.chord].
  /// [ctx] the parse tree
  void exitChord(ChordContext ctx);

  /// Enter a parse tree produced by [ChordsParser.key].
  /// [ctx] the parse tree
  void enterKey(KeyContext ctx);
  /// Exit a parse tree produced by [ChordsParser.key].
  /// [ctx] the parse tree
  void exitKey(KeyContext ctx);

  /// Enter a parse tree produced by [ChordsParser.mod].
  /// [ctx] the parse tree
  void enterMod(ModContext ctx);
  /// Exit a parse tree produced by [ChordsParser.mod].
  /// [ctx] the parse tree
  void exitMod(ModContext ctx);

  /// Enter a parse tree produced by [ChordsParser.sus].
  /// [ctx] the parse tree
  void enterSus(SusContext ctx);
  /// Exit a parse tree produced by [ChordsParser.sus].
  /// [ctx] the parse tree
  void exitSus(SusContext ctx);

  /// Enter a parse tree produced by [ChordsParser.add].
  /// [ctx] the parse tree
  void enterAdd(AddContext ctx);
  /// Exit a parse tree produced by [ChordsParser.add].
  /// [ctx] the parse tree
  void exitAdd(AddContext ctx);

  /// Enter a parse tree produced by [ChordsParser.maj].
  /// [ctx] the parse tree
  void enterMaj(MajContext ctx);
  /// Exit a parse tree produced by [ChordsParser.maj].
  /// [ctx] the parse tree
  void exitMaj(MajContext ctx);
}