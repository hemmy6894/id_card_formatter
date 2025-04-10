/// Extension on String to provide flexible and intelligent date formatting
/// It attempts to parse a string in various formats (ISO, slash, dash, dot)
/// and convert it into a `DateTime` object, then allows formatting as desired.
extension DateFormatter on String {
  /// Attempts to parse the current string into a DateTime object.
  /// Handles common formats:
  /// - ISO 8601: "2025-04-08T14:20:15"
  /// - Slash: "12/08/2025" (dd/MM/yyyy)
  /// - Dash: "08-12-2025" or "2025-12-08"
  /// - Dot:  "2025.08.12"
  DateTime? get _parsedDate {
    try {
      return DateTime.parse(this); // Try standard ISO format
    } catch (_) {}

    final clean = trim();
    if (clean.contains('/')) {
      final parts = clean.split('/');
      if (parts.length == 3) {
        final day = int.tryParse(parts[0]);
        final month = int.tryParse(parts[1]);
        final year = int.tryParse(parts[2]);
        if (_validDate(year, month, day)) return DateTime(year!, month!, day!);
      }
    } else if (clean.contains('-')) {
      final parts = clean.split('-');
      if (parts.length == 3) {
        if (parts[0].length == 4) {
          final year = int.tryParse(parts[0]);
          final month = int.tryParse(parts[1]);
          final day = int.tryParse(parts[2]);
          if (_validDate(year, month, day)) {
            return DateTime(year!, month!, day!);
          }
        } else {
          final part1 = int.tryParse(parts[0]);
          final part2 = int.tryParse(parts[1]);
          final part3 = int.tryParse(parts[2]);
          if (_validDate(part3, part2, part1)) {
            return DateTime(part3!, part2!, part1!);
          }
        }
      }
    } else if (clean.contains('.')) {
      final parts = clean.split('.');
      if (parts.length == 3) {
        final year = int.tryParse(parts[0]);
        final month = int.tryParse(parts[1]);
        final day = int.tryParse(parts[2]);
        if (_validDate(year, month, day)) return DateTime(year!, month!, day!);
      }
    }

    return null; // If all parsing attempts fail
  }

  /// Validates whether a set of y/m/d form a valid date.
  bool _validDate(int? y, int? m, int? d) {
    if (y == null || m == null || d == null) return false;
    return y > 0 && (m >= 1 && m <= 12) && (d >= 1 && d <= 31);
  }

  /// Extracts two-digit day from the parsed date (e.g., "08").
  String get day => _parsedDate != null ? _twoDigits(_parsedDate!.day) : '';

  /// Extracts two-digit month from the parsed date (e.g., "04").
  String get month => _parsedDate != null ? _twoDigits(_parsedDate!.month) : '';

  /// Extracts full year from the parsed date (e.g., "2025").
  String get year => _parsedDate != null ? _parsedDate!.year.toString() : '';

  /// Extracts two-digit hour from the parsed date (e.g., "14").
  String get hour => _parsedDate != null ? _twoDigits(_parsedDate!.hour) : '';

  /// Extracts two-digit minute from the parsed date (e.g., "20").
  String get minute =>
      _parsedDate != null ? _twoDigits(_parsedDate!.minute) : '';

  /// Extracts two-digit second from the parsed date (e.g., "15").
  String get second =>
      _parsedDate != null ? _twoDigits(_parsedDate!.second) : '';

  /// Returns the full date in `dd-MM-yyyy` format.
  String get fullDateDash => _parsedDate != null ? '$day-$month-$year' : '';

  /// Returns the full date in `yyyy/MM/dd` format.
  String get fullDateSlash => _parsedDate != null ? '$year/$month/$day' : '';

  /// Returns time in `HH:mm:ss` format.
  String get time => _parsedDate != null ? '$hour:$minute:$second' : '';

  /// Formats the current parsed date into a string based on the given pattern.
  ///
  /// The pattern supports the following placeholders:
  /// - `dd`: Day of month (2 digits, e.g. '01', '12')
  /// - `MM`: Month number (2 digits, e.g. '04', '12')
  /// - `MMM`: Short month name (e.g. 'Jan', 'Dec')
  /// - `MMMM`: Full month name (e.g. 'January', 'December')
  /// - `yyyy`: Full year (e.g. '2025')
  /// - `yy`: Last two digits of the year (e.g. '25')
  /// - `HH`: Hour in 24-hour format (2 digits)
  /// - `mm`: Minutes (2 digits)
  /// - `ss`: Seconds (2 digits)
  ///
  /// Example:
  /// ```dart
  /// '12/08/2025'.toDateFormat('dd MMMM yyyy'); // returns '12 August 2025'
  /// '12/08/2025'.toDateFormat('dd/MM/yyyy');   // returns '12/08/2025'
  /// ```
  ///
  /// Returns an empty string if the parsed date is null.
  String toDateFormat(String pattern) {
    final date = _parsedDate;
    if (date == null) return '';

    // Full month names
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    // Short month names
    const shortMonthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    // Mapping format tokens to corresponding values from the date
    final map = {
      'dd': _twoDigits(date.day),
      'MM': _twoDigits(date.month),
      'MMM': shortMonthNames[date.month - 1],
      'MMMM': monthNames[date.month - 1],
      'yyyy': date.year.toString(),
      'yy': date.year.toString().substring(2),
      'HH': _twoDigits(date.hour),
      'mm': _twoDigits(date.minute),
      'ss': _twoDigits(date.second),
    };

    String formatted = pattern;

    // Replace longer format keys first to prevent partial replacements
    final sortedKeys = map.keys.toList()
      ..sort((a, b) => b.length.compareTo(a.length));

    for (final key in sortedKeys) {
      formatted = formatted.replaceAll(key, map[key]!);
    }

    return formatted;
  }

  /// Pads a number to ensure it is two digits (e.g. 7 becomes '07').
  ///
  /// Used for formatting day, month, hour, minute, and second values.
  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}

/// Provides convenient methods for extracting date properties
/// like weekday name, checking if date is weekend, today, or leap year.
extension DateInfo on String {
  /// Reuses parsing logic from DateFormatter extension.
  DateTime? get _parsedDate => DateFormatter(this)._parsedDate;

  /// Returns name of weekday (e.g., Monday, Tuesday).
  String get weekdayName =>
      _parsedDate != null ? _parsedDate!.weekdayName : 'Invalid';

  /// Checks if the date is a Monday.
  bool get isMonday => _parsedDate?.weekday == DateTime.monday;

  /// Checks if the date is a Tuesday.
  bool get isTuesday => _parsedDate?.weekday == DateTime.tuesday;

  /// Checks if the date falls on a weekend (Saturday or Sunday).
  bool get isWeekend =>
      _parsedDate?.weekday == DateTime.saturday ||
      _parsedDate?.weekday == DateTime.sunday;

  /// Checks if the date matches today's date.
  bool get isToday {
    final d = _parsedDate;
    if (d == null) return false;
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }

  /// Determines if the date’s year is a leap year.
  bool get isLeapYear {
    final y = _parsedDate?.year;
    if (y == null) return false;
    return (y % 4 == 0 && y % 100 != 0) || (y % 400 == 0);
  }
}

/// Extension on DateTime to get human-readable weekday name.
extension WeekdayName on DateTime {
  /// Returns the full weekday name (e.g., Monday).
  String get weekdayName {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return names[weekday - 1];
  }
}
