grammar LatexSong;

prog: SPACE* song* SPACE* EOF;
song: SONG_BEGIN element SPACE* sub_group? (song_part | element)* SONG_END;
reg_group: '{' element* '}';
sub_group: SUB_GROUP_OPEN (keyvaluelist | element*) SUB_GROUP_CLOSE;
keyvaluelist: kvelement (KV_SEPERATOR kvelement)* ;
kvelement: SPACE* element SPACE* EQUALS SPACE* element SPACE*;

element: (command|SPECIALCHAR|WORD|SPACE|reg_group|sub_group|PUNCTUATION|KV_SEPERATOR|MANUAL_NEW_LINE);
command: '\\' WORD+;

song_part: SONG_PART;

SONG_BEGIN: '\\beginsong';
SONG_END: '\\endsong';
SONG_PART: ('\\beginverse' '*'?|'\\beginchorus') .*? ('\\endverse'|'\\endchorus');
REG_GROUP_OPEN: '{';
SPECIALCHAR: '\\' ([# ]);
REG_GROUP_CLOSE: '}';
SUB_GROUP_OPEN: '[';
SUB_GROUP_CLOSE: ']';
KV_SEPERATOR: ',';
EQUALS: [=];
MANUAL_NEW_LINE: '\\\\';
WORD: (LETTER+|DIGIT+|[\-]);
PUNCTUATION: [',:*#()?+.];
ACCIDENTAL: [#&b];
LETTER: [A-Za-z];
COMMENT: '%' .*? '\n' -> skip; 
DIGIT: [0-9];
SPACE: [ \n\t\r];
