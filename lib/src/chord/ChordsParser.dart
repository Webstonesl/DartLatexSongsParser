// Generated from Chords.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'ChordsListener.dart';
import 'ChordsBaseListener.dart';
const int RULE_testfile = 0, RULE_chord = 1, RULE_key = 2, RULE_mod = 3, 
          RULE_sus = 4, RULE_add = 5, RULE_maj = 6;
class ChordsParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_MAJ = 5, TOKEN_MIN = 6, TOKEN_SUS = 7, TOKEN_ADD = 8, 
                   TOKEN_DIM = 9, TOKEN_AUG = 10, TOKEN_NUMBER = 11, TOKEN_KEY = 12, 
                   TOKEN_OVER = 13;

  @override
  final List<String> ruleNames = [
    'testfile', 'chord', 'key', 'mod', 'sus', 'add', 'maj'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'\\n'", "'N.C'", "'.'", "'break'", null, null, "'sus'", "'add'", 
      "'dim'", null, null, null, "'/'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, "MAJ", "MIN", "SUS", "ADD", "DIM", "AUG", 
      "NUMBER", "KEY", "OVER"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'Chords.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  ChordsParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  TestfileContext testfile() {
    dynamic _localctx = TestfileContext(context, state);
    enterRule(_localctx, 0, RULE_testfile);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 19;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 4116) != 0)) {
        state = 14;
        chord();
        state = 15;
        match(TOKEN_T__0);
        state = 21;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 22;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ChordContext chord() {
    dynamic _localctx = ChordContext(context, state);
    enterRule(_localctx, 2, RULE_chord);
    int _la;
    try {
      state = 35;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_KEY:
        enterOuterAlt(_localctx, 1);
        state = 24;
        key();
        state = 25;
        mod();
        state = 28;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_OVER) {
          state = 26;
          match(TOKEN_OVER);
          state = 27;
          key();
        }

        break;
      case TOKEN_T__1:
        enterOuterAlt(_localctx, 2);
        state = 30;
        match(TOKEN_T__1);
        state = 32;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
        if (_la == TOKEN_T__2) {
          state = 31;
          match(TOKEN_T__2);
        }

        break;
      case TOKEN_T__3:
        enterOuterAlt(_localctx, 3);
        state = 34;
        match(TOKEN_T__3);
        break;
      default:
        throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  KeyContext key() {
    dynamic _localctx = KeyContext(context, state);
    enterRule(_localctx, 4, RULE_key);
    try {
      enterOuterAlt(_localctx, 1);
      state = 37;
      match(TOKEN_KEY);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ModContext mod() {
    dynamic _localctx = ModContext(context, state);
    enterRule(_localctx, 6, RULE_mod);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 48;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 4064) != 0)) {
        state = 46;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
        case TOKEN_NUMBER:
          state = 39;
          match(TOKEN_NUMBER);
          break;
        case TOKEN_MAJ:
          state = 40;
          maj();
          break;
        case TOKEN_MIN:
          state = 41;
          match(TOKEN_MIN);
          break;
        case TOKEN_SUS:
          state = 42;
          sus();
          break;
        case TOKEN_DIM:
          state = 43;
          match(TOKEN_DIM);
          break;
        case TOKEN_ADD:
          state = 44;
          add();
          break;
        case TOKEN_AUG:
          state = 45;
          match(TOKEN_AUG);
          break;
        default:
          throw NoViableAltException(this);
        }
        state = 50;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  SusContext sus() {
    dynamic _localctx = SusContext(context, state);
    enterRule(_localctx, 8, RULE_sus);
    try {
      enterOuterAlt(_localctx, 1);
      state = 51;
      match(TOKEN_SUS);
      state = 53;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 6, context)) {
      case 1:
        state = 52;
        match(TOKEN_NUMBER);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  AddContext add() {
    dynamic _localctx = AddContext(context, state);
    enterRule(_localctx, 10, RULE_add);
    try {
      enterOuterAlt(_localctx, 1);
      state = 55;
      match(TOKEN_ADD);
      state = 57;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 7, context)) {
      case 1:
        state = 56;
        match(TOKEN_NUMBER);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  MajContext maj() {
    dynamic _localctx = MajContext(context, state);
    enterRule(_localctx, 12, RULE_maj);
    try {
      enterOuterAlt(_localctx, 1);
      state = 59;
      match(TOKEN_MAJ);
      state = 61;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 8, context)) {
      case 1:
        state = 60;
        match(TOKEN_NUMBER);
        break;
      }
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  static const List<int> _serializedATN = [
      4,1,13,64,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,
      1,0,1,0,1,0,5,0,18,8,0,10,0,12,0,21,9,0,1,0,1,0,1,1,1,1,1,1,1,1,3,
      1,29,8,1,1,1,1,1,3,1,33,8,1,1,1,3,1,36,8,1,1,2,1,2,1,3,1,3,1,3,1,3,
      1,3,1,3,1,3,5,3,47,8,3,10,3,12,3,50,9,3,1,4,1,4,3,4,54,8,4,1,5,1,5,
      3,5,58,8,5,1,6,1,6,3,6,62,8,6,1,6,0,0,7,0,2,4,6,8,10,12,0,0,71,0,19,
      1,0,0,0,2,35,1,0,0,0,4,37,1,0,0,0,6,48,1,0,0,0,8,51,1,0,0,0,10,55,
      1,0,0,0,12,59,1,0,0,0,14,15,3,2,1,0,15,16,5,1,0,0,16,18,1,0,0,0,17,
      14,1,0,0,0,18,21,1,0,0,0,19,17,1,0,0,0,19,20,1,0,0,0,20,22,1,0,0,0,
      21,19,1,0,0,0,22,23,5,0,0,1,23,1,1,0,0,0,24,25,3,4,2,0,25,28,3,6,3,
      0,26,27,5,13,0,0,27,29,3,4,2,0,28,26,1,0,0,0,28,29,1,0,0,0,29,36,1,
      0,0,0,30,32,5,2,0,0,31,33,5,3,0,0,32,31,1,0,0,0,32,33,1,0,0,0,33,36,
      1,0,0,0,34,36,5,4,0,0,35,24,1,0,0,0,35,30,1,0,0,0,35,34,1,0,0,0,36,
      3,1,0,0,0,37,38,5,12,0,0,38,5,1,0,0,0,39,47,5,11,0,0,40,47,3,12,6,
      0,41,47,5,6,0,0,42,47,3,8,4,0,43,47,5,9,0,0,44,47,3,10,5,0,45,47,5,
      10,0,0,46,39,1,0,0,0,46,40,1,0,0,0,46,41,1,0,0,0,46,42,1,0,0,0,46,
      43,1,0,0,0,46,44,1,0,0,0,46,45,1,0,0,0,47,50,1,0,0,0,48,46,1,0,0,0,
      48,49,1,0,0,0,49,7,1,0,0,0,50,48,1,0,0,0,51,53,5,7,0,0,52,54,5,11,
      0,0,53,52,1,0,0,0,53,54,1,0,0,0,54,9,1,0,0,0,55,57,5,8,0,0,56,58,5,
      11,0,0,57,56,1,0,0,0,57,58,1,0,0,0,58,11,1,0,0,0,59,61,5,5,0,0,60,
      62,5,11,0,0,61,60,1,0,0,0,61,62,1,0,0,0,62,13,1,0,0,0,9,19,28,32,35,
      46,48,53,57,61
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class TestfileContext extends ParserRuleContext {
  TerminalNode? EOF() => getToken(ChordsParser.TOKEN_EOF, 0);
  List<ChordContext> chords() => getRuleContexts<ChordContext>();
  ChordContext? chord(int i) => getRuleContext<ChordContext>(i);
  TestfileContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_testfile;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterTestfile(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitTestfile(this);
  }
}

class ChordContext extends ParserRuleContext {
  List<KeyContext> keys() => getRuleContexts<KeyContext>();
  KeyContext? key(int i) => getRuleContext<KeyContext>(i);
  ModContext? mod() => getRuleContext<ModContext>(0);
  TerminalNode? OVER() => getToken(ChordsParser.TOKEN_OVER, 0);
  ChordContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_chord;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterChord(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitChord(this);
  }
}

class KeyContext extends ParserRuleContext {
  TerminalNode? KEY() => getToken(ChordsParser.TOKEN_KEY, 0);
  KeyContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_key;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterKey(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitKey(this);
  }
}

class ModContext extends ParserRuleContext {
  List<TerminalNode> NUMBERs() => getTokens(ChordsParser.TOKEN_NUMBER);
  TerminalNode? NUMBER(int i) => getToken(ChordsParser.TOKEN_NUMBER, i);
  List<MajContext> majs() => getRuleContexts<MajContext>();
  MajContext? maj(int i) => getRuleContext<MajContext>(i);
  List<TerminalNode> MINs() => getTokens(ChordsParser.TOKEN_MIN);
  TerminalNode? MIN(int i) => getToken(ChordsParser.TOKEN_MIN, i);
  List<SusContext> suss() => getRuleContexts<SusContext>();
  SusContext? sus(int i) => getRuleContext<SusContext>(i);
  List<TerminalNode> DIMs() => getTokens(ChordsParser.TOKEN_DIM);
  TerminalNode? DIM(int i) => getToken(ChordsParser.TOKEN_DIM, i);
  List<AddContext> adds() => getRuleContexts<AddContext>();
  AddContext? add(int i) => getRuleContext<AddContext>(i);
  List<TerminalNode> AUGs() => getTokens(ChordsParser.TOKEN_AUG);
  TerminalNode? AUG(int i) => getToken(ChordsParser.TOKEN_AUG, i);
  ModContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_mod;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterMod(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitMod(this);
  }
}

class SusContext extends ParserRuleContext {
  TerminalNode? SUS() => getToken(ChordsParser.TOKEN_SUS, 0);
  TerminalNode? NUMBER() => getToken(ChordsParser.TOKEN_NUMBER, 0);
  SusContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_sus;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterSus(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitSus(this);
  }
}

class AddContext extends ParserRuleContext {
  TerminalNode? ADD() => getToken(ChordsParser.TOKEN_ADD, 0);
  TerminalNode? NUMBER() => getToken(ChordsParser.TOKEN_NUMBER, 0);
  AddContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_add;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterAdd(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitAdd(this);
  }
}

class MajContext extends ParserRuleContext {
  TerminalNode? MAJ() => getToken(ChordsParser.TOKEN_MAJ, 0);
  TerminalNode? NUMBER() => getToken(ChordsParser.TOKEN_NUMBER, 0);
  MajContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_maj;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.enterMaj(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is ChordsListener) listener.exitMaj(this);
  }
}

