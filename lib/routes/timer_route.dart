import 'package:flutter/material.dart';
import 'dart:async';

class TimerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("タイマー"),
      ),
      body: Center(
        child: Text("タイマーページ"),
      ),
    );
  }
}
