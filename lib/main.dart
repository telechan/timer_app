import 'package:flutter/material.dart';
import 'package:timer_app/footer.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ボードゲームツールボックス",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Footer(),
    );
  }
}
