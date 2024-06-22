import 'package:api_in_flutter/advanced_new.dart';
// import 'package:api_in_flutter/home_page.dart';
// import 'package:api_in_flutter/new_file.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          title: Text("API in flutter"),
          centerTitle: true,
        ),
        body: AdvancedNew(),
      ),
    );
  }
}
