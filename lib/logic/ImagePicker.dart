import 'package:image_picker/image_picker.dart';

abstract class ImagePickerFun {
  static Future<String?> getImagefromDevice(ImageSource source) async {
    ImagePicker _picker = ImagePicker();
    try {
      XFile? xFile = await _picker.pickImage(
          source: source,
          maxWidth: 686,
          maxHeight: 822,
          imageQuality: (source == ImageSource.camera) ? 75 : null);
      return xFile?.path;
    } catch (error) {
      Exception('>> getImage Error: $error');
    }
    return null;
  }
}
