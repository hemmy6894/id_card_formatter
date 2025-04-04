import 'package:flutter/material.dart';
import 'package:id_card_formatter/id_card_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ID Formatter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormatterHomePage(),
    );
  }
}

class FormatterHomePage extends StatefulWidget {
  const FormatterHomePage({super.key});
  @override
  State<FormatterHomePage> createState() => _FormatterHomePageState();
}

class _FormatterHomePageState extends State<FormatterHomePage> {
  final _nidaController = TextEditingController();
  final _nhifController = TextEditingController();
  final _voterController = TextEditingController();
  final _amountController = TextEditingController();
  final _genericValueController = TextEditingController();
  final _genericFormatController = TextEditingController();

  String formattedNida = '';
  String formattedNhif = '';
  String formattedVoter = '';
  String formattedAmount = '';
  String formattedGeneric = '';

  void _formatInputs() {
    setState(() {
      formattedNida = _nidaController.text.nidaFormat();
      formattedNhif = _nhifController.text.tzNcardFormat();
      formattedVoter = _voterController.text.tzVoterFormat();
      double? amount = double.tryParse(_amountController.text);
      formattedAmount = amount != null ? amount.toFormat() : 'Invalid amount';

      String raw = _genericValueController.text;
      String format = _genericFormatController.text;
      formattedGeneric = raw.genericFormat(format: format);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ID Formatter Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nidaController,
              decoration: const InputDecoration(labelText: 'Enter NIDA Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _nhifController,
              decoration:
                  const InputDecoration(labelText: 'Enter NHIF Card Number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _voterController,
              decoration: const InputDecoration(labelText: 'Enter Voter ID'),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Enter Amount'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const Divider(),
            TextField(
              controller: _genericValueController,
              decoration: const InputDecoration(labelText: 'Generic Input'),
            ),
            TextField(
              controller: _genericFormatController,
              decoration: const InputDecoration(
                  labelText: 'Generic Format (e.g. XXX-XXX-XXX)'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _formatInputs,
              child: const Text('Format'),
            ),
            const SizedBox(height: 24),
            Text('Formatted NIDA: $formattedNida'),
            Text('Formatted NHIF: $formattedNhif'),
            Text('Formatted Voter: $formattedVoter'),
            Text('Formatted Amount: $formattedAmount'),
            Text('Formatted Generic: $formattedGeneric'),
          ],
        ),
      ),
    );
  }
}
