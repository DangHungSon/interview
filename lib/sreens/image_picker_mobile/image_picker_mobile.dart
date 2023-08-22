import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/controller/image_picker_controller.dart';

class ImagePickerMobile extends StatefulWidget {
  const ImagePickerMobile({super.key});

  @override
  State<ImagePickerMobile> createState() => _ImagePickerMobileState();
}

class _ImagePickerMobileState extends State<ImagePickerMobile> {
  final ImagePickerController _controller = Get.put(ImagePickerController());

  @override
  void initState() {
    _controller.fetchLocationName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _controller.pickImage(ImageSource.camera),
            child: const Text('Pick Image from Camera'),
          ),
          Expanded(
            child: Obx(
              () {
                if (_controller.pickedImages.isEmpty) {
                  return const Center(
                    child: Text('No Images'),
                  );
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _controller.pickedImages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.file(File(
                              _controller.pickedImages[index].imagePath ?? "")),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              _controller.pickedImages[index].name ?? "",
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
