import 'package:flutter/material.dart';

class CanvasMainPage extends StatefulWidget {
  const CanvasMainPage({super.key});

  @override
  State<CanvasMainPage> createState() => _CanvasMainPageState();
}

class _CanvasMainPageState extends State<CanvasMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Praktikum : Penggambaran dan Algoritma Garis")));
  }
}
