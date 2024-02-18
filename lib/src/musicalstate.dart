abstract class MusicalElement {
  String renderToString(MusicalState music, RenderState render);
}

enum Accidental { sharp, flat }

enum ScaleType { major, naturalMinor }

class Note implements MusicalElement {
  final int _value;
  final Accidental? originalAccidental;
  int get value => _value;

  Note(value, {this.originalAccidental}) : _value = value % 12;
  static Note? tryParse(String a) {
    const Map<String, int> notes = {
      'A': 0,
      'B': 2,
      'C': 3,
      'D': 5,
      'E': 7,
      'F': 8,
      'G': 10
    };
    int note = notes[a.substring(0, 1)]!;
    Accidental? accidental;
    for (int i = 1; i < a.length; i++) {
      String chr = a.substring(i, i + 1);
      if ('b&'.contains(chr)) {
        note -= 1;
        accidental = Accidental.flat;
      } else if (chr == '#') {
        note += 1;
        accidental = Accidental.sharp;
      } else {
        break;
      }
    }
    return Note(note, originalAccidental: accidental);
  }

  @override
  bool operator ==(covariant other) {
    if (other is! Note) return false;
    return value == other.value;
  }

  Note operator +(int other) {
    return Note(other + _value);
  }

  @override
  int get hashCode => _value;

  @override
  String renderToString(MusicalState music, RenderState render) {
    return render.getNote(this, music.prefferedAccidental);
  }

  @override
  String toString() {
    return [
      'A',
      'A#',
      'B',
      'C',
      'D#',
      'D',
      'D#',
      'E',
      'F',
      'F#',
      'G',
      'G#'
    ][_value];
  }
}

class Scale {
  final Note key;
  final ScaleType type;
  Scale({required this.key, this.type = ScaleType.major});
  static Accidental? _getAccidental(Scale scale) {
    Map<ScaleType, Map<Note, Accidental?>> notes = {
      ScaleType.major: {
        Note(0): Accidental.sharp, // A
        Note(1): Accidental.flat,
        Note(2): Accidental.sharp, // B
        Note(3): null, // C
        Note(4): null,
        Note(5): Accidental.sharp, //D
        Note(6): Accidental.flat,
        Note(7): Accidental.sharp, //E
        Note(8): Accidental.flat, //F
        Note(9): null,
        Note(10): Accidental.sharp, //G
        Note(11): Accidental.flat,
      },
      ScaleType.naturalMinor: {
        Note(0): null,
        Note(1): Accidental.sharp, //G
        Note(2): Accidental.flat,
        Note(3): Accidental.sharp, // A
        Note(4): Accidental.flat,
        Note(5): Accidental.sharp, // B
        Note(6): null, // C
        Note(7): null,
        Note(8): Accidental.sharp, //D
        Note(9): Accidental.flat,
        Note(10): Accidental.sharp, //E
        Note(11): Accidental.flat, //F
      }
    };
    return notes[scale.type]?[scale.key];
  }

  Accidental? getAccidental() {
    return Scale._getAccidental(this);
  }
}

class Chord implements MusicalElement {
  final Note note;
  final Note? bass;
  final String mod;
  final Set<int> intervals;
  Set<Note> get notes => {for (int i in intervals) note + i};
  Chord(
    this.note, {
    this.bass,
    required this.mod,
    required this.intervals,
  });
  @override
  String toString() {
    return "Chord($note$mod/${bass ?? ""} - $notes)";
  }

  @override
  String renderToString(MusicalState music, RenderState render) {
    return "${note.renderToString(music, render)}$mod${bass != null ? '/${bass!.renderToString(music, render)}' : ''}";
  }
}

class MusicalState {
  static Accidental defaultAccidental = Accidental.sharp;
  final int? bpm;
  final int upper;
  final int lower;
  final Scale? scale;
  final Accidental? _prefferedAccidental;
  Accidental get prefferedAccidental =>
      (scale?.getAccidental()) ?? _prefferedAccidental ?? defaultAccidental;
  MusicalState(
      {required this.scale,
      required this.bpm,
      required this.upper,
      required this.lower,
      Accidental? prefferedAccidental})
      : _prefferedAccidental = prefferedAccidental;
}

class RenderState {
  static const Map<Accidental, String> latexFormat = {
    Accidental.flat: '&',
    Accidental.sharp: '#'
  };
  final Map<Accidental, String> accidentalStrings;
  RenderState({Map<Accidental, String>? map})
      : accidentalStrings = map ?? latexFormat;
  String getNote(Note note, Accidental accidental) {
    List<String?> notes = [
      'A',
      null,
      'B',
      'C',
      null,
      'D',
      null,
      'E',
      null,
      'F',
      null,
      'G',
      null
    ];
    if (notes[note.value] != null) return notes[note.value]!;
    int n = 0;
    if (accidental == Accidental.sharp) {
      n = -1;
    } else if (accidental == Accidental.flat) {
      n = 1;
    }
    Note s = note + n;
    return '${notes[s.value]!}${accidentalStrings[accidental]}';
  }
}
