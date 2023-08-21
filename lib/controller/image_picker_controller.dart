import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interview/model/image_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ImagePickerController extends GetxController {
  var pickedImages = <ImageData>[].obs;
  var locationName = RxString('');

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = pickedFile.path.split('/').last;
      final savedImage =
          await File(pickedFile.path).copy('${appDir.path}/$fileName');

      await _fetchLocationName();
      pickedImages.add(ImageData(name: locationName.value, imagePath: savedImage.path));
    }
  }

  Future<void> _fetchLocationName() async {
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
      locationName.value = placeMark.locality ?? 'Unknown Location';
    } catch (e) {
      locationName.value = 'Location Error';
    }
  }
}
