import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:markdown/markdown.dart' as md;
import '../custom_theme/custom_theme.dart';

class MarkdownPageWidget extends StatefulWidget {
  const MarkdownPageWidget({super.key});

  @override
  State<MarkdownPageWidget> createState() => _MarkdownPageWidgetState();
}

class _MarkdownPageWidgetState extends State<MarkdownPageWidget> {

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
          'Nama Page Teori',
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
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Markdown(data: "# Hello World"),
          )
          ),
      ),
    );
  }
}
