import 'package:flutter/material.dart';
import 'package:mts/core/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'widget/container_upload_widget.dart';

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> types = ['Car', 'bike', 'bicycle'];
    String type = types[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Document"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: CustomPadding(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/LOGO SAFRI.jpg", width: 30.w),
                      ],
                    ),
                    const Text("Vehicle Type"),
                    const SizedBox(height: 14.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: ConstantsColor.fillTextFiled,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: DropdownButton<String>(
                        value: type,
                        isExpanded: true,
                        underline: const SizedBox(),
                        style: const TextStyle(color: Colors.black54),
                        items: types.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const Text("Vehicle Number"),
                    const SizedBox(height: 14.0),
                    CustomTextField(
                      labelText: "Enter Vehicle Number",
                      hinText: "Enter Vehicle Number",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 15.0),
                    const Text("Licence Number"),
                    const SizedBox(height: 14.0),
                    CustomTextField(
                      labelText: "Enter Licence Number",
                      hinText: "Enter Licence Number",
                      controller: TextEditingController(),
                    ),
                    const SizedBox(height: 15.0),
                    const Text("Upload Your Driving License"),
                    const SizedBox(height: 14.0),
                    const ContainerUploadWidget(
                      title: "License Image",
                    ),
                    const SizedBox(height: 15.0),
                    const Text("Upload Your One of National ID"),
                    const SizedBox(height: 14.0),
                    const ContainerUploadWidget(
                      title: "License Image",
                    )
                  ],
                ),
              ),
            ),
            const Text(
              "For upload image of your document please attach the file of",
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            ),
            const Text(
              ".jpeg .png",
              style:
                  TextStyle(color: ConstantsColor.greenColor, fontSize: 10.0),
            ),
            const SizedBox(height: 10.0),
            CustomButton(
              height: 7.h,
              buttonText: "Done , Let's go!",
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
