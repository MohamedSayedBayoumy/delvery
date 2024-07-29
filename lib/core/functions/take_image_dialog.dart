import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

openBottomSheet(
  context, {
  required void Function(String?)? onChangedCamera,
  required void Function(String?)? onChangedImage,
}) =>
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (context) {
        final ImagePicker picker = ImagePicker();

        return Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              start: 10.0,
              end: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: InkWell(
                  onTap: () async {
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                    onChangedCamera!(photo!.path);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.camera_alt_rounded),
                      Text("Camera"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: InkWell(
                  onTap: () async {
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    onChangedCamera!(image!.path);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.image),
                      Text("Image"),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
