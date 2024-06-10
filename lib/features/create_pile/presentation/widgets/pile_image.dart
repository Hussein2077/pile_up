import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pile_up/core/resource_manager/colors.dart';
import 'package:pile_up/core/utils/app_size.dart';
class PileImage extends StatefulWidget {
  const PileImage({super.key});
  static File? imageFile;
  @override
  State<PileImage> createState() => _PileImageState();
}

class _PileImageState extends State<PileImage> {
  void _openImagePicker() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {

        PileImage.imageFile = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: _openImagePicker,
      child: Container(
        height: AppSize.screenHeight! * .2,
        width: AppSize.screenWidth! * .84,
        decoration: BoxDecoration(
            color: AppColors.greyColor3,
            border:
            Border.all(color: AppColors.greyColor4),
            borderRadius: BorderRadius.circular(
                AppSize.defaultSize!)),
        child: PileImage.imageFile != null?
        Image.file(
          PileImage.imageFile!,
          // width: AppSize.defaultSize! * 10,
          // height: AppSize.defaultSize! * 10,
          fit: BoxFit.cover,

        ):
        Icon(
          Icons.add_a_photo,
          color: Colors.white,
          size: AppSize.defaultSize! * 7,
        ),
      ),
    );
  }
}
