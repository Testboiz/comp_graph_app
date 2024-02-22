import 'package:flutter/material.dart';
import '../custom_theme/custom_theme.dart';


class CanvasPageWidget extends StatefulWidget {
  const CanvasPageWidget({super.key});

  @override
  State<CanvasPageWidget> createState() => _CanvasPageWidgetState();
}

class _CanvasPageWidgetState extends State<CanvasPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomStyle.primaryBackground,
        appBar: AppBar(
          backgroundColor: CustomStyle.primary,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
        ),
          title: const Text(
            'Nama Praktikum',
            style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
          )
        ),
      );
  }
}
