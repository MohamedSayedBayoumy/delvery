import 'dart:ui';

import 'package:flutter/material.dart';

Future<void> loadingAlert(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: AlertDialog(
          alignment: AlignmentDirectional.center,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                  strokeWidth: 1.0,
                  strokeCap: StrokeCap.round,
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.end,
          actionsPadding: EdgeInsets.zero,
        ),
      );
    },
  );
}
