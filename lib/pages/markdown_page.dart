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

    String text = """
# PERT 1 - Pengenalan Komputer Grafis

## Definisi Komputer Grafis

>**Note**
>
>*A picture is worth a thousand words*

>**Definisi**
>Komputer grafis adalah ilmu yang mempelajari bagaimana informasi dapat ditampilkan melalui komputer. 


Karena bahasa dan budaya terikat, maka persepsi terhadap suatu objek melalui bahasa akan bergantung terhadap budaya tiap pihak, sehingga visual membantu kita untuk menggambarkan objek secara universal.

Dalam pengolahan komputer, ada grafik dan citra. Perbandingannya adalaj seperti berikut

| Grafik | Citra |
| ---- | ---- |
| Berbasis Vektor | Berbasis piksel |
| Mengolah objek 2D/3D menjadi basis citra | Mengolah grafik untuk menghasilkan visual |
| Menggambar | Melukis |

## Fungsi Komputer Grafis

>**Tip**
> Vektor adalah garis
> Edge adalah sudut

Grafik terbuat dengan menarik vektor pada tiap edge. Pemrosesan dapat bersifat pasif seperti pada aplikasi Galeri, maupun dinamis seperti pada MSPaint.  

> Segala hal yang ditampilkan melalui layar komputer adalah grafika

**Motion Dynamic** adalah grafik yang bergerak dimana kita bersifat pengamat seperti pada animasi

**Update Dynamic** adalah grafik yang memodifikasikan sifatnya pada saat diamati seperti pada simulasi fisika.

Struktur data yang dapat digunakan untuk menyimpan suatu grafis adalah berikut

```
	/* array */
	int x[SIZE];
	int y[SIZE];
	// higher dimensional points here
	int direction[SIZE][DIRECTION_SIZE];
	
	/* record/struct */
	struct Point {
		int x;
		int y;
		// higher dimensional points here
		int direction[DIRECTION_SIZE];
	}

```

`direction` juga dapat dimodelkan dengan `struct`, Adajency Matrix maupun Linked List

**Rasterisasi** adalah proses untuk menghasilkan citra dari grafis yang telah dibuat menjadi suatu tampilan yang dapat digambarkan oleh layar komputer.

## Penerapan Komputer Grafis

Selain dalam mengarahkan bagaimana komputer dapat menampilkan sesuatu pada layar, ilmu kompuer grafis digunakan dalam mendesain 2D dan 3D melalui aplikasi-aplikasi modelling, drawing, rendering, graphing, simulation, game dsb.

Selain itu juga komputer grafis membantu untuk memvisualisasikan teori-teori dalam teori graf.
""";

String textPert2 = r"""
## PERT 2 - Sistem Koordinat dan Struktur Data Komputer Grafis

## Sistem Koordinat Kartesius

[Koordinat Kartesius](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) yang ada dalam ilmu matematika digunakan dalam ilmu komputer grafis dalam menggambarkan grafik dalam komputer. Dalam sistem koordinat tersebut ada beberapa hal yang perlu diperhatikan yaitu
+ Koordinat (x,y) dalam 2D atau (x,y,z) dalam 3D
+ Kuadran (untuk 2D ada 4 kuadran, yang dimulai dari $x$ positif, $y$ positif secara berlawanan jarum jam)
!()[]

## Koordinat Layar

Koordinat layar merupakan sistem koordinat yang mirip dengan koordinat kartesius, perbedaannya adalah titik pusatnya ada pada kiri atas sehingga menyerupai kuadran IV dengan nilai $(x,y)$ positif
!()[]

Dalam Pascal terdapat Form dan Kanvas yang berupa representasi virtual dari layar, yang mengadaptasi sistem koordinat layar. Kanvas tersebut dapat memiliki `TImage` 

## Konversi Koordinat

Karena adanya perbedaan akan koodinat kartesius dengan koordinat layar, maka diperlukan konversi. Untuk melakukan konversi, kita perlu melakukan transformasi geometri yang berupa translasi. Rumusnya adalah
```
x' = col + x
y' = row + y
```

Untuk konversi balik memiliki rumus berikut

```
x = col - x'
y = row - y'
```
## Struktur Data Komputer Grafis

Berbagai jenis pendekatan dapat dilakukan untuk menggambarkan vektor dan arah yaitu, 
Vektor dapat digambarkan sebagai koordinat $(x,y)$ atau $(x,y,z)$ yang dapat direpresentasikan dengan List/Array ataupun Record/Object.

Sedangkan Arah vektor dapat disimpan menggunakan 
+ Indeks Vektor
+ Adjacency Matrix (menggunakan matriks dimana 1 menandakan koneksi, dan 0 adalah tidak)
+ Dataset Arah (menggunakan bentuk yang lebih kompleks untuk merepresentasikan arah)
+ Linked List (menggunakan urutan untuk menentukan arah)

Dalam Adjacency Matrix, baris merupakan sumber dari vektor, sedangkan kolom adalah tujuan


""";

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
          'PERT 1 - Pengenalan Komputer Grafis',
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
            child: Markdown(data: textPert2),
          )
          ),
      ),
    );
  }
}
