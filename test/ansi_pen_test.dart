import 'package:dart_ansi/dart_ansi.dart';
import 'package:test/test.dart';

void main() {
  test('red', () {
    expect(AnsiPens.red('foo'), '\x1B[1;31mfoo\x1B[0m');
  });

  group('pen', () {
    test('without fgColor and without bgColor', () {
      expect(pen('foo'), 'foo');
    });

    test('with fgColor and without bgColor', () {
      expect(
        pen('foo', fgColor: AnsiForegroundColor.red),
        '\x1B[1;31mfoo\x1B[0m',
      );
    });

    test('without fgColor and with bgColor', () {
      expect(
        pen('foo', bgColor: AnsiBackgroundColor.red),
        '\x1B[1;41mfoo\x1B[0m',
      );
    });

    test('with fgColor and with bgColor', () {
      expect(
        pen(
          'foo',
          fgColor: AnsiForegroundColor.red,
          bgColor: AnsiBackgroundColor.red,
        ),
        '\x1B[1;31m\x1B[1;41mfoo\x1B[0m',
      );
    });
  });
}
