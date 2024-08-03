import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  child: Row(
                    children: [
                      const Icon(Icons.camera_alt_rounded),
                      Text(AppLocalizations.of(context)!.camera),
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
                  child: Row(
                    children: [
                      const Icon(Icons.image),
                      Text(AppLocalizations.of(context)!.image),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
