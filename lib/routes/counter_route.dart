import 'package:flutter/material.dart';
import 'dart:async';

class CounterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カウンター"),
      ),
      body: Center(
        child: Text("カウンターページ"),
      ),
    );
  }
}

