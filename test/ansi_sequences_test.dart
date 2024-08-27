import 'package:dart_ansi/dart_ansi.dart';
import 'package:test/test.dart';

void main() {
  test('red', () {
    expect(AnsiPens.red('foo'), '\x1B[1;31mfoo\x1B[0m');
  });
}
