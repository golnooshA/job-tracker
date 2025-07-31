import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/app_bar_builder.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  const WebViewPage({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..loadRequest(Uri.parse(url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    return Scaffold(
      appBar: AppBarBuilder(title: title),

      body: WebViewWidget(controller: controller),
    );
  }
}
