extension MoneyFormatter on double {
  String toFormat({
    String symbol = 'TZS',
    int decimalDigits = 0,
  }) {
    final numStr = toStringAsFixed(decimalDigits);
    final parts = numStr.split('.');
    final integerPart = parts[0];
    final fractionalPart = parts.length > 1 ? parts[1] : '';

    final buffer = StringBuffer();
    int count = 0;

    for (int i = integerPart.length - 1; i >= 0; i--) {
      buffer.write(integerPart[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        buffer.write(',');
      }
    }

    final formattedInt = buffer.toString().split('').reversed.join();

    if (decimalDigits > 0) {
      return '$symbol $formattedInt.$fractionalPart';
    } else {
      return '$symbol $formattedInt';
    }
  }
}
