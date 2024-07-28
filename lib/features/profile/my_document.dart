import 'package:flutter/material.dart';

import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'widget/doc_container.dart';

class MyDocumentScreen extends StatelessWidget {
  const MyDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Document"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Vehicle Type"),
              const SizedBox(height: 10.0),
              CustomTextField(
                controller: TextEditingController(text: "Car"),
                enabled: false,
              ),
              const SizedBox(height: 25.0),
              const Text("Vehicle Number"),
              const SizedBox(height: 10.0),
              CustomTextField(
                enabled: false,
                controller: TextEditingController(text: "21213213213213"),
              ),
              const SizedBox(height: 25.0),
              const Text("Licence Number"),
              const SizedBox(height: 10.0),
              CustomTextField(
                enabled: false,
                controller: TextEditingController(text: "2022020202020202"),
              ),
              const SizedBox(height: 25.0),
              const DocumnetContainer(),
              const SizedBox(height: 25.0),
              const DocumnetContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
