import 'dart:ui';

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
            'Praktikum : Pemisahan Warna RGB',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                Row(
                  children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: CustomStyle.primaryBackground,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://picsum.photos/seed/173/600',
                                width: 300,
                                height: 300,
                                fit:BoxFit.fill
                              ),
                            ),
                            Text(
                              'Gambar Input',
                              textAlign: TextAlign.center,
                              style: CustomStyle.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          // buat logic upload gambar banh
                        }, 
                        icon: const Icon(Icons.add),
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.white
                            )
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hasil pemisahan RGB",
                          style: CustomStyle.bodyMedium,
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: CustomStyle.primaryBackground,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/173/600',
                                  width: 300,
                                  height: 300,
                                  fit:BoxFit.fill
                                ),
                              ),
                              Text(
                                'Komponen Merah',
                                textAlign: TextAlign.center,
                                style: CustomStyle.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: CustomStyle.primaryBackground,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/173/600',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Komponen Hijau',
                                textAlign: TextAlign.center,
                                style: CustomStyle.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: CustomStyle.primaryBackground,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://picsum.photos/seed/173/600',
                                  width: 300,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                'Komponen Biru',
                                textAlign: TextAlign.center,
                                style: CustomStyle.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
