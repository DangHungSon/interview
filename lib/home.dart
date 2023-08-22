import 'package:flutter/material.dart';
import 'package:interview/sreens/image_picker_mobile/image_picker_mobile.dart';
import 'package:interview/sreens/image_picker_tablet/image_picker_tablet.dart';
import 'package:interview/utils/responsive_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker"),
        ),
        body: const ResponsiveWidget(
          largeScreen: ImagePickerTablet(),
          smallScreen: ImagePickerMobile(),
        ),
      ),
    );
  }
}
