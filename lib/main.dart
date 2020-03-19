import 'package:flutter/material.dart';
import './pages/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1E1F20),
      ),
      home: MainPage(),
    );
  }
}
