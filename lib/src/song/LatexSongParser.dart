// Generated from LatexSong.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'LatexSongListener.dart';
import 'LatexSongBaseListener.dart';

const int RULE_prog = 0,
    RULE_song = 1,
    RULE_reg_group = 2,
    RULE_sub_group = 3,
    RULE_keyvaluelist = 4,
    RULE_kvelement = 5,
    RULE_element = 6,
    RULE_command = 7,
    RULE_song_part = 8;

class LatexSongParser extends Parser {
  static final checkVersion =
      () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache =
      PredictionContextCache();
  static const int TOKEN_T__0 = 1,
      TOKEN_SONG_BEGIN = 2,
      TOKEN_SONG_END = 3,
      TOKEN_SONG_PART = 4,
      TOKEN_REG_GROUP_OPEN = 5,
      TOKEN_SPECIALCHAR = 6,
      TOKEN_REG_GROUP_CLOSE = 7,
      TOKEN_SUB_GROUP_OPEN = 8,
      TOKEN_SUB_GROUP_CLOSE = 9,
      TOKEN_KV_SEPERATOR = 10,
      TOKEN_EQUALS = 11,
      TOKEN_MANUAL_NEW_LINE = 12,
      TOKEN_WORD = 13,
      TOKEN_PUNCTUATION = 14,
      TOKEN_ACCIDENTAL = 15,
      TOKEN_LETTER = 16,
      TOKEN_COMMENT = 17,
      TOKEN_DIGIT = 18,
      TOKEN_SPACE = 19;

  @override
  final List<String> ruleNames = [
    'prog',
    'song',
    'reg_group',
    'sub_group',
    'keyvaluelist',
    'kvelement',
    'element',
    'command',
    'song_part'
  ];

  static final List<String?> _LITERAL_NAMES = [
    null,
    "'\\'",
    "'\\beginsong'",
    "'\\endsong'",
    null,
    "'{'",
    null,
    "'}'",
    "'['",
    "']'",
    "','",
    null,
    "'\\\\'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
    null,
    null,
    "SONG_BEGIN",
    "SONG_END",
    "SONG_PART",
    "REG_GROUP_OPEN",
    "SPECIALCHAR",
    "REG_GROUP_CLOSE",
    "SUB_GROUP_OPEN",
    "SUB_GROUP_CLOSE",
    "KV_SEPERATOR",
    "EQUALS",
    "MANUAL_NEW_LINE",
    "WORD",
    "PUNCTUATION",
    "ACCIDENTAL",
    "LETTER",
    "COMMENT",
    "DIGIT",
    "SPACE"
  ];
  static final Vocabulary VOCABULARY =
      VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }

  @override
  String get grammarFileName => 'LatexSong.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
    return _ATN;
  }

  LatexSongParser(super.input) {
    interpreter =
        ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ProgContext prog() {
    dynamic localctx = ProgContext(context, state);
    enterRule(localctx, 0, RULE_prog);
    int la;
    try {
      int alt;
      enterOuterAlt(localctx, 1);
      state = 21;
      errorHandler.sync(this);
      alt = interpreter!.adaptivePredict(tokenStream, 0, context);
      while (alt != 2 && alt != ATN.INVALID_ALT_NUMBER) {
        if (alt == 1) {
          state = 18;
          match(TOKEN_SPACE);
        }
        state = 23;
        errorHandler.sync(this);
        alt = interpreter!.adaptivePredict(tokenStream, 0, context);
      }
      state = 27;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while (la == TOKEN_SONG_BEGIN) {
        state = 24;
        song();
        state = 29;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
      state = 33;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while (la == TOKEN_SPACE) {
        state = 30;
        match(TOKEN_SPACE);
        state = 35;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
      state = 36;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  SongContext song() {
    dynamic localctx = SongContext(context, state);
    enterRule(localctx, 2, RULE_song);
    int la;
    try {
      int alt;
      enterOuterAlt(localctx, 1);
      state = 38;
      match(TOKEN_SONG_BEGIN);
      state = 39;
      element();
      state = 43;
      errorHandler.sync(this);
      alt = interpreter!.adaptivePredict(tokenStream, 3, context);
      while (alt != 2 && alt != ATN.INVALID_ALT_NUMBER) {
        if (alt == 1) {
          state = 40;
          match(TOKEN_SPACE);
        }
        state = 45;
        errorHandler.sync(this);
        alt = interpreter!.adaptivePredict(tokenStream, 3, context);
      }
      state = 47;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 4, context)) {
        case 1:
          state = 46;
          sub_group();
          break;
      }
      state = 53;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while ((((la) & ~0x3f) == 0 && ((1 << la) & 554354) != 0)) {
        state = 51;
        errorHandler.sync(this);
        switch (tokenStream.LA(1)!) {
          case TOKEN_SONG_PART:
            state = 49;
            song_part();
            break;
          case TOKEN_T__0:
          case TOKEN_REG_GROUP_OPEN:
          case TOKEN_SPECIALCHAR:
          case TOKEN_SUB_GROUP_OPEN:
          case TOKEN_KV_SEPERATOR:
          case TOKEN_MANUAL_NEW_LINE:
          case TOKEN_WORD:
          case TOKEN_PUNCTUATION:
          case TOKEN_SPACE:
            state = 50;
            element();
            break;
          default:
            throw NoViableAltException(this);
        }
        state = 55;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
      state = 56;
      match(TOKEN_SONG_END);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  Reg_groupContext reg_group() {
    dynamic localctx = Reg_groupContext(context, state);
    enterRule(localctx, 4, RULE_reg_group);
    int la;
    try {
      enterOuterAlt(localctx, 1);
      state = 58;
      match(TOKEN_REG_GROUP_OPEN);
      state = 62;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while ((((la) & ~0x3f) == 0 && ((1 << la) & 554338) != 0)) {
        state = 59;
        element();
        state = 64;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
      state = 65;
      match(TOKEN_REG_GROUP_CLOSE);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  Sub_groupContext sub_group() {
    dynamic localctx = Sub_groupContext(context, state);
    enterRule(localctx, 6, RULE_sub_group);
    int la;
    try {
      enterOuterAlt(localctx, 1);
      state = 67;
      match(TOKEN_SUB_GROUP_OPEN);
      state = 75;
      errorHandler.sync(this);
      switch (interpreter!.adaptivePredict(tokenStream, 9, context)) {
        case 1:
          state = 68;
          keyvaluelist();
          break;
        case 2:
          state = 72;
          errorHandler.sync(this);
          la = tokenStream.LA(1)!;
          while ((((la) & ~0x3f) == 0 && ((1 << la) & 554338) != 0)) {
            state = 69;
            element();
            state = 74;
            errorHandler.sync(this);
            la = tokenStream.LA(1)!;
          }
          break;
      }
      state = 77;
      match(TOKEN_SUB_GROUP_CLOSE);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  KeyvaluelistContext keyvaluelist() {
    dynamic localctx = KeyvaluelistContext(context, state);
    enterRule(localctx, 8, RULE_keyvaluelist);
    int la;
    try {
      enterOuterAlt(localctx, 1);
      state = 79;
      kvelement();
      state = 84;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while (la == TOKEN_KV_SEPERATOR) {
        state = 80;
        match(TOKEN_KV_SEPERATOR);
        state = 81;
        kvelement();
        state = 86;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  KvelementContext kvelement() {
    dynamic localctx = KvelementContext(context, state);
    enterRule(localctx, 10, RULE_kvelement);
    int la;
    try {
      int alt;
      enterOuterAlt(localctx, 1);
      state = 90;
      errorHandler.sync(this);
      alt = interpreter!.adaptivePredict(tokenStream, 11, context);
      while (alt != 2 && alt != ATN.INVALID_ALT_NUMBER) {
        if (alt == 1) {
          state = 87;
          match(TOKEN_SPACE);
        }
        state = 92;
        errorHandler.sync(this);
        alt = interpreter!.adaptivePredict(tokenStream, 11, context);
      }
      state = 93;
      element();
      state = 97;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while (la == TOKEN_SPACE) {
        state = 94;
        match(TOKEN_SPACE);
        state = 99;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
      state = 100;
      match(TOKEN_EQUALS);
      state = 104;
      errorHandler.sync(this);
      alt = interpreter!.adaptivePredict(tokenStream, 13, context);
      while (alt != 2 && alt != ATN.INVALID_ALT_NUMBER) {
        if (alt == 1) {
          state = 101;
          match(TOKEN_SPACE);
        }
        state = 106;
        errorHandler.sync(this);
        alt = interpreter!.adaptivePredict(tokenStream, 13, context);
      }
      state = 107;
      element();
      state = 111;
      errorHandler.sync(this);
      la = tokenStream.LA(1)!;
      while (la == TOKEN_SPACE) {
        state = 108;
        match(TOKEN_SPACE);
        state = 113;
        errorHandler.sync(this);
        la = tokenStream.LA(1)!;
      }
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  ElementContext element() {
    dynamic localctx = ElementContext(context, state);
    enterRule(localctx, 12, RULE_element);
    try {
      enterOuterAlt(localctx, 1);
      state = 123;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
        case TOKEN_T__0:
          state = 114;
          command();
          break;
        case TOKEN_SPECIALCHAR:
          state = 115;
          match(TOKEN_SPECIALCHAR);
          break;
        case TOKEN_WORD:
          state = 116;
          match(TOKEN_WORD);
          break;
        case TOKEN_SPACE:
          state = 117;
          match(TOKEN_SPACE);
          break;
        case TOKEN_REG_GROUP_OPEN:
          state = 118;
          reg_group();
          break;
        case TOKEN_SUB_GROUP_OPEN:
          state = 119;
          sub_group();
          break;
        case TOKEN_PUNCTUATION:
          state = 120;
          match(TOKEN_PUNCTUATION);
          break;
        case TOKEN_KV_SEPERATOR:
          state = 121;
          match(TOKEN_KV_SEPERATOR);
          break;
        case TOKEN_MANUAL_NEW_LINE:
          state = 122;
          match(TOKEN_MANUAL_NEW_LINE);
          break;
        default:
          throw NoViableAltException(this);
      }
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  CommandContext command() {
    dynamic localctx = CommandContext(context, state);
    enterRule(localctx, 14, RULE_command);
    try {
      int alt;
      enterOuterAlt(localctx, 1);
      state = 125;
      match(TOKEN_T__0);
      state = 127;
      errorHandler.sync(this);
      alt = 1;
      do {
        switch (alt) {
          case 1:
            state = 126;
            match(TOKEN_WORD);
            break;
          default:
            throw NoViableAltException(this);
        }
        state = 129;
        errorHandler.sync(this);
        alt = interpreter!.adaptivePredict(tokenStream, 16, context);
      } while (alt != 2 && alt != ATN.INVALID_ALT_NUMBER);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  Song_partContext song_part() {
    dynamic localctx = Song_partContext(context, state);
    enterRule(localctx, 16, RULE_song_part);
    try {
      enterOuterAlt(localctx, 1);
      state = 131;
      match(TOKEN_SONG_PART);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  static const List<int> _serializedATN = [
    4,
    1,
    19,
    134,
    2,
    0,
    7,
    0,
    2,
    1,
    7,
    1,
    2,
    2,
    7,
    2,
    2,
    3,
    7,
    3,
    2,
    4,
    7,
    4,
    2,
    5,
    7,
    5,
    2,
    6,
    7,
    6,
    2,
    7,
    7,
    7,
    2,
    8,
    7,
    8,
    1,
    0,
    5,
    0,
    20,
    8,
    0,
    10,
    0,
    12,
    0,
    23,
    9,
    0,
    1,
    0,
    5,
    0,
    26,
    8,
    0,
    10,
    0,
    12,
    0,
    29,
    9,
    0,
    1,
    0,
    5,
    0,
    32,
    8,
    0,
    10,
    0,
    12,
    0,
    35,
    9,
    0,
    1,
    0,
    1,
    0,
    1,
    1,
    1,
    1,
    1,
    1,
    5,
    1,
    42,
    8,
    1,
    10,
    1,
    12,
    1,
    45,
    9,
    1,
    1,
    1,
    3,
    1,
    48,
    8,
    1,
    1,
    1,
    1,
    1,
    5,
    1,
    52,
    8,
    1,
    10,
    1,
    12,
    1,
    55,
    9,
    1,
    1,
    1,
    1,
    1,
    1,
    2,
    1,
    2,
    5,
    2,
    61,
    8,
    2,
    10,
    2,
    12,
    2,
    64,
    9,
    2,
    1,
    2,
    1,
    2,
    1,
    3,
    1,
    3,
    1,
    3,
    5,
    3,
    71,
    8,
    3,
    10,
    3,
    12,
    3,
    74,
    9,
    3,
    3,
    3,
    76,
    8,
    3,
    1,
    3,
    1,
    3,
    1,
    4,
    1,
    4,
    1,
    4,
    5,
    4,
    83,
    8,
    4,
    10,
    4,
    12,
    4,
    86,
    9,
    4,
    1,
    5,
    5,
    5,
    89,
    8,
    5,
    10,
    5,
    12,
    5,
    92,
    9,
    5,
    1,
    5,
    1,
    5,
    5,
    5,
    96,
    8,
    5,
    10,
    5,
    12,
    5,
    99,
    9,
    5,
    1,
    5,
    1,
    5,
    5,
    5,
    103,
    8,
    5,
    10,
    5,
    12,
    5,
    106,
    9,
    5,
    1,
    5,
    1,
    5,
    5,
    5,
    110,
    8,
    5,
    10,
    5,
    12,
    5,
    113,
    9,
    5,
    1,
    6,
    1,
    6,
    1,
    6,
    1,
    6,
    1,
    6,
    1,
    6,
    1,
    6,
    1,
    6,
    1,
    6,
    3,
    6,
    124,
    8,
    6,
    1,
    7,
    1,
    7,
    4,
    7,
    128,
    8,
    7,
    11,
    7,
    12,
    7,
    129,
    1,
    8,
    1,
    8,
    1,
    8,
    0,
    0,
    9,
    0,
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    16,
    0,
    0,
    148,
    0,
    21,
    1,
    0,
    0,
    0,
    2,
    38,
    1,
    0,
    0,
    0,
    4,
    58,
    1,
    0,
    0,
    0,
    6,
    67,
    1,
    0,
    0,
    0,
    8,
    79,
    1,
    0,
    0,
    0,
    10,
    90,
    1,
    0,
    0,
    0,
    12,
    123,
    1,
    0,
    0,
    0,
    14,
    125,
    1,
    0,
    0,
    0,
    16,
    131,
    1,
    0,
    0,
    0,
    18,
    20,
    5,
    19,
    0,
    0,
    19,
    18,
    1,
    0,
    0,
    0,
    20,
    23,
    1,
    0,
    0,
    0,
    21,
    19,
    1,
    0,
    0,
    0,
    21,
    22,
    1,
    0,
    0,
    0,
    22,
    27,
    1,
    0,
    0,
    0,
    23,
    21,
    1,
    0,
    0,
    0,
    24,
    26,
    3,
    2,
    1,
    0,
    25,
    24,
    1,
    0,
    0,
    0,
    26,
    29,
    1,
    0,
    0,
    0,
    27,
    25,
    1,
    0,
    0,
    0,
    27,
    28,
    1,
    0,
    0,
    0,
    28,
    33,
    1,
    0,
    0,
    0,
    29,
    27,
    1,
    0,
    0,
    0,
    30,
    32,
    5,
    19,
    0,
    0,
    31,
    30,
    1,
    0,
    0,
    0,
    32,
    35,
    1,
    0,
    0,
    0,
    33,
    31,
    1,
    0,
    0,
    0,
    33,
    34,
    1,
    0,
    0,
    0,
    34,
    36,
    1,
    0,
    0,
    0,
    35,
    33,
    1,
    0,
    0,
    0,
    36,
    37,
    5,
    0,
    0,
    1,
    37,
    1,
    1,
    0,
    0,
    0,
    38,
    39,
    5,
    2,
    0,
    0,
    39,
    43,
    3,
    12,
    6,
    0,
    40,
    42,
    5,
    19,
    0,
    0,
    41,
    40,
    1,
    0,
    0,
    0,
    42,
    45,
    1,
    0,
    0,
    0,
    43,
    41,
    1,
    0,
    0,
    0,
    43,
    44,
    1,
    0,
    0,
    0,
    44,
    47,
    1,
    0,
    0,
    0,
    45,
    43,
    1,
    0,
    0,
    0,
    46,
    48,
    3,
    6,
    3,
    0,
    47,
    46,
    1,
    0,
    0,
    0,
    47,
    48,
    1,
    0,
    0,
    0,
    48,
    53,
    1,
    0,
    0,
    0,
    49,
    52,
    3,
    16,
    8,
    0,
    50,
    52,
    3,
    12,
    6,
    0,
    51,
    49,
    1,
    0,
    0,
    0,
    51,
    50,
    1,
    0,
    0,
    0,
    52,
    55,
    1,
    0,
    0,
    0,
    53,
    51,
    1,
    0,
    0,
    0,
    53,
    54,
    1,
    0,
    0,
    0,
    54,
    56,
    1,
    0,
    0,
    0,
    55,
    53,
    1,
    0,
    0,
    0,
    56,
    57,
    5,
    3,
    0,
    0,
    57,
    3,
    1,
    0,
    0,
    0,
    58,
    62,
    5,
    5,
    0,
    0,
    59,
    61,
    3,
    12,
    6,
    0,
    60,
    59,
    1,
    0,
    0,
    0,
    61,
    64,
    1,
    0,
    0,
    0,
    62,
    60,
    1,
    0,
    0,
    0,
    62,
    63,
    1,
    0,
    0,
    0,
    63,
    65,
    1,
    0,
    0,
    0,
    64,
    62,
    1,
    0,
    0,
    0,
    65,
    66,
    5,
    7,
    0,
    0,
    66,
    5,
    1,
    0,
    0,
    0,
    67,
    75,
    5,
    8,
    0,
    0,
    68,
    76,
    3,
    8,
    4,
    0,
    69,
    71,
    3,
    12,
    6,
    0,
    70,
    69,
    1,
    0,
    0,
    0,
    71,
    74,
    1,
    0,
    0,
    0,
    72,
    70,
    1,
    0,
    0,
    0,
    72,
    73,
    1,
    0,
    0,
    0,
    73,
    76,
    1,
    0,
    0,
    0,
    74,
    72,
    1,
    0,
    0,
    0,
    75,
    68,
    1,
    0,
    0,
    0,
    75,
    72,
    1,
    0,
    0,
    0,
    76,
    77,
    1,
    0,
    0,
    0,
    77,
    78,
    5,
    9,
    0,
    0,
    78,
    7,
    1,
    0,
    0,
    0,
    79,
    84,
    3,
    10,
    5,
    0,
    80,
    81,
    5,
    10,
    0,
    0,
    81,
    83,
    3,
    10,
    5,
    0,
    82,
    80,
    1,
    0,
    0,
    0,
    83,
    86,
    1,
    0,
    0,
    0,
    84,
    82,
    1,
    0,
    0,
    0,
    84,
    85,
    1,
    0,
    0,
    0,
    85,
    9,
    1,
    0,
    0,
    0,
    86,
    84,
    1,
    0,
    0,
    0,
    87,
    89,
    5,
    19,
    0,
    0,
    88,
    87,
    1,
    0,
    0,
    0,
    89,
    92,
    1,
    0,
    0,
    0,
    90,
    88,
    1,
    0,
    0,
    0,
    90,
    91,
    1,
    0,
    0,
    0,
    91,
    93,
    1,
    0,
    0,
    0,
    92,
    90,
    1,
    0,
    0,
    0,
    93,
    97,
    3,
    12,
    6,
    0,
    94,
    96,
    5,
    19,
    0,
    0,
    95,
    94,
    1,
    0,
    0,
    0,
    96,
    99,
    1,
    0,
    0,
    0,
    97,
    95,
    1,
    0,
    0,
    0,
    97,
    98,
    1,
    0,
    0,
    0,
    98,
    100,
    1,
    0,
    0,
    0,
    99,
    97,
    1,
    0,
    0,
    0,
    100,
    104,
    5,
    11,
    0,
    0,
    101,
    103,
    5,
    19,
    0,
    0,
    102,
    101,
    1,
    0,
    0,
    0,
    103,
    106,
    1,
    0,
    0,
    0,
    104,
    102,
    1,
    0,
    0,
    0,
    104,
    105,
    1,
    0,
    0,
    0,
    105,
    107,
    1,
    0,
    0,
    0,
    106,
    104,
    1,
    0,
    0,
    0,
    107,
    111,
    3,
    12,
    6,
    0,
    108,
    110,
    5,
    19,
    0,
    0,
    109,
    108,
    1,
    0,
    0,
    0,
    110,
    113,
    1,
    0,
    0,
    0,
    111,
    109,
    1,
    0,
    0,
    0,
    111,
    112,
    1,
    0,
    0,
    0,
    112,
    11,
    1,
    0,
    0,
    0,
    113,
    111,
    1,
    0,
    0,
    0,
    114,
    124,
    3,
    14,
    7,
    0,
    115,
    124,
    5,
    6,
    0,
    0,
    116,
    124,
    5,
    13,
    0,
    0,
    117,
    124,
    5,
    19,
    0,
    0,
    118,
    124,
    3,
    4,
    2,
    0,
    119,
    124,
    3,
    6,
    3,
    0,
    120,
    124,
    5,
    14,
    0,
    0,
    121,
    124,
    5,
    10,
    0,
    0,
    122,
    124,
    5,
    12,
    0,
    0,
    123,
    114,
    1,
    0,
    0,
    0,
    123,
    115,
    1,
    0,
    0,
    0,
    123,
    116,
    1,
    0,
    0,
    0,
    123,
    117,
    1,
    0,
    0,
    0,
    123,
    118,
    1,
    0,
    0,
    0,
    123,
    119,
    1,
    0,
    0,
    0,
    123,
    120,
    1,
    0,
    0,
    0,
    123,
    121,
    1,
    0,
    0,
    0,
    123,
    122,
    1,
    0,
    0,
    0,
    124,
    13,
    1,
    0,
    0,
    0,
    125,
    127,
    5,
    1,
    0,
    0,
    126,
    128,
    5,
    13,
    0,
    0,
    127,
    126,
    1,
    0,
    0,
    0,
    128,
    129,
    1,
    0,
    0,
    0,
    129,
    127,
    1,
    0,
    0,
    0,
    129,
    130,
    1,
    0,
    0,
    0,
    130,
    15,
    1,
    0,
    0,
    0,
    131,
    132,
    5,
    4,
    0,
    0,
    132,
    17,
    1,
    0,
    0,
    0,
    17,
    21,
    27,
    33,
    43,
    47,
    51,
    53,
    62,
    72,
    75,
    84,
    90,
    97,
    104,
    111,
    123,
    129
  ];

  static final ATN _ATN = ATNDeserializer().deserialize(_serializedATN);
}

class ProgContext extends ParserRuleContext {
  TerminalNode? EOF() => getToken(LatexSongParser.TOKEN_EOF, 0);
  List<TerminalNode> SPACEs() => getTokens(LatexSongParser.TOKEN_SPACE);
  TerminalNode? SPACE(int i) => getToken(LatexSongParser.TOKEN_SPACE, i);
  List<SongContext> songs() => getRuleContexts<SongContext>();
  SongContext? song(int i) => getRuleContext<SongContext>(i);
  ProgContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_prog;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterProg(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitProg(this);
  }
}

class SongContext extends ParserRuleContext {
  TerminalNode? SONG_BEGIN() => getToken(LatexSongParser.TOKEN_SONG_BEGIN, 0);
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  TerminalNode? SONG_END() => getToken(LatexSongParser.TOKEN_SONG_END, 0);
  List<TerminalNode> SPACEs() => getTokens(LatexSongParser.TOKEN_SPACE);
  TerminalNode? SPACE(int i) => getToken(LatexSongParser.TOKEN_SPACE, i);
  Sub_groupContext? sub_group() => getRuleContext<Sub_groupContext>(0);
  List<Song_partContext> song_parts() => getRuleContexts<Song_partContext>();
  Song_partContext? song_part(int i) => getRuleContext<Song_partContext>(i);
  SongContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_song;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterSong(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitSong(this);
  }
}

class Reg_groupContext extends ParserRuleContext {
  TerminalNode? REG_GROUP_OPEN() =>
      getToken(LatexSongParser.TOKEN_REG_GROUP_OPEN, 0);
  TerminalNode? REG_GROUP_CLOSE() =>
      getToken(LatexSongParser.TOKEN_REG_GROUP_CLOSE, 0);
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  Reg_groupContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_reg_group;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterReg_group(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitReg_group(this);
  }
}

class Sub_groupContext extends ParserRuleContext {
  TerminalNode? SUB_GROUP_OPEN() =>
      getToken(LatexSongParser.TOKEN_SUB_GROUP_OPEN, 0);
  TerminalNode? SUB_GROUP_CLOSE() =>
      getToken(LatexSongParser.TOKEN_SUB_GROUP_CLOSE, 0);
  KeyvaluelistContext? keyvaluelist() => getRuleContext<KeyvaluelistContext>(0);
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  Sub_groupContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_sub_group;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterSub_group(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitSub_group(this);
  }
}

class KeyvaluelistContext extends ParserRuleContext {
  List<KvelementContext> kvelements() => getRuleContexts<KvelementContext>();
  KvelementContext? kvelement(int i) => getRuleContext<KvelementContext>(i);
  List<TerminalNode> KV_SEPERATORs() =>
      getTokens(LatexSongParser.TOKEN_KV_SEPERATOR);
  TerminalNode? KV_SEPERATOR(int i) =>
      getToken(LatexSongParser.TOKEN_KV_SEPERATOR, i);
  KeyvaluelistContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_keyvaluelist;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterKeyvaluelist(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitKeyvaluelist(this);
  }
}

class KvelementContext extends ParserRuleContext {
  List<ElementContext> elements() => getRuleContexts<ElementContext>();
  ElementContext? element(int i) => getRuleContext<ElementContext>(i);
  TerminalNode? EQUALS() => getToken(LatexSongParser.TOKEN_EQUALS, 0);
  List<TerminalNode> SPACEs() => getTokens(LatexSongParser.TOKEN_SPACE);
  TerminalNode? SPACE(int i) => getToken(LatexSongParser.TOKEN_SPACE, i);
  KvelementContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_kvelement;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterKvelement(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitKvelement(this);
  }
}

class ElementContext extends ParserRuleContext {
  CommandContext? command() => getRuleContext<CommandContext>(0);
  TerminalNode? SPECIALCHAR() => getToken(LatexSongParser.TOKEN_SPECIALCHAR, 0);
  TerminalNode? WORD() => getToken(LatexSongParser.TOKEN_WORD, 0);
  TerminalNode? SPACE() => getToken(LatexSongParser.TOKEN_SPACE, 0);
  Reg_groupContext? reg_group() => getRuleContext<Reg_groupContext>(0);
  Sub_groupContext? sub_group() => getRuleContext<Sub_groupContext>(0);
  TerminalNode? PUNCTUATION() => getToken(LatexSongParser.TOKEN_PUNCTUATION, 0);
  TerminalNode? KV_SEPERATOR() =>
      getToken(LatexSongParser.TOKEN_KV_SEPERATOR, 0);
  TerminalNode? MANUAL_NEW_LINE() =>
      getToken(LatexSongParser.TOKEN_MANUAL_NEW_LINE, 0);
  ElementContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_element;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterElement(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitElement(this);
  }
}

class CommandContext extends ParserRuleContext {
  List<TerminalNode> WORDs() => getTokens(LatexSongParser.TOKEN_WORD);
  TerminalNode? WORD(int i) => getToken(LatexSongParser.TOKEN_WORD, i);
  CommandContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_command;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterCommand(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitCommand(this);
  }
}

class Song_partContext extends ParserRuleContext {
  TerminalNode? SONG_PART() => getToken(LatexSongParser.TOKEN_SONG_PART, 0);
  Song_partContext([ParserRuleContext? super.parent, super.invokingState]);
  @override
  int get ruleIndex => RULE_song_part;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.enterSong_part(this);
  }

  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is LatexSongListener) listener.exitSong_part(this);
  }
}
