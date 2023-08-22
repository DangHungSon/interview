
import 'package:get/get.dart';
import 'package:interview/model/image_model.dart';

class SelectedImageController extends GetxController {
  var selectedImageUrl = ImageData().obs;

  void setImage(ImageData imageData) {
    selectedImageUrl.value = imageData;
  }
}