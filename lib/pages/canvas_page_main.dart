import 'package:flutter/material.dart';
import 'package:graphics/custom_theme/custom_theme.dart';

class CanvasMainPage extends StatefulWidget {
  const CanvasMainPage({super.key});

  @override
  State<CanvasMainPage> createState() => _CanvasMainPageState();
}

class _CanvasMainPageState extends State<CanvasMainPage> {
  @override
  void initState() {
    super.initState();
  }

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
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  // Cascade operator
  // instead of
  // Paint().color =
  // Paint().strokeWidth =
  // Paint().strokeCap =
  // it coule be like the bottom
  // TODO : use colorpicker values
  var pen = Paint()
    ..color = Colors.black
    ..strokeWidth = 1
    ..strokeCap = StrokeCap.round;
  // or even
  // MyClass..doStuff1()..doStuff2().. etc

  @override
  void paint(Canvas canvas, Size size) {}

  void clear(Canvas canvas, Size size) {
    var xyAxisPath = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height)
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    canvas.drawColor(Colors.white, BlendMode.color);
    canvas.drawPath(xyAxisPath, pen);
  }

  void drawLine(
      Canvas canvas, double x1, double y1, double x2, double y2, Size size) {
    // TODO : handle oob and NaN situation
    var path = Path()
      ..moveTo(x1, y1)
      ..lineTo(x2, y2);

    canvas.drawPath(path, pen);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
