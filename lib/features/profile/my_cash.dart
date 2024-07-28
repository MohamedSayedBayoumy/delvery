import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/colors.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';

class MyCashBalanceScreen extends StatelessWidget {
  const MyCashBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cash Balance"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            children: [
              Container(
                width: 100.0.w,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: ConstantsColor.fillTextFiled.withOpacity(.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Balance",
                      style: TextStyle(color: Colors.black54),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "\$0",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    CustomTextField(
                      hinText: "Search Order ID",
                      labelText: "Search Order ID",
                      controller: TextEditingController(),
                      suffixWidget:
                          const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
