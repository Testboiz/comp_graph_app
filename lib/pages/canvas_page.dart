import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as image_processor;
import 'package:image_picker/image_picker.dart';
import 'package:image_size_getter/file_input.dart';
// import 'package:path_provider/path_provider.dart';
import '../custom_theme/custom_theme.dart';
import 'package:flutter_image_processing/flutter_image_processing.dart' as fip;
import 'package:image_size_getter/image_size_getter.dart';

class CanvasPageWidget extends StatefulWidget {
  const CanvasPageWidget({super.key});

  @override
  State<CanvasPageWidget> createState() => _CanvasPageWidgetState();
}

enum Channels { Alpha, Red, Green, Blue }

class _CanvasPageWidgetState extends State<CanvasPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String filePath = "";
  File? imageFile;
  Uint8List? decodedImage;
  Uint8List? redChannel;
  Uint8List? greenChannel;
  Uint8List? blueChannel;

  late Uint8List originalImageBytes;

  late Image redChannelImage;
  late Image greenChannelImage;
  late Image blueChannelImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Uint8List getChannels(Uint8List imageBytes, Channels channel) {
    Uint8List outputBitmap = Uint8List(imageBytes.length);
    // fun fact, Uint8List dari sebuah Image() adalah dalam format ARGB
    for (int i = 0; i < imageBytes.length; i++) {
      switch (channel) {
        case Channels.Alpha:
          if (i % 4 == 0) {
            outputBitmap[i] = imageBytes[i];
          }
          break;
        case Channels.Red:
          if (i % 4 == 1) {
            outputBitmap[i] = imageBytes[i];
          }
          break;
        case Channels.Green:
          if (i % 4 == 2) {
            outputBitmap[i] = imageBytes[i];
          }
          break;
        case Channels.Blue:
          if (i % 4 == 3) {
            outputBitmap[i] = imageBytes[i];
          }
          break;
      }
    }
    return outputBitmap;
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
                            child: (imageFile != null)
                                ? Image.file(imageFile!,
                                    width: 300, height: 300, fit: BoxFit.fill)
                                : Image.network(
                                    'https://picsum.photos/seed/173/600',
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.fill),
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
                      onPressed: () async {
                        // process uploaded image
                        var imagePicker = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        // handle image upload
                        if (imagePicker != null) {
                          final pickedImage = File(imagePicker.path);
                          final imageBytes = pickedImage.readAsBytesSync();

                          final dimensions =
                              ImageSizeGetter.getSize(FileInput(pickedImage));

                          final width = dimensions.width;
                          final height = dimensions.height;

                          // setup decoders
                          final jpegDecoder = image_processor.JpegDecoder();
                          final pngDecoder = image_processor.PngDecoder();

                          image_processor.Image? processedOriginalImage;

                          image_processor.Image originalImage =
                              image_processor.Image(width, height);

                          image_processor.Image redChannelRGB =
                              image_processor.Image(width, height);
                          image_processor.Image greenChannelRGB =
                              image_processor.Image(width, height);
                          image_processor.Image blueChannelRGB =
                              image_processor.Image(width, height);

                          // handle image extensions
                          if (imagePicker.name.endsWith("png")) {
                            processedOriginalImage =
                                pngDecoder.decodeImage(imageBytes);
                          }
                          if (imagePicker.name.endsWith("jpeg")) {
                            processedOriginalImage =
                                jpegDecoder.decodeImage(imageBytes);
                          }
                          if (imagePicker.name.endsWith("jpg")) {
                            processedOriginalImage =
                                jpegDecoder.decodeImage(imageBytes);
                          }

                          for (int i = 0; i < width; i++) {
                            for (int j = 0; j < height; j++) {
                              int pixelValue =
                                  processedOriginalImage!.getPixel(i, j);
                              redChannelRGB.setPixelRgba(
                                  i, j, pixelValue >> 16 & 0xFF, 0, 0);
                              greenChannelRGB.setPixelRgba(
                                  i, j, 0, pixelValue >> 8 & 0xFF, 0);
                              blueChannelRGB.setPixelRgba(
                                  i, j, 0, 0, pixelValue & 0xFF);

                              originalImage.setPixel(i, j, pixelValue);
                            }
                          }
                          originalImageBytes =
                              originalImage.getBytes().buffer.asUint8List();

                          redChannel = image_processor.encodePng(redChannelRGB)
                              as Uint8List;
                          greenChannel = image_processor
                              .encodePng(greenChannelRGB) as Uint8List;
                          blueChannel = image_processor
                              .encodePng(blueChannelRGB) as Uint8List;

                          setState(() {
                            imageFile = File(imagePicker.path);
                            originalImageBytes = originalImageBytes;
                            redChannel = redChannel;
                            greenChannel = greenChannel;
                            blueChannel = blueChannel;
                          });
                        }
                      },
                      icon: const Icon(Icons.add),
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white)),
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
                              child: (imageFile != null)
                                  ? Image.memory(redChannel!,
                                      width: 300, height: 300, fit: BoxFit.fill)
                                  : Image.network(
                                      'https://picsum.photos/seed/173/600',
                                      width: 300,
                                      height: 300,
                                      fit: BoxFit.fill),
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
                              child: (imageFile != null)
                                  ? Image.memory(greenChannel!,
                                      width: 300, height: 300, fit: BoxFit.fill)
                                  : Image.network(
                                      'https://picsum.photos/seed/173/600',
                                      width: 300,
                                      height: 300,
                                      fit: BoxFit.fill),
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
                              child: (imageFile != null)
                                  ? Image.memory(blueChannel!,
                                      width: 300, height: 300, fit: BoxFit.fill)
                                  : Image.network(
                                      'https://picsum.photos/seed/173/600',
                                      width: 300,
                                      height: 300,
                                      fit: BoxFit.fill),
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
          )),
    );
  }
}
