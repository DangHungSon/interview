import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/controller/image_picker_controller.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePickerController _controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Image picker"),
      ),
      body: Center(
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
                      itemCount: _controller.pickedImages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.file(
                                File(_controller.pickedImages[index].imagePath)),
                            Text(_controller.pickedImages[index].name),
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
      ),
    ));
  }
}
