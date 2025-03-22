import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const bill());
}

class bill extends StatelessWidget {
  const bill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Invoice App'),
        ),
        body: const Center(
          child: InvoiceButton(),
        ),
      ),
    );
  }
}

class InvoiceButton extends StatelessWidget {
  const InvoiceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the WebView page when the button is clicked
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InvoiceWebView()),
        );
      },
      child: const Text('Open Invoice'),
    );
  }
}

class InvoiceWebView extends StatefulWidget {
  const InvoiceWebView({Key? key}) : super(key: key);

  @override
  _InvoiceWebViewState createState() => _InvoiceWebViewState();
}

class _InvoiceWebViewState extends State<InvoiceWebView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // WebView now automatically uses the correct platform, no need to manually set it.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Viewer'),
      ),
      body: Column(
        children: [
          // WebView to display the webpage
          Expanded(
            child: WebViewWidget(
              controller: _webViewController,
            ),
          ),
          // Browser button below the WebView
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Load the URL in WebView when the button is clicked
                _webViewController.loadUrl(Uri.parse(
                    'https://your-invoice-url.com')); // Replace with the invoice URL
              },
              child: const Text('Open in Browser'),
            ),
          ),
        ],
      ),
    );
  }
}

extension on WebViewController {
  void loadUrl(Uri parse) {}
}
