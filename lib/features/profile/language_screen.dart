import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/services/local_storage/local_storage.dart';
import '../../core/widgets/custom_padding.dart';
import '../../main.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return Colors.white;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            children: [
              ListTile(
                onTap: () async {
                  MyApp.setLocale(context, const Locale("en"));

                  await SecureLocalStorage.set(
                    key: SecureLocalStorage.langeKey,
                    value: "en",
                  );
                },
                title: const Text("English"),
                // trailing: Checkbox(
                //   shape: const CircleBorder(),
                //   checkColor: Colors.green,
                //   fillColor: WidgetStateProperty.resolveWith(getColor),
                //   value: true,
                //   onChanged: (bool? value) {},
                // ),
              ),
              const Divider(
                height: .5,
                thickness: 1.0,
              ),
              ListTile(
                onTap: () async {
                  MyApp.setLocale(context, const Locale("ar"));
                  await SecureLocalStorage.set(
                    key: SecureLocalStorage.langeKey,
                    value: "ar",
                  );
                },
                title: const Text("Arabic"),
                // trailing: Checkbox(
                //   shape: const CircleBorder(),
                //   checkColor: Colors.green,
                //   fillColor: WidgetStateProperty.resolveWith(getColor),
                //   value: true,
                //   onChanged: (bool? value) {},
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
