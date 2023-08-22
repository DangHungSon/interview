import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/controller/select_image_controller.dart';
import 'package:intl/intl.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key});

  final SelectedImageController _selectedImageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Center(
        child: Obx(() {
          final selectedImagePath =
              _selectedImageController.selectedImageUrl.value;
          return selectedImagePath.imagePath != null &&
                  selectedImagePath.imagePath!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Image.file(File(selectedImagePath.imagePath!)),
                      Positioned(
                        bottom: 32,
                        right: 32,
                        child: Text(
                          "${DateFormat('yyyy/MM/dd').format(selectedImagePath.dateTime)} \n${selectedImagePath.name!}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32),
                        ),
                      )
                    ],
                  ),
                )
              : const Text('No image selected');
        }),
      ),
    );
  }
}
