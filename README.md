# bnb_flutter

[![GitHub Repo](https://img.shields.io/badge/GitHub-bnb__flutter-blue?logo=github)](https://github.com/touhid1333/bnb_flutter)
[![License](https://img.shields.io/github/license/touhid1333/bnb_flutter)](https://github.com/touhid1333/bnb_flutter/blob/master/LICENSE)

A highly customizable Flutter bottom navigation bar package with smooth animations and flexible item
support. Built for simplicity, responsiveness, and a native look and feel.

---

## ✨ Features

* 🎨 UI with smooth transition animations
* 📱 Supports fixed and shifting navigation bar types
* 🔄 State persistence across tab switches
* 🔧 Easily integrates into any Flutter project

---

## 💻 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  bnb_flutter: ^<latest_version>
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Getting Started

Import the package:

```dart
import 'package:bnb_flutter/bnb_flutter.dart';
```

Use the `BnbWidget` widget in your scaffold:

```dart
class MyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BnbWidget(
      items: [
        BnbItem(
          iconData: Icons.home,
        ),
        BnbItem(
          iconData: Icons.list,
        ),
        BnbItem(
          iconData: Icons.settings,
        ),
        BnbItem(
          iconData: Icons.book_outlined,
        ),
        BnbItem(
          iconData: Icons.person,
        ),
      ],
      onTap: (p0) =>
          setState(() {
            selectedIndex = p0;
          }),
      selectedIndex: selectedIndex,
      style: BnbStyle(
        iconSize: const Size(24, 24),
      ),
    );
  }
}
```

---

## 📂 Example

For a complete example, check
the [example project](https://github.com/touhid1333/bnb_flutter/tree/master/example) included in the
repository

---

## 📸 Screenshot

![Screenshot](https://raw.githubusercontent.com/touhid1333/bnb_flutter/master/assets/screenshot.jpg)


---

## 🛠️ Contribution

Contributions are welcome! Feel free to open issues or submit PRs.

1. Fork the repo
2. Create a new branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/my-feature`)
5. Create a new Pull Request

---

## 📄 License

This project is licensed under the BSD 3-Clause License - see
the [LICENSE](https://github.com/touhid1333/bnb_flutter/blob/master/LICENSE) file for details.

---

## 🤝 Author

Developed with ❤️ by [Touhid](https://github.com/touhid1333)

