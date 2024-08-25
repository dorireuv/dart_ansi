import 'package:dart_ansi/dart_ansi.dart';

final pen = AnsiPen.write;

final class AnsiPen {
  const AnsiPen._();

  static String black(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.black);
  static String red(Object msg) => write(msg, fgColor: AnsiForegroundColor.red);
  static String green(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.green);
  static String yellow(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.yellow);
  static String blue(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.blue);
  static String magenta(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.magenta);
  static String cyan(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.cyan);
  static String white(Object msg) =>
      write(msg, fgColor: AnsiForegroundColor.white);

  static String write(
    Object msg, {
    AnsiForegroundColor? fgColor,
    AnsiBackgroundColor? bgColor,
  }) {
    if (fgColor == null && bgColor == null) {
      return msg.toString();
    }

    final sb = StringBuffer();

    if (fgColor != null) {
      sb.write(AnsiSequences.foregroundColor(fgColor));
    }

    if (bgColor != null) {
      sb.write(AnsiSequences.backgroundColor(bgColor));
    }

    sb.write(msg);
    sb.write(AnsiSequences.resetColor);

    return sb.toString();
  }
}
