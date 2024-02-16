
Latex Songs Parser
This is a parser for my own modified version of Latex Chordsheets based on the [songs](https://songs.sourceforge.net/)-package. 
## Features

This package breaks down a Latex Song for parsing and hopefully in the end, rendering within another project.

## Usage

```dart
import 'package:latexsongparser/latexsongparser.dart';

void main() async {
    await parseChordsheets("./song.tex");
}
```

