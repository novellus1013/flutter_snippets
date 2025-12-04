import 'package:flutter/material.dart';
import 'package:flutter_snippets/constants/app_theme.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  bool _isCustom = false;

  void _isCustomState(bool isCustom) {
    setState(() {
      _isCustom = isCustom;
    });
    print(_isCustom);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isCustom ? AppTheme.light : ThemeData.light(),
      home: TestAppChild(onCustom: _isCustomState, isCustom: _isCustom),
    );
  }
}

class TestAppChild extends StatelessWidget {
  final ValueChanged<bool> onCustom;
  final bool isCustom;

  const TestAppChild({
    super.key,
    required this.onCustom,
    required this.isCustom,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Snippets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('TextLarge', style: AppTheme.light.textTheme.titleLarge),
            Text('TextLarge', style: AppTheme.light.textTheme.titleMedium),
            Text('TextLarge', style: AppTheme.light.textTheme.titleSmall),
            Text('TextLarge', style: AppTheme.light.textTheme.displayLarge),
            Text('TextLarge', style: AppTheme.light.textTheme.displaySmall),
            Text('TextLarge', style: AppTheme.light.textTheme.displaySmall),

            ElevatedButton(
              onPressed: () => onCustom(!isCustom),
              child: Text('Change Custom Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
