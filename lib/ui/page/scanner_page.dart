// ignore_for_file: constant_identifier_names, use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';
import 'dart:io';

import 'package:bigaze/ui/page/common/widget/appbar.dart';
import 'package:bigaze/ui/page/common/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

enum ScannerFileSource { CAMERA, GALLERY }

enum ScannerLabelsConfig {
  PICKER_CAMERA_LABEL,
  PICKER_GALLERY_LABEL,
  // Add more labels as needed
}

class DocumentScannerFlutter {
  static MethodChannel get _channel =>
      const MethodChannel('document_scanner_flutter');

  static Future<File?> _scanDocument(
      ScannerFileSource source, Map<dynamic, String> androidConfigs) async {
    Map<String, String?> finalAndroidArgs = {};
    for (var entry in androidConfigs.entries) {
      finalAndroidArgs[entry.key.toString()] = entry.value;
    }

    String? path = await _channel.invokeMethod(
        source.toString().split('.').last.toLowerCase(), finalAndroidArgs);
    if (path == null) {
      return null;
    } else {
      if (Platform.isIOS) {
        path = path.split('file://')[1];
      }
      return File(path);
    }
  }

  static Future<File?> launch(BuildContext context,
      {ScannerFileSource? source,
      Map<dynamic, String> labelsConfig = const {}}) async {
    if (source != null) {
      return _scanDocument(source, labelsConfig);
    }
    return showModalBottomSheet<File>(
      context: context,
      isDismissible: false,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(
                labelsConfig[ScannerLabelsConfig.PICKER_CAMERA_LABEL] ??
                    'Camera',
              ),
              onTap: () async {
                Navigator.pop(
                  context,
                  await _scanDocument(
                    ScannerFileSource.CAMERA,
                    labelsConfig,
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.image_search),
              title: Text(
                labelsConfig[ScannerLabelsConfig.PICKER_GALLERY_LABEL] ??
                    'Photo Library',
              ),
              onTap: () async {
                Navigator.pop(
                  context,
                  await _scanDocument(
                    ScannerFileSource.GALLERY,
                    labelsConfig,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class PhotoViewer extends StatelessWidget {
  final List<File> galleryItems;
  final int selectedItemIndex;

  const PhotoViewer(
      {super.key, required this.galleryItems, this.selectedItemIndex = 0});

  @override
  Widget build(BuildContext context) {
    return PhotoViewGallery.builder(
      pageController: PageController(initialPage: selectedItemIndex),
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: FileImage(galleryItems[index]),
          initialScale: PhotoViewComputedScale.contained * 1,
          heroAttributes: PhotoViewHeroAttributes(
            tag: galleryItems[index].path,
          ),
        );
      },
      itemCount: galleryItems.length,
      loadingBuilder: (context, event) => Center(
        child: SizedBox(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 0),
          ),
        ),
      ),
    );
  }
}

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late List<File> scannedFiles;

  @override
  void initState() {
    super.initState();
    scannedFiles = [];
  }

  Future<void> _scanDocument(ScannerFileSource source) async {
    final file = await DocumentScannerFlutter.launch(context, source: source);
    if (file != null) {
      setState(() {
        scannedFiles.add(file);
      });
    }
  }

  Future<void> _generatePdf() async {
    final pdf = pw.Document();
    for (var file in scannedFiles) {
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(
                pw.MemoryImage(
                  file.readAsBytesSync(),
                ),
              ),
            );
          },
        ),
      );
    }

    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final File outputFile = File('$appDocPath/example.pdf');
    await outputFile.writeAsBytes(await pdf.save());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PDF generated successfully'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'Scanner and PDF Generator',
      ),
      body: Column(
        children: [
          Expanded(
            child: scannedFiles.isNotEmpty
                ? PhotoViewer(galleryItems: scannedFiles)
                : const Center(
                    child: Text('No scanned files'),
                  ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _scanDocument(ScannerFileSource.CAMERA),
                child: const Text('Scan from Camera'),
              ),
              ElevatedButton(
                onPressed: () => _scanDocument(ScannerFileSource.GALLERY),
                child: const Text('Pick from Gallery'),
              ),
              ElevatedButton(
                onPressed: scannedFiles.isNotEmpty ? _generatePdf : null,
                child: const Text('Generate PDF'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
