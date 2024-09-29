import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';

AnsiPen info = AnsiPen()..blue(bold: true);
AnsiPen success = AnsiPen()..green(bold: true);
AnsiPen warning = AnsiPen()..yellow(bold: true);
AnsiPen error = AnsiPen()..red(bold: true);

debugPrintInfo(String text) {
  debugPrint(info(text));
}

debugPrintSuccess(String text) {
  debugPrint(success(text));
}

debugPrintWarning(String text) {
  debugPrint('\n');
  debugPrint(warning(text));
}

debugPrintError(String text) {
  debugPrint(error(text));
}
