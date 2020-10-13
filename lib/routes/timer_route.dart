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
  static int _setSecond = 30;
  static Duration _msec = Duration(milliseconds: 20);
  static int _start;
  static int _current;
  static double _percent;

  @override
  void initState() {
    _start = Duration(seconds: _setSecond).inMilliseconds;
    _current = _start;
    _percent = 1.0;
    super.initState();
  }

  void startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    setState(() {
      _current = _start;
      _percent = 1.0;
    });
    _timer = new Timer.periodic(_msec, _countDown);
  }

  void restartTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(_msec, _countDown);
    }
  }

  void _countDown(Timer timer) {
    setState(() {
      if (_current < 1) {
        timer.cancel();
      } else {
        _current -= _msec.inMilliseconds;
        _percent = (_current.toDouble() / _start.toDouble());
      }
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    print("despose");
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () async {
              if (_timer != null) {
                _timer.cancel();
                _timer = null;
              }
              _setSecond = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SetTimeRoute(setTime: _setSecond),
                        fullscreenDialog: true),
                  ) ??
                  _setSecond;
              setState(() {
                _start = _start = Duration(seconds: _setSecond).inMilliseconds;
                _current = _start;
                _percent = 1.0;
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              "${Duration(milliseconds: _current).inSeconds}",
              style: TextStyle(
                fontSize: 100,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black12,
                strokeWidth: 55,
                value: _percent,
              ),
              height: 300,
              width: 300,
            ),
          ),
          Container(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onDoubleTap: restartTimer,
              onTap: startTimer,
            ),
          ),
        ],
      ),
    );
  }
}
