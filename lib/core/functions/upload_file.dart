import 'dart:io';

import 'package:efor_admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final PickedFile? file = await ImagePicker()
      .getImage(source: ImageSource.camera, imageQuality: 25);
  if (file != null) {
    print(file.path); //
// /storage/emulated/0/Android/data/com.example.efor_admin/files/Pictures/scaled_edda197f-5c83-4d43-91e6-5609ad98696e998289375636786067.jpg
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:
        isSvg ? ['svg', 'SVG'] : ['png', 'PNG', 'jpg', 'jpeg', 'gif'],
  );

  if (result != null) {
    print(result.files.single.path); //
// /data/user/0/com.example.efor_admin/cache/file_picker/FB_IMG_1656708269744.jpg
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottomMenu(imageUploadCamera, fileUploadGallery) {
  Get.bottomSheet(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pick an image",
              style: TextStyle(
                fontSize: 22,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            ListTile(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              leading: const Icon(Icons.camera_alt, size: 40),
              title: const Text('Image From Camera',
                  style: TextStyle(fontSize: 20, color: AppColor.black)),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              leading: const Icon(Icons.image, size: 40),
              title: const Text('Image From Gallery',
                  style: TextStyle(fontSize: 20, color: AppColor.black)),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: AppColor.white,
  );
}
