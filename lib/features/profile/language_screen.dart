import 'package:flutter/material.dart';
import 'package:mts/core/widgets/custom_padding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
        title:   Text(AppLocalizations.of(context)!.language),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: CustomPadding(
          child: Column(
            children: [
              ListTile(
                title: const Text("English"),
                trailing: Checkbox(
                  shape: const CircleBorder(),
                  checkColor: Colors.green,
                  fillColor: WidgetStateProperty.resolveWith(getColor),
                  value: true,
                  onChanged: (bool? value) {},
                ),
              ),
              const Divider(
                height: .5,
                thickness: 1.0,
              ),
              ListTile(
                title: const Text("Spanish"),
                trailing: Checkbox(
                  shape: const CircleBorder(),
                  checkColor: Colors.green,
                  fillColor: WidgetStateProperty.resolveWith(getColor),
                  value: true,
                  onChanged: (bool? value) {},
                ),
              ),
              const Divider(
                height: .5,
                thickness: 1.0,
              ),
              ListTile(
                title: const Text("Arabic"),
                trailing: Checkbox(
                  shape: const CircleBorder(),
                  checkColor: Colors.green,
                  fillColor: WidgetStateProperty.resolveWith(getColor),
                  value: true,
                  onChanged: (bool? value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
