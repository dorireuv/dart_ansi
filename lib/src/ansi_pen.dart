import 'package:dart_ansi/dart_ansi.dart';

const pen = _write;

final class AnsiPens {
  AnsiPens._();

  static final black = (AnsiPen()..black()).write;
  static final red = (AnsiPen()..red()).write;
  static final green = (AnsiPen()..green()).write;
  static final yellow = (AnsiPen()..yellow()).write;
  static final blue = (AnsiPen()..blue()).write;
  static final magenta = (AnsiPen()..magenta()).write;
  static final cyan = (AnsiPen()..cyan()).write;
  static final white = (AnsiPen()..white()).write;
}

final class AnsiPen {
  AnsiForegroundColor? _fgColor;
  AnsiBackgroundColor? _bgColor;

  AnsiPen();

  String call(Object? object) => write(object);

  String write(Object? object) {
    return _write(object, fgColor: _fgColor, bgColor: _bgColor);
  }

  void fgColor(AnsiForegroundColor fgColor) => _fgColor = fgColor;
  void black() => fgColor(AnsiForegroundColor.black);
  void red() => fgColor(AnsiForegroundColor.red);
  void green() => fgColor(AnsiForegroundColor.green);
  void yellow() => fgColor(AnsiForegroundColor.yellow);
  void blue() => fgColor(AnsiForegroundColor.blue);
  void magenta() => fgColor(AnsiForegroundColor.magenta);
  void cyan() => fgColor(AnsiForegroundColor.cyan);
  void white() => fgColor(AnsiForegroundColor.white);

  void bgColor(AnsiBackgroundColor bgColor) => _bgColor = bgColor;
  void bgBlack() => bgColor(AnsiBackgroundColor.black);
  void bgRed() => bgColor(AnsiBackgroundColor.red);
  void bgGreen() => bgColor(AnsiBackgroundColor.green);
  void bgYellow() => bgColor(AnsiBackgroundColor.yellow);
  void bgBlue() => bgColor(AnsiBackgroundColor.blue);
  void bgMagenta() => bgColor(AnsiBackgroundColor.magenta);
  void bgCyan() => bgColor(AnsiBackgroundColor.cyan);
  void bgWhite() => bgColor(AnsiBackgroundColor.white);
}

String _write(
  Object? object, {
  AnsiForegroundColor? fgColor,
  AnsiBackgroundColor? bgColor,
}) {
  if (fgColor == null && bgColor == null) {
    return object.toString();
  }

  final sb = StringBuffer();

  if (fgColor != null) {
    sb.write(AnsiSequences.foregroundColor(fgColor));
  }

  if (bgColor != null) {
    sb.write(AnsiSequences.backgroundColor(bgColor));
  }

  sb.write(object);
  sb.write(AnsiSequences.resetColor);

  return sb.toString();
}
