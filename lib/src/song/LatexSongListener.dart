// Generated from LatexSong.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'LatexSongParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [LatexSongParser].
abstract class LatexSongListener extends ParseTreeListener {
  /// Enter a parse tree produced by [LatexSongParser.prog].
  /// [ctx] the parse tree
  void enterProg(ProgContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.prog].
  /// [ctx] the parse tree
  void exitProg(ProgContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.song].
  /// [ctx] the parse tree
  void enterSong(SongContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.song].
  /// [ctx] the parse tree
  void exitSong(SongContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.reg_group].
  /// [ctx] the parse tree
  void enterReg_group(Reg_groupContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.reg_group].
  /// [ctx] the parse tree
  void exitReg_group(Reg_groupContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.sub_group].
  /// [ctx] the parse tree
  void enterSub_group(Sub_groupContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.sub_group].
  /// [ctx] the parse tree
  void exitSub_group(Sub_groupContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.keyvaluelist].
  /// [ctx] the parse tree
  void enterKeyvaluelist(KeyvaluelistContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.keyvaluelist].
  /// [ctx] the parse tree
  void exitKeyvaluelist(KeyvaluelistContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.kvelement].
  /// [ctx] the parse tree
  void enterKvelement(KvelementContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.kvelement].
  /// [ctx] the parse tree
  void exitKvelement(KvelementContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.element].
  /// [ctx] the parse tree
  void enterElement(ElementContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.element].
  /// [ctx] the parse tree
  void exitElement(ElementContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.command].
  /// [ctx] the parse tree
  void enterCommand(CommandContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.command].
  /// [ctx] the parse tree
  void exitCommand(CommandContext ctx);

  /// Enter a parse tree produced by [LatexSongParser.song_part].
  /// [ctx] the parse tree
  void enterSong_part(Song_partContext ctx);

  /// Exit a parse tree produced by [LatexSongParser.song_part].
  /// [ctx] the parse tree
  void exitSong_part(Song_partContext ctx);
}
