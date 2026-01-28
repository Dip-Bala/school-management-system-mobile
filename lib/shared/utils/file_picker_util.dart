// TODO: Add file_picker dependency to pubspec.yaml
// import 'package:file_picker/file_picker.dart';

class FilePickerUtil {
  static Future<String?> pickImage() async {
    // TODO: Implement image picker
    // final result = await FilePicker.platform.pickFiles(type: FileType.image);
    // if (result != null) {
    //   return result.files.single.path;
    // }
    return null;
  }

  static Future<String?> pickFile() async {
    // TODO: Implement file picker
    // final result = await FilePicker.platform.pickFiles();
    // if (result != null) {
    //   return result.files.single.path;
    // }
    return null;
  }

  static Future<List<String>> pickMultipleFiles() async {
    // TODO: Implement multiple file picker
    // final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    // if (result != null) {
    //   return result.paths.whereType<String>().toList();
    // }
    return [];
  }
}
