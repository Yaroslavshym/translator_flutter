import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_flutter/providers/main_page_provider.dart';
import 'package:translator_flutter/util/my_dropdown_button.dart';
import 'package:translator_flutter/util/my_text_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      body: LayoutBuilder(builder: (context, constraint) {
        List<Widget> widgets = [
          //   primary
          Consumer<MainPageProvider>(
            builder: (
              context,
              provider,
              child,
            ) {
              return MyTextBox(
                language: provider.primaryLanguage,
                textController: provider.primaryController,
                isReadOnly: false,
                size: constraint.maxWidth <= 800
                    ? Size(constraint.maxWidth, 0)
                    : Size((constraint.maxWidth - 10) / 2, 0),
              );
            },
          ),
          Consumer<MainPageProvider>(
            builder: (
              context,
              provider,
              child,
            ) {
              return MyTextBox(
                language: provider.secondaryLanguage,
                textController: provider.secondaryController,
                isReadOnly: true,
                size: constraint.maxWidth <= 800
                    ? Size(constraint.maxWidth, 0)
                    : Size((constraint.maxWidth - 10) / 2, 0),
              );
            },
          ),
        ];
        List<Widget> additionalWidgets = [
          MyDropdownButton(onChanged: (String? pick) {
            Map<String, String> languageNames =
                Provider.of<MainPageProvider>(context, listen: false)
                    .languageMap;

            Provider.of<MainPageProvider>(context, listen: false)
                .changeLanguageTo(pick.toString());
          }),
        ];
        // phone
        if (constraint.maxWidth <= 800) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgets + additionalWidgets,
            ),
          );
          //   desktop
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widgets,
                ),
                ...additionalWidgets,
              ],
            ),
          );
        }
      }),
    );
  }
}
