import 'package:flutter/material.dart';
import 'package:graphics/custom_theme/custom_theme.dart';

class CanvasMainPage extends StatefulWidget {
  const CanvasMainPage({super.key});

  @override
  State<CanvasMainPage> createState() => _CanvasMainPageState();
}

class _CanvasMainPageState extends State<CanvasMainPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: CustomStyle.primaryBackground,
        appBar: AppBar(
            backgroundColor: CustomStyle.primary,
            title: const Text("Praktikum : Penggambaran dan Algoritma Garis")),
        body: CustomPaint(
          painter: MyPainter(),
          child: Container(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Cascade operator
    // instead of
    // Paint().color =
    // Paint().strokeWidth =
    // Paint().strokeCap =
    // it coule be like the bottomQ
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    // or even
    // MyClass..doStuff1()..doStuff2().. etc
    canvas.drawLine(const Offset(0, 0), const Offset(100, 100), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
