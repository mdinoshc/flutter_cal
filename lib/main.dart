import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator App",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          brightness: Brightness.dark,
        dividerColor: Colors.transparent,
      ),
      home: new HomePage(),
    );
  }
}
