import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/controller/image_picker_controller.dart';
import 'package:interview/sreens/image_picker_tablet/detail_view.dart';
import 'package:interview/sreens/image_picker_tablet/side_bar_view.dart';

class ImagePickerTablet extends StatefulWidget {
  const ImagePickerTablet({super.key});

  @override
  State<ImagePickerTablet> createState() => _ImagePickerTabletState();
}

class _ImagePickerTabletState extends State<ImagePickerTablet> {
  final ImagePickerController _controller = Get.put(ImagePickerController());

  @override
  void initState() {
    _controller.fetchLocationName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          SideBar(),
          DetailView()
        ],
      ),
    );
  }
}
