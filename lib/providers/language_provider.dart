import 'package:flutter/material.dart';

/// Manages the selected language (English / Hindi) across the app.
/// Uses ChangeNotifier for simple state management without external packages.
class LanguageProvider extends ChangeNotifier {
  // 'en' for English, 'hi' for Hindi
  String _language = 'en';

  String get language => _language;
  bool get isHindi => _language == 'hi';
  bool get isEnglish => _language == 'en';

  void setLanguage(String lang) {
    if (_language != lang) {
      _language = lang;
      notifyListeners();
    }
  }

  void toggleLanguage() {
    _language = _language == 'en' ? 'hi' : 'en';
    notifyListeners();
  }
}
