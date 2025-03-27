# 🇹🇿 ID Card Formatter

**A lightweight Flutter/Dart extension to format Tanzanian ID numbers** (NIDA, Voter ID, and NCARD card style). Also supports currency formatting using `intl`.

---

## ✨ Features

- ✅ Format **NIDA ID** numbers like `00000000-00000-00000-00`
- ✅ Format **Tanzanian Health Cards** (e.g. NCARD) as `XXXX XXXX XXXX XXXX`
- ✅ Format **Voter IDs** like `A-1234-5678-901-X`
- ✅ Format `double` values into currency (e.g. `TZS 1,000,000`)

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  id_card_formatter: ^0.0.1
```

---

## 🧠 Usage

### 📥 Import

```dart
import 'package:id_card_formatter/id_card_formatter.dart';
```

---

### 💰 Currency Format

```dart
double amount = 2500000;

print(amount.toFormat());                         // TZS 2,500,000
print(amount.toFormat(decimalDigits: 2));         // TZS 2,500,000.00
print(amount.toFormat(symbol: '\$'));             // $ 2,500,000
print(amount.toFormat(locale: 'de_DE', symbol: '€')); // € 2.500.000
```

---

### 🆔 NIDA ID Format

```dart
String nida = '0000000000000000000';
print(nida.nidaFormat()); // 00000000-00000-00000-00
```

---

### 🆔 NCard Format

```dart
String n = '0000000000000000';
print(ncard.tzNcardFormat()); // 0000 0000 0000 0000
```

---

### 🗳️ Voter ID Format

```dart
String voter = 'A12345678901X';
print(voter.tzVoterFormat()); // A-1234-5678-901-X
```

---

## 🔍 Extension Summary

### `String.nidaFormat()`

Formats NIDA numbers:  
`XXXXXXXX-XXXXX-XXXXX-XX`

### `String.tzNcardFormat()`

Formats Ncard numbers:  
`XXXX XXXX XXXX XXXX`

### `String.tzVoterFormat()`

Formats Voter IDs:  
`A-1234-5678-901-X`

### `double.toFormat({locale, symbol, decimalDigits})`

Formats double to currency using `intl`.

---

## 🤝 Contributing

Pull requests and issues are welcome! Let’s make Tanzanian Flutter utilities awesome 🇹🇿✨

---
# id_card_formatter

## 👨‍💻 Author

**Collaborators**  
📧 [hmanyinja@gmail.com](mailto:hmanyinja@gmail.com)  
🌐 [@hemmy6894](https://github.com/hemmy6894)
🌐 [@barakadewise](https://github.com/barakadewise)
🌐 [@tfkcodes](https://github.com/tfkcodes)

Made with ❤️ in Tanzania 🇹🇿
