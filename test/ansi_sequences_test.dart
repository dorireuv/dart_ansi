import 'package:dart_ansi/dart_ansi.dart';
import 'package:test/test.dart';

void main() {
  test('red', () {
    expect(AnsiPen.red('foo'), '\x1B[38;5;31mfoo\x1B[0m');
  });
}
