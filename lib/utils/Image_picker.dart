import 'dart:io';
import 'package:mistri_on_call_new/constant/app_exports.dart';

class ImageSelector {
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImage(BuildContext context,
      {required ImageSource source}) async {
    // Pick the image with high quality
    File? imageFile = await _pickImageWithQuality(source, 100);

    if (imageFile == null) {
      print('No image selected.');
      return null;
    }

    int fileSizeInBytes = await imageFile.length();
    double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
    print('Selected image size: ${fileSizeInMB.toStringAsFixed(2)} MB');

    // Check if the image size exceeds 2.5 MB
    if (fileSizeInMB > 2) {
      print('Image size exceeds 2 MB, reducing quality...');
      // Pick the image again with reduced quality
      imageFile =
          await _pickImageWithQuality(source, 80); // Adjust quality as needed

      if (imageFile == null) {
        print('Failed to pick image with reduced quality.');
        return null;
      }
      // Print new image size
      int newFileSizeInBytes = await imageFile.length();
      double newFileSizeInMB = newFileSizeInBytes / (1024 * 1024);
      print('Compressed image size: ${newFileSizeInMB.toStringAsFixed(2)} MB');
    }

    return imageFile;
  }

  Future<File?> _pickImageWithQuality(ImageSource source, int quality) async {
    final pickedFile =
        await _picker.pickImage(source: source, imageQuality: quality);
    if (pickedFile == null) {
      return null;
    }
    return File(pickedFile.path);
  }

  void showImagePicker(BuildContext context, Function(File) onImagePicked) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.photo_library,
                  color:primaryColor,
                ),
                title: const Text(
                  "Pick Image from Gallery",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final image =
                      await getImage(context, source: ImageSource.gallery);
                  if (image != null) {
                    onImagePicked(image);
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt,
                  color: primaryColor,
                ),
                title: const Text(
                  "Take a Picture",
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  Navigator.pop(context);
                  final image = await getImage(
                    context,
                    source: ImageSource.camera,
                  );
                  if (image != null) {
                    onImagePicked(image);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
