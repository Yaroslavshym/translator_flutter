import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_flutter/providers/main_page_provider.dart';

class MyTextBox extends StatelessWidget {
  final String language;
  final TextEditingController textController;
  final bool isReadOnly;
  final Size size;
  const MyTextBox({
    super.key,
    required this.size,
    required this.language,
    required this.textController,
    required this.isReadOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: Column(
        children: [
          // language
          Text(
            language,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          TextField(
            controller: textController,
            readOnly: isReadOnly,
            cursorColor: Colors.white,
            onChanged: (s) {
              Provider.of<MainPageProvider>(context, listen: false).update();
            },
            onEditingComplete: () {
              Provider.of<MainPageProvider>(context, listen: false).update();
            },
            style: TextStyle(
              fontSize: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
