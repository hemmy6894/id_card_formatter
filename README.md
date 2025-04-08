# ID Card Formatter

**A lightweight Flutter/Dart extension to format ID numbers** (**Generic Formatter**, NIDA, Voter ID, and NCARD card style). Also supports currency formatting and customizable generic ID formats.

---

## ✨ Features

- 🆕 **Generic Formatter**: Format any string using a custom pattern like `XXX-XXX-XXX` or `X-XXX-XXX-XXX`
- ✅ Format **NIDA ID** numbers like `00000000-00000-00000-00`
- ✅ Format **Tanzanian NCards** (e.g. NCARD) as `XXXX XXXX XXXX XXXX`
- ✅ Format **Voter IDs** like `A-1234-5678-901-X`
- ✅ Format **Double** values into currency (e.g. `TZS 1,000,000`)
- ✅ Format **Phone number** example (Tz phone as `(+255) 123 456 789`)
- 🆕 **Date Formatter**: Format dates in various styles, including `dd-MM-yyyy`, `yyyy/MM/dd`, `yyyy-MM-dd`, and more, with support for time (e.g., `HH:mm:ss`)

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  id_card_formatter: ^0.0.33
```

---

## 🧠 Usage

### 📥 Import

```dart
import 'package:id_card_formatter/id_card_formatter.dart';
```

---

### 📅 Date format

```dart
String date = '12/08/2025'.
print(date.toDateFormat('yyyy-MM-dd'));            // 2025-08-12
print(date.toDateFormat('yyyy/MM/dd'));            // 2025/08/12
print(date.toDateFormat('dd-MM-yyyy HH:mm:ss'));  // 12-08-2025 00:00:00
```

---

### 🎛️ Generic ID Format

Format any ID using a custom pattern with `'X'` as placeholders.

```dart
print("123456789".genericFormat(format: "XXX-XXX-XXX"));       // 123-456-789
print("T123456789".genericFormat(format: "X-XXX-XXX-XXX"));    // T-123-456-789
print("123456789".genericFormat(format: "XXX XXX XXX"));       // 123 456 789
```

Use this when you need flexibility to support custom ID formats.

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

### 🆔 Phone Number Format

```dart
String phoneTz = '25512345789';
print(phoneTz.phoneFormat()); // (+255) 123 456 789
String phoneUs = '11234567890';
print(phoneUs.phoneFormat(pattern: '(+X) XXX XXX XXXX')); // (+1) 123 456 7890
```

---

### 🆔 Nida Format

```dart
String nida = '0000000000000000000';
print(nida.nidaFormat()); // 00000000-00000-00000-00
```

---

### 🆔 NCard Format

```dart
String ncard = '0000000000000000';
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

### `String.genericFormat({format})`

Formats using a custom pattern:  
Example: `"XXX-XXX-XXX"` → `123-456-789`

### `double.toFormat({locale, symbol, decimalDigits})`

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
