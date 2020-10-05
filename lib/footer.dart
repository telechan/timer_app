import 'package:flutter/material.dart';
import 'routes/timer_route.dart';
import 'routes/counter_route.dart';
import 'routes/dice_route.dart';

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
    Icons.star,
    Icons.casino,
  ];

  static const _footerNames = [
    'タイマー',
    'カウンター',
    'サイコロ',
  ];

  var _routes = [
    TimerRoute(title: 'タイマー'),
    CounterRoute(),
    DiceRoute(),
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
      ),
      title: Text(
        _footerNames[index],
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
