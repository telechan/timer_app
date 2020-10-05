import 'package:flutter/material.dart';
import 'dart:async';
import '../setting_routes/setting_time.dart';

class TimerRoute extends StatefulWidget {
  TimerRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimerRouteState createState() => _TimerRouteState();
}

class _TimerRouteState extends State<TimerRoute> {
  Timer _timer;
  int _start = 10;
  int _current;

  @override
  void initState() {
    _current = _start;
    super.initState();
  }

  void restartTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _current = _start;
    });
    _timer = new Timer.periodic(Duration(seconds: 1), _countDown);
  }

  void _countDown(Timer timer) {
    setState(() {
      if (_current < 1) {
        timer.cancel();
      } else {
        _current -= 1;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "$_current",
              style: TextStyle(
                fontSize: 70,
              ),
            ),
          ),
          Container(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: restartTimer,
            ),
          ),
        ],
      ),
    );
  }
}
