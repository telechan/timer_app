import 'package:flutter/material.dart';
import 'routes/timer_route.dart';
import 'routes/score_route.dart';

class Footer extends StatefulWidget {
  Footer({Key key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _index = 0;
  final _bottomNavigationBarItems = <BottomNavigationBarItem>[];

  static const _footerIcons = [
    Icons.access_time,
    Icons.assignment,
  ];

  static const _footerNames = [
    'タイマー',
    'スコアカウンター',
  ];

  var _routes = [
    TimerRoute(),
    ScoreRoute(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _footerNames.length; i++) {
      _bottomNavigationBarItems.add(_setFooterIcons(i));
    }
  }

  BottomNavigationBarItem _setFooterIcons(int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        _footerIcons[index],
        // color: Colors.black26,
      ),
      title: Text(
        _footerNames[index],
        // style: TextStyle(
        //   color: Colors.black26,
        // ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        currentIndex: _index,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
