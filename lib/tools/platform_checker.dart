import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformChecker {
  bool isDesktopInterface() {
    // Истина, если интерфейс должен быть десктопный, ложь - интерфейс мобильный
    if (kIsWeb)
      return true;
    else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
      return true;
    else
      return false;
  }
}