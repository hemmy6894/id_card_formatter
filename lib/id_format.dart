extension IDFormatter on String {
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

  String tzNcardFormat() {
    final clean = replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < clean.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(clean[i]);
    }
    return buffer.toString();
  }

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
