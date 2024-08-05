import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/utils/navigation.dart';
import '../controller/cubit/profile_cubit.dart';
import '../edit_profile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileCardWidget extends StatelessWidget {
  final ProfileCubit profileCubit;

  const ProfileCardWidget({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: ConstantsColor.fillTextFiled.withOpacity(.5),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15.w,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(profileCubit.userImage),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Mohamed"),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: Text("mohamed@gamil.com"),
                ),
                InkWell(
                  onTap: () {
                    NavigationHelper.navigateTo(
                      context,
                      EditProfileScreen(
                        profileCubit: profileCubit,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.edit,
                          color: ConstantsColor.greenColor,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          AppLocalizations.of(context)!.edit_profile,
                          style: const TextStyle(
                            color: ConstantsColor.greenColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
