import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_flutter/pages/main_page.dart';
import 'package:translator_flutter/providers/main_page_provider.dart';
import 'package:window_size/window_size.dart';
// import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isMacOS) {
    setWindowTitle("My Translator App");
    setWindowMinSize(const Size(400, 800));
    // setWindowMaxSize(const Size(400, 800));
  }
  runApp(const MyApp());
}s

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => MainPageProvider(),
        ),
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
