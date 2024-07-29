import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/services/get_it/single_tone.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../controller/cubit/auth_cubit.dart';
import 'set_location.dart';
import 'widget/container_upload_widget.dart';

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: BlocProvider<AuthCubit>(
                  create: (context) => sl<AuthCubit>(),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final cubit = AuthCubit.get(context);

                      return Column(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: ConstantsColor.fillTextFiled,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: DropdownButton<String>(
                              value: cubit.type,
                              isExpanded: true,
                              underline: const SizedBox(),
                              style: const TextStyle(color: Colors.black54),
                              items: cubit.types.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                cubit.typeVehicle(value);
                              },
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          const Text("Vehicle Number"),
                          const SizedBox(height: 14.0),
                          CustomTextField(
                            labelText: "Enter Vehicle Number",
                            hinText: "Enter Vehicle Number",
                            controller: cubit.vehicleNumber,
                          ),
                          const SizedBox(height: 15.0),
                          const Text("Licence Number"),
                          const SizedBox(height: 14.0),
                          CustomTextField(
                            labelText: "Enter Licence Number",
                            hinText: "Enter Licence Number",
                            controller: cubit.licenceNumber,
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
                      );
                    },
                  ),
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
              onPressed: () {
                NavigationHelper.navigateTo(
                  context,
                  const SelectLocationScreen(),
                );
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
