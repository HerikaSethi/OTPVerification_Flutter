import 'package:flutter/material.dart';

class LanguageDropdown extends StatefulWidget {
  final ValueChanged<String> onLanguageChanged; 

  const LanguageDropdown({
    required this.onLanguageChanged, // Add this line
    Key? key,
  }) : super(key: key);

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
  
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String selectedLanguage = 'English'; // Default selected language
  List<String> languages = ['English', 'Spanish', 'French', 'German']; // List of languages

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 72),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 1.0, // Border width
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:12.0),
          child: DropdownButton<String>(
           isExpanded: true,
            underline: SizedBox(),
            value: selectedLanguage,
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedLanguage = newValue;
                });
               
                // Notify the parent widget about the language change
                widget.onLanguageChanged(selectedLanguage);
              }
            },
            items: languages.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}