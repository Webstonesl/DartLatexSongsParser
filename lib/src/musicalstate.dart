class Scale {}

class MusicalState {
  static const int RESET_TO_INITIAL = -1;
  final int? bpm;
  final int upper;
  final int lower;
  final Scale? scale;
  MusicalState(
      {required this.scale,
      required this.bpm,
      required this.upper,
      required this.lower});
}

class RenderState {
  final MusicalState state;

  RenderState({required this.state});
}
