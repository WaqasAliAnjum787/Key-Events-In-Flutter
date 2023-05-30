import 'package:flutter/services.dart';

extension TextFieldTest on LogicalKeyboardKey {
  bool isDigit() {
    return keyId >= LogicalKeyboardKey.digit0.keyId &&
            keyId <= LogicalKeyboardKey.digit9.keyId ||
        keyId == LogicalKeyboardKey.backspace.keyId;
  }
}
