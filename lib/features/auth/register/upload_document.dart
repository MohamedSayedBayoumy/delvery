import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/functions/loading_ui.dart';
import '../../../core/functions/take_image_dialog.dart';
import '../../../core/services/get_it/single_tone.dart';
import '../../../core/utils/navigation.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_padding.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../../bottom_navigation/bottom_navigation_screen.dart';
import '../controller/cubit/auth_cubit.dart';
import 'widget/container_upload_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.select_location),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: CustomPadding(
        child: BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is SuccessAuth) {
                NavigationHelper.navigateRemoveUntilTo(
                  context,
                  const BottomNavigationBarScreens(),
                );
              } else if (state is FailureAuth) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.message),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is LoadingAuth) {
                loadingAlert(context);
              } else {}
            },
            builder: (context, state) {
              final cubit = AuthCubit.get(context);

              return Column(
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
                        Text(AppLocalizations.of(context)!.vehicle_type),
                        const SizedBox(height: 14.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                        Text(AppLocalizations.of(context)!.vehicle_number),
                        const SizedBox(height: 14.0),
                        CustomTextField(
                          labelText: AppLocalizations.of(context)!
                              .enter_vehicle_number,
                          hinText: AppLocalizations.of(context)!
                              .enter_vehicle_number,
                          controller: cubit.vehicleNumberController,
                        ),
                        const SizedBox(height: 15.0),
                        Text(AppLocalizations.of(context)!.license_number),
                        const SizedBox(height: 14.0),
                        CustomTextField(
                          labelText: AppLocalizations.of(context)!
                              .enter_license_number,
                          hinText: AppLocalizations.of(context)!
                              .enter_license_number,
                          controller: cubit.licenceNumberController,
                        ),
                        const SizedBox(height: 15.0),
                        Text(AppLocalizations.of(context)!
                            .upload_driving_license),
                        const SizedBox(height: 14.0),
                        ContainerUploadWidget(
                          title: cubit.drivingLicenseImage == ''
                              ? AppLocalizations.of(context)!.license_image
                              : cubit.drivingLicenseImage.split("/").last,
                          onTap: () {
                            openBottomSheet(
                              context,
                              onChangedCamera: (camera) {
                                cubit.selectDriveLicense(camera);
                              },
                              onChangedImage: (image) {
                                cubit.selectDriveLicense(image);
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 15.0),
                          Text(
                            AppLocalizations.of(context)!.upload_national_id),
                        const SizedBox(height: 14.0),
                        ContainerUploadWidget(
                          title: cubit.nationalIDImage == ''
                              ? AppLocalizations.of(context)!.national_id
                              : cubit.nationalIDImage.split("/").last,
                          onTap: () {
                            openBottomSheet(
                              context,
                              onChangedCamera: (camera) {
                                cubit.selectOneNational(camera);
                              },
                              onChangedImage: (image) {
                                cubit.selectOneNational(image);
                              },
                            );
                          },
                        )
                      ],
                    )),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "For upload image of your document please attach the file of",
                    style: TextStyle(color: Colors.black, fontSize: 10.0),
                  ),
                  const Text(
                    ".jpeg .png",
                    style: TextStyle(
                        color: ConstantsColor.greenColor, fontSize: 10.0),
                  ),
                  const SizedBox(height: 10.0),
                  CustomButton(
                    height: 7.h,
                    buttonText: AppLocalizations.of(context)!.done,
                    onPressed: () {
                      cubit.uploadDocument(context);
                    },
                  ),
                  const SizedBox(height: 10.0),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
