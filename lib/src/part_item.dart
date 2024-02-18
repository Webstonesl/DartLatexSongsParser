import 'package:latexsongparser/src/chord_parser.dart';

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
  String getText([MusicalState? musicalState, RenderState? renderState]);
  dynamic getOption(String option) {
    return options[option] ?? _parent?.getOption(option);
  }
}

class PartItemTransposable extends PartItem {
  MusicalElement element;
  PartItemTransposable(this.element, {required super.parent});

  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    return element.toString();
  }
}

class PartItemText extends PartItem {
  String text;

  PartItemText(this.text, {required super.parent});
  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    return text;
  }
}

class PartItemTranspose extends PartItem {
  int n;

  PartItemTranspose(this.n, {required super.parent});

  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    return "Transpose $n";
  }
}

class PartItemMeasure extends PartItem {
  final int? upper;
  final int? lower;
  final int? bpm;
  PartItemMeasure({this.lower, this.upper, this.bpm, required super.parent});

  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
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
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    throw UnimplementedError();
  }
}

class PartItemLineBreak extends PartItem {
  PartItemLineBreak({required super.parent});

  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    return '\n';
  }
}

class PartItemGroup extends PartItem {
  final List<PartItem> children = [];

  PartItemGroup({required super.parent});

  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    return [
      for (PartItem child in children) child.getText(musicalState, renderState)
    ].join();
  }

  void insert(PartItem item, [int i = 0]) {
    item.parent = this;
    children.remove(item);
    children.insert(i, item);
  }
}

class ChordsheetPart extends PartItemGroup {
  late int type;
  String? title;

  ChordsheetPart({required super.parent});
  void format() {
    List<PartItem> items = [this];
    while (items.isNotEmpty) {
      PartItem item = items.removeAt(0);
      if (item is PartItemGroup) {
        items.addAll(item.children);
      } else if (((item.getOption("raised") ?? false) == true) ||
          ((item.getOption("transpose") ?? false) == true)) {
        int index = item.parent!.children.indexOf(item);
        PartItemGroup parent = item.parent!;
        RegExp chord = RegExp(
            r"(?<!N.)[A-G][#b&]*[A-Za-z0-9#b&+]*(/[A-G][#b&]*)?(?!reak)");
        String text = item.getText();
        if (chord.hasMatch(text)) {
          item.parent = null;

          for (int i = 0; i < text.length; i++) {
            final prefix = chord.matchAsPrefix(text, i);
            if (prefix == null) continue;
            if (prefix.start > 0) {
              parent.insert(
                  PartItemText(text.substring(0, prefix.start), parent: null),
                  index++);
            }
            parent.insert(
                PartItemTransposable(parseChord(prefix.group(0)!)!,
                    parent: parent),
                index++);
            if (prefix.end < text.length) {
              text = text.substring(prefix.end);
              i = 0;

              if (!chord.hasMatch(text)) {
                parent.insert(PartItemText(text, parent: null), index++);
                break;
              }
            } else {
              break;
            }
          }
        }
      }
    }
  }
}

class Chordsheet extends PartItemGroup {
  late String title;
  String artists = "";
  MusicalState initialState =
      MusicalState(scale: null, bpm: null, upper: 4, lower: 4);

  Chordsheet({super.parent});

  @override
  String toString() {
    if (title.contains('\\\\')) {
      List<String> split = title.split('\\\\');
      return "CS(${[
        for (int i = 0; i < split.length; i++)
          if (i == 0) split[i].trim() else "(${split[i].trim()})"
      ].join(" ")})";
    } else {
      return "CS($title)";
    }
  }

  @override
  String getText([MusicalState? musicalState, RenderState? renderState]) {
    return "Chordsheet for ${title}";
  }

  void format() {
    Map<String, ChordsheetPart> parts = {};
    List<PartItem> items = [this];
    while (items.isNotEmpty) {
      PartItem item = items.removeAt(0);
      if (item is ChordsheetPart) {
        if (item.title != null) {
          parts[item.title!] = item;
        }
        continue;
      }
      if (item is PartItemGroup) {
        items.addAll(item.children);
      }
    }
  }
}
