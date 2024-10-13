import 'package:flutter/material.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerostein',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const WebPage(),
    );
  }
}

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    initKioskMode();
  }

  initKioskMode() async {
    await startKioskMode();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://strichliste.fsr5.de'));
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
