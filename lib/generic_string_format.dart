part of 'package:id_card_formatter/id_card_formatter.dart';

/// An extension to format strings according to a custom pattern.
///
/// Example usage:
/// ```dart
/// "T123456789".genericFormat(format: "T-XXX-XXX-XXX"); // T-123-456-789
/// "123456789".genericFormat(format: "XXX XXX XXX");   // 123 456 789
/// "123456789".genericFormat(format: "XXX-XXX-XXX");   // 123-456-789
/// ```
extension GenericFormatter on String {
  /// Formats the string using the provided [format] pattern.
  ///
  /// The pattern must contain `X` as placeholders for digits or characters.
  /// Any other character (e.g., `-`, ` `, `T`) will be added as-is.
  ///
  /// Extra characters in the input are ignored if there are more than `X`s in the format.
  /// If the input has fewer characters than `X`s, only those available are used.
  ///
  /// Example:
  /// ```dart
  /// "123456789".genericFormat(format: "XXX-XXX-XXX"); // 123-456-789
  /// ```
  String genericFormat({required String format}) {
    final cleanInput = replaceAll(RegExp(r'\s|-'), '');
    final buffer = StringBuffer();
    int inputIndex = 0;

    for (int i = 0; i < format.length; i++) {
      if (format[i] == 'X') {
        if (inputIndex < cleanInput.length) {
          buffer.write(cleanInput[inputIndex]);
          inputIndex++;
        } else {
          break;
        }
      } else {
        buffer.write(format[i]);
      }
    }

    return buffer.toString();
  }
}
