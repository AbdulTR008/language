import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/languages.dart';
import '../riverpod/language_provider.dart';

class LanguagesScreen extends ConsumerStatefulWidget {
  const LanguagesScreen({super.key});

  @override
  ConsumerState<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends ConsumerState<LanguagesScreen> {
  final List<Language> _language = Language.languages();

  int? selectedLanguageIndex = 0;
  String? languageRec;

  void language(int index, String pickLang) {
    languageRec = pickLang;
    selectedLanguageIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: DropdownButton<int>(
                  value: selectedLanguageIndex,
                  dropdownColor: Colors
                      .blueGrey[50], // Background color of the dropdown items
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Colors.blue), // Icon color
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18), // Style of the selected item
                  items: _language.map((Language language) {
                    return DropdownMenuItem<int>(
                      value: _language.indexOf(language),
                      child: Text(
                        language.name,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16), // Style of the dropdown items
                      ),
                    );
                  }).toList(),
                  onChanged: (int? index) {
                    if (index != null) {
                      language(index, _language[index].languageCode);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
