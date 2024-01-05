import 'package:flutter/material.dart';
import 'package:vietravel/locator.dart';
import 'package:vietravel/screens/top_headlines_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSingletonLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TopHeadlinesScreen(),
    );
  }
}
