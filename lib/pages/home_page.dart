import 'package:flutter/material.dart';
import '../custom_theme/custom_theme.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
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
      appBar: AppBar(
        backgroundColor: CustomStyle.primary,
        automaticallyImplyLeading: false,
        title: const Align(
          alignment: AlignmentDirectional(-1, -1),
          child: Text(
            'Graphics',
            style: TextStyle(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          scrollDirection: Axis.vertical,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: const Color.fromRGBO(0, 0, 0, 0),
              onTap: () async {
                Navigator.of(context).pushNamed(
                  '/MarkdownPage',
                );
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: CustomStyle.secondaryBackground,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/261/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Pengenalan Komputer Grafis',
                      textAlign: TextAlign.center,
                      style: CustomStyle.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.of(context).pushNamed('/CanvasPage');
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: CustomStyle.secondaryBackground,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/173/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Praktikum : Pemisahan Warna RGB',
                      textAlign: TextAlign.center,
                      style: CustomStyle.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.of(context).pushNamed('/MarkdownPage');
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: CustomStyle.secondaryBackground,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/601/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Sistem Koordinat dan Struktur Data dalam Komputer Grafis',
                      textAlign: TextAlign.center,
                      style: CustomStyle.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.of(context).pushNamed('/CanvasPage');
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: CustomStyle.secondaryBackground,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://picsum.photos/seed/645/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Praktikum : Menggambar Garis dalam Koordinat Kartesius',
                      textAlign: TextAlign.center,
                      style: CustomStyle.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: CustomStyle.secondaryBackground,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/431/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Teori 1',
                    style: CustomStyle.bodyMedium,
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: CustomStyle.secondaryBackground,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/853/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Praktikum 1',
                    style: CustomStyle.bodyMedium,
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: CustomStyle.secondaryBackground,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/474/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Teori 2',
                    style: CustomStyle.bodyMedium,
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: CustomStyle.secondaryBackground,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/seed/129/600',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Praktikum 2',
                    style: CustomStyle.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
