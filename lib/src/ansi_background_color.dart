enum AnsiBackgroundColor {
  black(40),
  red(41),
  green(42),
  yellow(43),
  blue(44),
  magenta(45),
  cyan(46),
  white(47),
  ;

  final int code;

  const AnsiBackgroundColor(this.code);
}
