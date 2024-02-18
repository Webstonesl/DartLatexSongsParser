// Generated from LatexPart.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'LatexPartListener.dart';
import 'LatexPartBaseListener.dart';
const int RULE_part = 0, RULE_partcontent = 1, RULE_element = 2, RULE_raised = 3, 
          RULE_command = 4, RULE_reg_group = 5;
class LatexPartParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_PART_BEGIN = 2, TOKEN_PART_END = 3, 
                   TOKEN_GROUP_START = 4, TOKEN_GROUP_END = 5, TOKEN_OPEN_RAISED = 6, 
                   TOKEN_CLOSE_RAISED = 7, TOKEN_METRE_BAR = 8, TOKEN_PUNCTUATION = 9, 
                   TOKEN_WORD = 10, TOKEN_WS = 11, TOKEN_COMMENT = 12;

  @override
  final List<String> ruleNames = [
    'part', 'partcontent', 'element', 'raised', 'command', 'reg_group'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'\\'", null, null, "'{'", "'}'", "'\\['", "']'", "'|'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, "PART_BEGIN", "PART_END", "GROUP_START", "GROUP_END", 
      "OPEN_RAISED", "CLOSE_RAISED", "METRE_BAR", "PUNCTUATION", "WORD", 
      "WS", "COMMENT"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'LatexPart.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  LatexPartParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  PartContext part_() {
    dynamic _localctx = PartContext(context, state);
    enterRule(_localctx, 0, RULE_part);
    try {
      enterOuterAlt(_localctx, 1);
      state = 12;
      match(TOKEN_PART_BEGIN);
      state = 13;
      partcontent();
      state = 14;
      match(TOKEN_PART_END);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  PartcontentContext partcontent() {
    dynamic _localctx = PartcontentContext(context, state);
    enterRule(_localctx, 2, RULE_partcontent);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 17; 
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      do {
        state = 16;
        element();
        state = 19; 
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      } while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 3922) != 0));
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  ElementContext element() {
    dynamic _localctx = ElementContext(context, state);
    enterRule(_localctx, 4, RULE_element);
    int _la;
    try {
      int _alt;
      state = 30;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 2, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 21;
        raised();
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 22;
        command();
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 24; 
        errorHandler.sync(this);
        _alt = 1;
        do {
          switch (_alt) {
          case 1:
            state = 23;
            _la = tokenStream.LA(1)!;
            if (!((((_la) & ~0x3f) == 0 && ((1 << _la) & 3584) != 0))) {
            errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            break;
          default:
            throw NoViableAltException(this);
          }
          state = 26; 
          errorHandler.sync(this);
          _alt = interpreter!.adaptivePredict(tokenStream, 1, context);
        } while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER);
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 28;
        reg_group();
        break;
      case 5:
        enterOuterAlt(_localctx, 5);
        state = 29;
        match(TOKEN_METRE_BAR);
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

  RaisedContext raised() {
    dynamic _localctx = RaisedContext(context, state);
    enterRule(_localctx, 6, RULE_raised);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 32;
      match(TOKEN_OPEN_RAISED);
      state = 34; 
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      do {
        state = 33;
        element();
        state = 36; 
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      } while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 3922) != 0));
      state = 38;
      match(TOKEN_CLOSE_RAISED);
    } on RecognitionException catch (re) {
      _localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return _localctx;
  }

  CommandContext command() {
    dynamic _localctx = CommandContext(context, state);
    enterRule(_localctx, 8, RULE_command);
    try {
      state = 45;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 4, context)) {
      case 1:
        enterOuterAlt(_localctx, 1);
        state = 40;
        match(TOKEN_T__0);
        state = 41;
        match(TOKEN_WORD);
        break;
      case 2:
        enterOuterAlt(_localctx, 2);
        state = 42;
        match(TOKEN_PUNCTUATION);
        break;
      case 3:
        enterOuterAlt(_localctx, 3);
        state = 43;
        match(TOKEN_T__0);
        break;
      case 4:
        enterOuterAlt(_localctx, 4);
        state = 44;
        match(TOKEN_WS);
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

  Reg_groupContext reg_group() {
    dynamic _localctx = Reg_groupContext(context, state);
    enterRule(_localctx, 10, RULE_reg_group);
    int _la;
    try {
      enterOuterAlt(_localctx, 1);
      state = 47;
      match(TOKEN_GROUP_START);
      state = 51;
      errorHandler.sync(this);
      _la = tokenStream.LA(1)!;
      while ((((_la) & ~0x3f) == 0 && ((1 << _la) & 3922) != 0)) {
        state = 48;
        element();
        state = 53;
        errorHandler.sync(this);
        _la = tokenStream.LA(1)!;
      }
      state = 54;
      match(TOKEN_GROUP_END);
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
      4,1,12,57,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,1,0,1,0,
      1,0,1,0,1,1,4,1,18,8,1,11,1,12,1,19,1,2,1,2,1,2,4,2,25,8,2,11,2,12,
      2,26,1,2,1,2,3,2,31,8,2,1,3,1,3,4,3,35,8,3,11,3,12,3,36,1,3,1,3,1,
      4,1,4,1,4,1,4,1,4,3,4,46,8,4,1,5,1,5,5,5,50,8,5,10,5,12,5,53,9,5,1,
      5,1,5,1,5,0,0,6,0,2,4,6,8,10,0,1,1,0,9,11,61,0,12,1,0,0,0,2,17,1,0,
      0,0,4,30,1,0,0,0,6,32,1,0,0,0,8,45,1,0,0,0,10,47,1,0,0,0,12,13,5,2,
      0,0,13,14,3,2,1,0,14,15,5,3,0,0,15,1,1,0,0,0,16,18,3,4,2,0,17,16,1,
      0,0,0,18,19,1,0,0,0,19,17,1,0,0,0,19,20,1,0,0,0,20,3,1,0,0,0,21,31,
      3,6,3,0,22,31,3,8,4,0,23,25,7,0,0,0,24,23,1,0,0,0,25,26,1,0,0,0,26,
      24,1,0,0,0,26,27,1,0,0,0,27,31,1,0,0,0,28,31,3,10,5,0,29,31,5,8,0,
      0,30,21,1,0,0,0,30,22,1,0,0,0,30,24,1,0,0,0,30,28,1,0,0,0,30,29,1,
      0,0,0,31,5,1,0,0,0,32,34,5,6,0,0,33,35,3,4,2,0,34,33,1,0,0,0,35,36,
      1,0,0,0,36,34,1,0,0,0,36,37,1,0,0,0,37,38,1,0,0,0,38,39,5,7,0,0,39,
      7,1,0,0,0,40,41,5,1,0,0,41,46,5,10,0,0,42,46,5,9,0,0,43,46,5,1,0,0,
      44,46,5,11,0,0,45,40,1,0,0,0,45,42,1,0,0,0,45,43,1,0,0,0,45,44,1,0,
      0,0,46,9,1,0,0,0,47,51,5,4,0,0,48,50,3,4,2,0,49,48,1,0,0,0,50,53,1,
      0,0,0,51,49,1,0,0,0,51,52,1,0,0,0,52,54,1,0,0,0,53,51,1,0,0,0,54,55,
      5,5,0,0,55,11,1,0,0,0,6,19,26,30,36,45,51
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class PartContext extends ParserRuleContext {
  TerminalNode? PART_BEGIN() => getToken(LatexPartParser.TOKEN_PART_BEGIN, 0);
  PartcontentContext? partcontent() => getRuleContext<PartcontentContext>(0);
  TerminalNode? PART_END() => getToken(LatexPartParser.TOKEN_PART_END, 0);
  PartContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_part;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.enterPart(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.exitPart(this);
  }
}

class PartcontentContext extends ParserRuleContext {
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  PartcontentContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_partcontent;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.enterPartcontent(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.exitPartcontent(this);
  }
}

class ElementContext extends ParserRuleContext {
  RaisedContext? raised() => getRuleContext<RaisedContext>(0);
  CommandContext? command() => getRuleContext<CommandContext>(0);
  List<TerminalNode> WORDs() => getTokens(LatexPartParser.TOKEN_WORD);
  TerminalNode? WORD(int i) => getToken(LatexPartParser.TOKEN_WORD, i);
  List<TerminalNode> WSs() => getTokens(LatexPartParser.TOKEN_WS);
  TerminalNode? WS(int i) => getToken(LatexPartParser.TOKEN_WS, i);
  List<TerminalNode> PUNCTUATIONs() => getTokens(LatexPartParser.TOKEN_PUNCTUATION);
  TerminalNode? PUNCTUATION(int i) => getToken(LatexPartParser.TOKEN_PUNCTUATION, i);
  Reg_groupContext? reg_group() => getRuleContext<Reg_groupContext>(0);
  TerminalNode? METRE_BAR() => getToken(LatexPartParser.TOKEN_METRE_BAR, 0);
  ElementContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_element;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.enterElement(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.exitElement(this);
  }
}

class RaisedContext extends ParserRuleContext {
  TerminalNode? OPEN_RAISED() => getToken(LatexPartParser.TOKEN_OPEN_RAISED, 0);
  TerminalNode? CLOSE_RAISED() => getToken(LatexPartParser.TOKEN_CLOSE_RAISED, 0);
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  RaisedContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_raised;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.enterRaised(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.exitRaised(this);
  }
}

class CommandContext extends ParserRuleContext {
  TerminalNode? WORD() => getToken(LatexPartParser.TOKEN_WORD, 0);
  TerminalNode? PUNCTUATION() => getToken(LatexPartParser.TOKEN_PUNCTUATION, 0);
  TerminalNode? WS() => getToken(LatexPartParser.TOKEN_WS, 0);
  CommandContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_command;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.enterCommand(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.exitCommand(this);
  }
}

class Reg_groupContext extends ParserRuleContext {
  TerminalNode? GROUP_START() => getToken(LatexPartParser.TOKEN_GROUP_START, 0);
  TerminalNode? GROUP_END() => getToken(LatexPartParser.TOKEN_GROUP_END, 0);
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  Reg_groupContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_reg_group;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.enterReg_group(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexPartListener) listener.exitReg_group(this);
  }
}

