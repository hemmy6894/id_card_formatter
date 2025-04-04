part of 'package:id_card_formatter/id_card_formatter.dart';

/// A utility extension on [String] for formatting various types
/// of Tanzanian ID numbers such as NIDA, National Card, and Voter ID.

extension IDFormatter on String {
  /// Formats a **NIDA ID** number into the format: `XXXXXXXX-XXXXX-XXXXX-XX`.
  ///
  /// - Each `X` is a digit.
  /// - Example: `'12345678123451234512'` → `'12345678-12345-12345-12'`
  /// - If input is **less than 20 digits**, it is returned as-is.
  /// - If input is **more than 20 digits**, it is truncated.
  String nidaFormat() {
    final digits = replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    buffer.write(digits);
    return buffer.toString().genericFormat(format: "XXXXXXXX-XXXXX-XXXXX-XX");
  }

  /// Formats a **Tanzanian National Card (TZ NCard)** number into the format:
  /// `XXXX XXXX XXXX XXXX`.
  ///
  /// - Each `X` is a digit.
  /// - Example: `'1234567890123456'` → `'1234 5678 9012 3456'`
  /// - If input is **less than 16 digits**, it is returned as-is.
  /// - If input is **more than 16 digits**, it is truncated.
  String tzNcardFormat() {
    final clean = replaceAll(' ', '');
    final buffer = StringBuffer();
    buffer.write(clean);
    return buffer.toString().genericFormat(format: "XXXX XXXX XXXX XXXX");
  }

  /// Formats a **Tanzanian Voter ID** number into the format: `T-XXXX-XXXX-XXX-X`.
  ///
  /// - Each `X` is a digit.
  /// - Example: `'T123456789012'` → `'T-1234-5678-901-2'`
  /// - The function automatically removes existing hyphens and spaces.
  String tzVoterFormat() {
    final clean = replaceAll('-', '').replaceAll(' ', '');
    final buffer = StringBuffer();
    buffer.write(clean);
    return buffer.toString().genericFormat(format: "X-XXXX-XXXX-XXX-X");
  }
}
