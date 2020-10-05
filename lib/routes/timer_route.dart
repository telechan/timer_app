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
  int _start = Duration(seconds: 30).inMilliseconds;
  int _current;
  double _percent = 1.0;

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
      _percent = 1.0;
    });
    _timer = new Timer.periodic(Duration(milliseconds: 20), _countDown);
  }

  void _countDown(Timer timer) {
    setState(() {
      if (_current < 1) {
        timer.cancel();
      } else {
        _current -= 20;
        _percent = (_current.toDouble() / _start.toDouble());
      }
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "${Duration(milliseconds: _current).inSeconds}",
              style: TextStyle(
                fontSize: 70,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black12,
                strokeWidth: 30,
                value: _percent,
              ),
              height: 300,
              width: 300,
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
