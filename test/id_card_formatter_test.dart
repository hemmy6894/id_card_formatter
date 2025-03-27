import 'package:flutter_test/flutter_test.dart';

import 'package:id_card_formatter/id_card_formatter.dart';

void main() {
  test('format id', () {
    final nida = "12345678123451234512".nidaFormat();
    expect(nida, '12345678-12345-12345-12');
    final ncard = "1234567890123456".tzNcardFormat();
    expect(ncard, '1234 5678 9012 3456');
    final voter = "T123456789012".tzVoterFormat();
    expect(voter, 'T-1234-5678-901-2');
  });
}
