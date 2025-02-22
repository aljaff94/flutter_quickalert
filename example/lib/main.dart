import 'package:example/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quickalert/flutter_quickalert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: CustomTheme.theme, home: const ExamplePage());
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter QuickAlert Example')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  type: QuickAlertTypes.success,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                );
              },
              child: Text('Show Success Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  showCloseButton: false,
                  type: QuickAlertTypes.success,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                );
              },
              child: Text('Show Success Dialog without close button'),
            ),

            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  type: QuickAlertTypes.error,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                );
              },
              child: Text('Show Error Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  type: QuickAlertTypes.warning,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                );
              },
              child: Text('Show Warning Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  type: QuickAlertTypes.info,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                );
              },
              child: Text('Show Info Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  type: QuickAlertTypes.info,
                  dialogType: QuickAlertDialogTypes.loading,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                  onCanceled: (BuildContext context) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertTypes.error,
                      message: 'Loading canceled',
                    );
                  },
                );
              },
              child: Text('Show Loading Dialog'),
            ),

            ElevatedButton(
              onPressed: () {
                QuickAlert.show(
                  context: context,
                  barrierDismissible: false,
                  type: QuickAlertTypes.warning,
                  dialogType: QuickAlertDialogTypes.confirm,
                  message: 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                );
              },
              child: Text('Show Confirm Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
