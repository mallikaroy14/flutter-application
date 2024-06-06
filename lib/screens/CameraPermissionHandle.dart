import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPermissionHandle extends StatefulWidget {
  const CameraPermissionHandle({super.key});

  @override
  State<StatefulWidget> createState() => _CameraPermissionHandle();
}

class _CameraPermissionHandle extends State<CameraPermissionHandle> {
  Uint8List? image;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image != null
              ? CircleAvatar(
                  radius: 100,
                  backgroundImage: MemoryImage(image!),
                )
              : const CircleAvatar(radius: 100),
          ElevatedButton(
              onPressed: () {
                _settingModalBottomSheet(context);
              },
              child: Text("Upload Image"))
        ],
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  title: const Text('Gallery'),
                  onTap: () => {
                        _pickImageFromGallery(),
                        Navigator.pop(context),
                      }),
              ListTile(
                title: const Text('Camera'),
                onTap: () =>
                    {imageUploadFromCamera(), Navigator.pop(context)},
              ),
            ],
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      image = selectedImage?.readAsBytesSync();
    });
  }

  Future imageUploadFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      image = selectedImage?.readAsBytesSync();
    });
  }
}
