grammar Chords;
testfile: (chord '\n')* EOF;
chord: (key mod (OVER key)?)|('N.C' '.'?)| 'break';
key: KEY; 
mod: (NUMBER | maj | MIN| sus | DIM | add | AUG)*;
sus: SUS NUMBER?;
add: ADD NUMBER?;
maj: MAJ NUMBER?;
MAJ: ('maj' | 'Maj' | 'M');
MIN: 'min' | 'm';
SUS: 'sus';
ADD: 'add';
DIM: 'dim';
AUG: 'aug' | '+';

NUMBER: [#&b]? [1-9][0-9]*;
KEY : [A-G][&b#]*;
OVER : '/';