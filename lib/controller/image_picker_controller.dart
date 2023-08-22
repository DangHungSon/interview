import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/model/image_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImagePickerController extends GetxController {
  var pickedImages = <ImageData>[].obs;
  var localPosition = '';

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = pickedFile.path.split('/').last;
      final savedImage =
          await File(pickedFile.path).copy('${appDir.path}/$fileName');

      pickedImages.add(ImageData(name: localPosition, imagePath: savedImage.path));
    }
  }

  Future<void> fetchLocationName() async {
    EasyLoading.show();
    try {
      await Geolocator.requestPermission();
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placeMark = placeMarks.first;
      localPosition = placeMark.subAdministrativeArea ?? "Unknown Location";
      // locationName.value = placeMark.subAdministrativeArea ?? 'Unknown Location';
    } catch (e) {
      localPosition = 'Location Error';
    }
    EasyLoading.dismiss();
  }
}
