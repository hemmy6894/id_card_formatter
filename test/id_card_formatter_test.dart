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

    final genearicVoter =
        "T123456789012".genericFormat(format: 'X-XXXX-XXXX-XXX-X');
    expect(genearicVoter, 'T-1234-5678-901-2');

    final genearicNida =
        "12345678123451234512".genericFormat(format: 'XXXXXXXX-XXXXX-XXXXX-XX');
    expect(genearicNida, '12345678-12345-12345-12');
    
    final genearicNCard =
        "1234567890123456".genericFormat(format: 'XXXX XXXX XXXX XXXX');
    expect(genearicNCard, '1234 5678 9012 3456');

    final phone = "255123456789".phoneFormat();
    expect(phone, '(+255) 123 456 789');

    final phoneUs = "11234567890".phoneFormat(pattern: '(+X) XXX XXX XXXX');
    expect(phoneUs, '(+1) 123 456 7890');
  });
}
