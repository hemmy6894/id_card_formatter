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

    if (digits.length >= 8) {
      buffer.write(digits.substring(0, 8));
    } else {
      return digits; // Return as-is if not enough digits
    }

    if (digits.length >= 13) {
      buffer.write('-${digits.substring(8, 13)}');
    } else if (digits.length > 8) {
      buffer.write('-${digits.substring(8)}');
      return buffer.toString();
    } else {
      return buffer.toString();
    }

    if (digits.length >= 18) {
      buffer.write('-${digits.substring(13, 18)}');
    } else if (digits.length > 13) {
      buffer.write('-${digits.substring(13)}');
      return buffer.toString();
    } else {
      return buffer.toString();
    }

    if (digits.length >= 20) {
      buffer.write('-${digits.substring(18, 20)}');
    } else if (digits.length > 18) {
      buffer.write('-${digits.substring(18)}');
    }

    return buffer.toString();
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

    for (int i = 0; i < clean.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(clean[i]);
    }
    return buffer.toString();
  }

  /// Formats a **Tanzanian Voter ID** number into the format: `T-XXXX-XXXX-XXX-X`.
  ///
  /// - Each `X` is a digit.
  /// - Example: `'T123456789012'` → `'T-1234-5678-901-2'`
  /// - The function automatically removes existing hyphens and spaces.
  String tzVoterFormat() {
    final clean = replaceAll('-', '').replaceAll(' ', '');
    final buffer = StringBuffer();
    if (clean.isNotEmpty) buffer.write(clean.substring(0, 1));
    if (clean.length >= 5) buffer.write('-${clean.substring(1, 5)}');
    if (clean.length >= 9) buffer.write('-${clean.substring(5, 9)}');
    if (clean.length >= 12) buffer.write('-${clean.substring(9, 12)}');
    if (clean.length >= 13) buffer.write('-${clean.substring(12, 13)}');
    return buffer.toString();
  }
}
