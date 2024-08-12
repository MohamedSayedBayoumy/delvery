import 'package:flutter/material.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_padding.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeleveryOrderScreen extends StatefulWidget {
  const DeleveryOrderScreen({super.key});

  @override
  State<DeleveryOrderScreen> createState() => _DeleveryOrderScreenState();
}

class _DeleveryOrderScreenState extends State<DeleveryOrderScreen> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // loadingAlert(context);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(
                controller: controller,
              ),
            ),
            CustomPadding(
              top: 10.0,
              bottom: 10.0,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () {},
                      buttonText: "order Return",
                      buttonColor: Colors.red,
                      borderColor: Colors.red,
                      raduis: 7.0,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: CustomButton(
                      onPressed: () {},
                      buttonText: "تم التوصيل",
                      buttonColor: Colors.green,
                      borderColor: Colors.green,
                      raduis: 7.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
