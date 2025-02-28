import 'package:flutter/material.dart';
import 'package:hyperhire_task/features/home/view/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),

      child: const MaterialApp(home: HomePage()),
    );
  }
}
