import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/controller/image_picker_controller.dart';
import 'package:interview/controller/select_image_controller.dart';

class SideBar extends StatelessWidget {
  final ImagePickerController _controller = Get.put(ImagePickerController());
  final SelectedImageController _selectedImageController = Get.put(SelectedImageController());

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
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
                        return GestureDetector(
                          onTap: () {
                            _selectedImageController.selectedImageUrl(
                                _controller.pickedImages[index]);
                          },
                          child: Column(
                            children: [
                              Image.file(File(
                                  _controller.pickedImages[index].imagePath ?? "")),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Text(_controller.pickedImages[index].name ?? ""),
                              ),
                            ],
                          ),
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
    );
  }
}
