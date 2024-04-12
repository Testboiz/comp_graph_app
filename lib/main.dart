import 'package:flutter/material.dart';
import 'package:graphics/pages/canvas_page.dart';
import 'package:graphics/pages/markdown_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePageWidget(),
        '/MarkdownPage': (context) => const MarkdownPageWidget(),
        '/CanvasPage': (context) => const CanvasPageWidget(),
      },
    );
  }
}
