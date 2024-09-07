import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:bigaze/ui/page/common/widget/appbar.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<Asset> _images = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openGallery();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: "Select Photos",
      ),
      body: _images.isEmpty
          ? const Center(child: Text("Opening gallery..."))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                Asset asset = _images[index];
                return AssetThumb(
                  asset: asset,
                  width: 300,
                  height: 300,
                );
              },
            ),
    );
  }

  void _openGallery() async {
    try {
      List<Asset>? resultList = await MultiImagePicker.pickImages(
        maxImages: 10, // You can set a limit for the number of images
        enableCamera: false,
        selectedAssets: _images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Select Photos",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
          statusBarColor: "#abcdef",
          lightStatusBar: true,
        ),
      );
      setState(() {
        _images = resultList;
      });
    } on Exception catch (e) {
      print('Error: $e');
    }
  }
}
