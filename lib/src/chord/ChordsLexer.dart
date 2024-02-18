// Generated from Chords.g4 by ANTLR 4.13.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class ChordsLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.13.1', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, TOKEN_MAJ = 5, 
    TOKEN_MIN = 6, TOKEN_SUS = 7, TOKEN_ADD = 8, TOKEN_DIM = 9, TOKEN_AUG = 10, 
    TOKEN_NUMBER = 11, TOKEN_KEY = 12, TOKEN_OVER = 13;
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
    'T__0', 'T__1', 'T__2', 'T__3', 'MAJ', 'MIN', 'SUS', 'ADD', 'DIM', 'AUG', 
    'NUMBER', 'KEY', 'OVER'
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


  ChordsLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'Chords.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,13,93,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,
      7,6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,1,0,1,0,
      1,1,1,1,1,1,1,1,1,2,1,2,1,3,1,3,1,3,1,3,1,3,1,3,1,4,1,4,1,4,1,4,1,
      4,1,4,1,4,3,4,49,8,4,1,5,1,5,1,5,1,5,3,5,55,8,5,1,6,1,6,1,6,1,6,1,
      7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,3,9,73,8,9,1,10,3,10,
      76,8,10,1,10,1,10,5,10,80,8,10,10,10,12,10,83,9,10,1,11,1,11,5,11,
      87,8,11,10,11,12,11,90,9,11,1,12,1,12,0,0,13,1,1,3,2,5,3,7,4,9,5,11,
      6,13,7,15,8,17,9,19,10,21,11,23,12,25,13,1,0,4,3,0,35,35,38,38,98,
      98,1,0,49,57,1,0,48,57,1,0,65,71,99,0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,
      0,0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,15,1,0,0,
      0,0,17,1,0,0,0,0,19,1,0,0,0,0,21,1,0,0,0,0,23,1,0,0,0,0,25,1,0,0,0,
      1,27,1,0,0,0,3,29,1,0,0,0,5,33,1,0,0,0,7,35,1,0,0,0,9,48,1,0,0,0,11,
      54,1,0,0,0,13,56,1,0,0,0,15,60,1,0,0,0,17,64,1,0,0,0,19,72,1,0,0,0,
      21,75,1,0,0,0,23,84,1,0,0,0,25,91,1,0,0,0,27,28,5,10,0,0,28,2,1,0,
      0,0,29,30,5,78,0,0,30,31,5,46,0,0,31,32,5,67,0,0,32,4,1,0,0,0,33,34,
      5,46,0,0,34,6,1,0,0,0,35,36,5,98,0,0,36,37,5,114,0,0,37,38,5,101,0,
      0,38,39,5,97,0,0,39,40,5,107,0,0,40,8,1,0,0,0,41,42,5,109,0,0,42,43,
      5,97,0,0,43,49,5,106,0,0,44,45,5,77,0,0,45,46,5,97,0,0,46,49,5,106,
      0,0,47,49,5,77,0,0,48,41,1,0,0,0,48,44,1,0,0,0,48,47,1,0,0,0,49,10,
      1,0,0,0,50,51,5,109,0,0,51,52,5,105,0,0,52,55,5,110,0,0,53,55,5,109,
      0,0,54,50,1,0,0,0,54,53,1,0,0,0,55,12,1,0,0,0,56,57,5,115,0,0,57,58,
      5,117,0,0,58,59,5,115,0,0,59,14,1,0,0,0,60,61,5,97,0,0,61,62,5,100,
      0,0,62,63,5,100,0,0,63,16,1,0,0,0,64,65,5,100,0,0,65,66,5,105,0,0,
      66,67,5,109,0,0,67,18,1,0,0,0,68,69,5,97,0,0,69,70,5,117,0,0,70,73,
      5,103,0,0,71,73,5,43,0,0,72,68,1,0,0,0,72,71,1,0,0,0,73,20,1,0,0,0,
      74,76,7,0,0,0,75,74,1,0,0,0,75,76,1,0,0,0,76,77,1,0,0,0,77,81,7,1,
      0,0,78,80,7,2,0,0,79,78,1,0,0,0,80,83,1,0,0,0,81,79,1,0,0,0,81,82,
      1,0,0,0,82,22,1,0,0,0,83,81,1,0,0,0,84,88,7,3,0,0,85,87,7,0,0,0,86,
      85,1,0,0,0,87,90,1,0,0,0,88,86,1,0,0,0,88,89,1,0,0,0,89,24,1,0,0,0,
      90,88,1,0,0,0,91,92,5,47,0,0,92,26,1,0,0,0,7,0,48,54,72,75,81,88,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}