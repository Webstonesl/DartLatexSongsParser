import 'musicalstate.dart';

abstract class PartItem {
  Map<String, dynamic> options = {};
  PartItemGroup? _parent;
  PartItemGroup? get parent => _parent;
  set parent(PartItemGroup? parent) {
    if (_parent != null) {
      _parent!.children.remove(this);
    }
    if (parent != null) {
      parent.children.add(this);
    }
    _parent = parent;
  }

  PartItem({required PartItemGroup? parent}) : _parent = parent {
    if (parent != null) {
      parent.children.add(this);
    }
  }
  String getText();
}

class PartItemText extends PartItem {
  String text;

  PartItemText(this.text, {required super.parent});
  @override
  String getText() {
    return text;
  }
}

class PartItemTranspose extends PartItem {
  int n;

  PartItemTranspose(this.n, {required super.parent});

  @override
  String getText() {
    return "Transpose $n";
  }
}

class PartItemMeasure extends PartItem {
  final int? upper;
  final int? lower;
  final int? bpm;
  PartItemMeasure({this.lower, this.upper, this.bpm, required super.parent});

  @override
  String getText() {
    return "|";
  }
}

class ChordsheetRepeat extends PartItem {
  String? title;
  int? repeats;

  bool continueFromThere = false;
  PartItem? element;
  ChordsheetRepeat(
      {this.element, this.title, this.repeats = 1, required super.parent});

  @override
  String getText() {
    throw UnimplementedError();
  }
}

class PartItemLineBreak extends PartItem {
  PartItemLineBreak({required super.parent});

  @override
  String getText() {
    return '\n';
  }
}

class PartItemGroup extends PartItem {
  final List<PartItem> children = [];

  PartItemGroup({required super.parent});

  @override
  String getText() {
    return [for (PartItem child in children) child.getText()].join();
  }
}

class ChordsheetPart extends PartItemGroup {
  late int type;
  String? title;

  ChordsheetPart({required super.parent});
}

class Chordsheet extends PartItemGroup {
  late String title;
  String artists = "";
  MusicalState initialState =
      MusicalState(scale: null, bpm: null, upper: 4, lower: 4);

  Chordsheet({super.parent});

  @override
  String toString() {
    if (title.contains('\n')) {
      List<String> split = title.split('\n');
      return "CS(${[
        for (int i = 0; i < split.length; i++)
          if (i == 0) split[i].trim() else "(${split[i].trim()})"
      ].join(" ")})";
    } else {
      return "CS($title)";
    }
  }

  @override
  String getText() {
    return "";
  }
}
