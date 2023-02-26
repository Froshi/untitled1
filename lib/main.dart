import 'package:flutter/material.dart';
import 'package:untitled1/screens/screen_one..dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little App',
      debugShowCheckedModeBanner: false,
      home: ScreenOne(),
    );
  }

}
