import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PhotoService {
  Future<File> getGalleryPhoto() async {
    return await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800,
      maxWidth: 600,
    );
  }

  Future<File> getCameraPhoto() async {
    return await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 800,
      maxWidth: 600,
    );
  }
}
