import 'package:dart_guava/dart_guava.dart';

import 'ansi_background_color.dart';
import 'ansi_foreground_color.dart';

final class AnsiSequences {
  const AnsiSequences._();

  static const _esc = '\x1B'; // Ansi command escape.
  static const _csi = '['; // Control sequence introducer.

  static String foregroundColor(AnsiForegroundColor fgColor) =>
      _escape('38;5;%1\$sm', [fgColor.code]);

  static String backgroundColor(AnsiBackgroundColor bgColor) =>
      _escape('48;5;%1\$sm', [bgColor.code]);

  static String resetColor = _escape('0m');

  static String clearScreen = _escape('2J');

  static String moveCursorHome = _escape('H');

  static String moveCursor({required int row, required int col}) =>
      _escape('%1\$s;%2\$sH', [row, col]);

  static String eraseEntireLine = _escape('2K');

  static String eraseLineAndReturnCursor =
      _join([eraseEntireLine, String.fromCharCode(CharCodes.cr)]);

  static String _join(Iterable<Object?> objects) => objects.join();

  static String _escape(String cmd, [List<Object>? params]) =>
      '$_esc$_csi$cmd'.format(params);
}
