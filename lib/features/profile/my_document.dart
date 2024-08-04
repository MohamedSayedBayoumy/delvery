import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/functions/loading_ui.dart';
import '../../core/widgets/custom_padding.dart';
import '../../core/widgets/custom_text_filed.dart';
import 'controller/cubit/profile_cubit.dart';
import 'widget/doc_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyDocumentScreen extends StatelessWidget {
  final ProfileCubit profileCubit;

  const MyDocumentScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.my_document),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        bloc: profileCubit..getUserData(context, getDocument: true),
        listener: (context, state) {
          if (state is ProfileLoading) {
            loadingAlert(context);
          } else if (state is FailureProfileCase) {
            final snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {}
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: CustomPadding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(AppLocalizations.of(context)!.vehicle_type),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    controller: profileCubit.vichleTypeController,
                    enabled: false,
                  ),
                  const SizedBox(height: 25.0),
                    Text(AppLocalizations.of(context)!.vehicle_number),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    enabled: false,
                    controller: profileCubit.vichleNumberController,
                  ),
                  const SizedBox(height: 25.0),
                    Text(AppLocalizations.of(context)!.license_number),
                  const SizedBox(height: 10.0),
                  CustomTextField(
                    enabled: false,
                    controller: profileCubit.licenceNumberController,
                  ),
                  const SizedBox(height: 25.0),
                  DocumnetContainer(
                    link: profileCubit.idImage,
                  ),
                  const SizedBox(height: 25.0),
                  DocumnetContainer(
                    link: profileCubit.licenseImage,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
