// Generated from LatexPart.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class LatexPartLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_PART_BEGIN = 2, TOKEN_PART_END = 3, TOKEN_GROUP_START = 4, 
    TOKEN_GROUP_END = 5, TOKEN_OPEN_RAISED = 6, TOKEN_CLOSE_RAISED = 7, 
    TOKEN_METRE_BAR = 8, TOKEN_PUNCTUATION = 9, TOKEN_WORD = 10, TOKEN_WS = 11, 
    TOKEN_COMMENT = 12;
  @override
  final List<String> channelNames = [
    'DEFAULT_TOKEN_CHANNEL', 'HIDDEN'
  ];

  @override
  final List<String> modeNames = [
    'DEFAULT_MODE'
  ];

  @override
  final List<String> ruleNames = [
    'T__0', 'PART_BEGIN', 'PART_END', 'GROUP_START', 'GROUP_END', 'OPEN_RAISED', 
    'CLOSE_RAISED', 'METRE_BAR', 'PUNCTUATION', 'WORD', 'WS', 'COMMENT'
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


  LatexPartLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'LatexPart.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,12,111,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,
      6,7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,1,0,1,0,1,1,1,1,
      1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,41,8,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,55,8,1,1,2,1,2,1,2,1,2,1,2,
      1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,76,8,2,
      1,3,1,3,1,4,1,4,1,5,1,5,1,5,1,6,1,6,1,7,1,7,1,8,1,8,1,9,4,9,92,8,9,
      11,9,12,9,93,1,10,4,10,97,8,10,11,10,12,10,98,1,11,1,11,5,11,103,8,
      11,10,11,12,11,106,9,11,1,11,1,11,1,11,1,11,1,104,0,12,1,1,3,2,5,3,
      7,4,9,5,11,6,13,7,15,8,17,9,19,10,21,11,23,12,1,0,3,8,0,33,35,38,41,
      43,47,58,59,61,61,63,63,92,92,94,96,5,0,45,45,48,57,65,90,95,95,97,
      122,3,0,9,10,13,13,32,32,116,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,
      7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,15,1,0,0,0,0,17,
      1,0,0,0,0,19,1,0,0,0,0,21,1,0,0,0,0,23,1,0,0,0,1,25,1,0,0,0,3,54,1,
      0,0,0,5,75,1,0,0,0,7,77,1,0,0,0,9,79,1,0,0,0,11,81,1,0,0,0,13,84,1,
      0,0,0,15,86,1,0,0,0,17,88,1,0,0,0,19,91,1,0,0,0,21,96,1,0,0,0,23,100,
      1,0,0,0,25,26,5,92,0,0,26,2,1,0,0,0,27,28,5,92,0,0,28,29,5,98,0,0,
      29,30,5,101,0,0,30,31,5,103,0,0,31,32,5,105,0,0,32,33,5,110,0,0,33,
      34,5,118,0,0,34,35,5,101,0,0,35,36,5,114,0,0,36,37,5,115,0,0,37,38,
      5,101,0,0,38,40,1,0,0,0,39,41,5,42,0,0,40,39,1,0,0,0,40,41,1,0,0,0,
      41,55,1,0,0,0,42,43,5,92,0,0,43,44,5,98,0,0,44,45,5,101,0,0,45,46,
      5,103,0,0,46,47,5,105,0,0,47,48,5,110,0,0,48,49,5,99,0,0,49,50,5,104,
      0,0,50,51,5,111,0,0,51,52,5,114,0,0,52,53,5,117,0,0,53,55,5,115,0,
      0,54,27,1,0,0,0,54,42,1,0,0,0,55,4,1,0,0,0,56,57,5,92,0,0,57,58,5,
      101,0,0,58,59,5,110,0,0,59,60,5,100,0,0,60,61,5,118,0,0,61,62,5,101,
      0,0,62,63,5,114,0,0,63,64,5,115,0,0,64,76,5,101,0,0,65,66,5,92,0,0,
      66,67,5,101,0,0,67,68,5,110,0,0,68,69,5,100,0,0,69,70,5,99,0,0,70,
      71,5,104,0,0,71,72,5,111,0,0,72,73,5,114,0,0,73,74,5,117,0,0,74,76,
      5,115,0,0,75,56,1,0,0,0,75,65,1,0,0,0,76,6,1,0,0,0,77,78,5,123,0,0,
      78,8,1,0,0,0,79,80,5,125,0,0,80,10,1,0,0,0,81,82,5,92,0,0,82,83,5,
      91,0,0,83,12,1,0,0,0,84,85,5,93,0,0,85,14,1,0,0,0,86,87,5,124,0,0,
      87,16,1,0,0,0,88,89,7,0,0,0,89,18,1,0,0,0,90,92,7,1,0,0,91,90,1,0,
      0,0,92,93,1,0,0,0,93,91,1,0,0,0,93,94,1,0,0,0,94,20,1,0,0,0,95,97,
      7,2,0,0,96,95,1,0,0,0,97,98,1,0,0,0,98,96,1,0,0,0,98,99,1,0,0,0,99,
      22,1,0,0,0,100,104,5,37,0,0,101,103,9,0,0,0,102,101,1,0,0,0,103,106,
      1,0,0,0,104,105,1,0,0,0,104,102,1,0,0,0,105,107,1,0,0,0,106,104,1,
      0,0,0,107,108,5,10,0,0,108,109,1,0,0,0,109,110,6,11,0,0,110,24,1,0,
      0,0,7,0,40,54,75,93,98,104,1,6,0,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}