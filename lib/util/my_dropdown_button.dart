import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/main_page_provider.dart';

class MyDropdownButton extends StatelessWidget {
  final void Function(String? pick) onChanged;
  const MyDropdownButton({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(builder: (context, provider, child) {
      var languageNames = provider.languageMap.keys;
      print(provider.translateTo);
      return DropdownButton<String>(
        value: provider.translateTo,
        dropdownColor: Colors.black,
        items: [
          for (int i = 0; i < languageNames.length; i++)
            DropdownMenuItem(
              child: Text(
                languageNames.elementAt(i),
                style: TextStyle(color: Colors.white),
              ),
              value: languageNames.elementAt(i),
            )
        ],
        onChanged: onChanged,
        // onChanged: (String? pick) {
        //   dropdownPick = '$pick';
        //   onChanged(pick);
        // },
      );
    });
  }
}
