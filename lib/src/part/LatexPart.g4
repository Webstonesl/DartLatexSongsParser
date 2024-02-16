grammar LatexPart;
part: PART_BEGIN partcontent PART_END;
partcontent:  element+;
element: CHORD|raised|command|(WORD|WS|PUNCTUATION)+|reg_group|METRE_BAR;
raised: OPEN_RAISED element+ CLOSE_RAISED;
command: '\\' WORD|PUNCTUATION|'\\'|WS;
reg_group: GROUP_START element* GROUP_END;



PART_BEGIN: ('\\beginverse' '*'?|'\\beginchorus');
PART_END: '\\endverse' | '\\endchorus';
GROUP_START: '{';
GROUP_END: '}';

OPEN_RAISED: '\\[';
CLOSE_RAISED: ']';

CHORD: [A-G][#&]*[A-Za-z0-9#&]*('/'[A-G][#&]*)?;
METRE_BAR: '|';
PUNCTUATION: [,./;:'"\\?()\-_+=!^`];
WORD: [A-Za-z0-9\-_]+;
WS: [ \r\n\t]+;

COMMENT: '%' .*? '\n' -> skip;