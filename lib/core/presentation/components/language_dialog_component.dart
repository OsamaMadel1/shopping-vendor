import 'package:app/translations.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LanguageDialogComponent extends StatelessWidget {
  const LanguageDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final currentCode = I18n.of(context).locale.languageCode;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text("Select Language".i18n),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            selected: I18n.of(context).locale.toString() == "en-US",
            leading: const Icon(Icons.language),
            title: const Text('English'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('language', 'en-US');
              Intl.defaultLocale = 'en-US';
              await MyI18n.loadTranslations();
              I18n.of(context).locale = const Locale('en', 'us');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            selected: I18n.of(context).locale.toString() == "ar-SA",
            leading: const Icon(Icons.language),
            title: const Text('العربية'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('language', 'ar-SA');
              Intl.defaultLocale = 'ar-SA';
              await MyI18n.loadTranslations();
              I18n.of(context).locale = const Locale('ar', 'sa');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
