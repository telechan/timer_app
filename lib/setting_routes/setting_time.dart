// import 'dart:html';

import 'package:flutter/material.dart';

class SetTimeRoute extends StatefulWidget {
  SetTimeRoute({Key key, this.setTime}) : super(key: key);
  int setTime;
  @override
  _SetTimeRouteState createState() => _SetTimeRouteState();
}

class _SetTimeRouteState extends State<SetTimeRoute> {
  var _timeController = TextEditingController();
  int _sendTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タイマー設定'),
      ),
      body: Container(
        margin: EdgeInsets.all(80),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "例) 10",
                  border: OutlineInputBorder(),
                  labelText: "秒数を入力",
                ),
                controller: _timeController,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.blue[400],
                      child: Text(
                        "戻る",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, widget.setTime);
                      },
                    ),
                    height: 50,
                    width: 110,
                  ),
                  SizedBox(
                    child: RaisedButton(
                      color: Colors.blue[400],
                      child: Text(
                        "セット",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        _sendTime = int.parse(_timeController.text);
                        if (_sendTime == 0) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                title: Text("０は設定できません！"),
                                content: Text("１以上を設定してください"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("OK"),
                                  )
                                ],
                              );
                            },
                          );
                        } else {
                          Navigator.pop(
                            context,
                            int.parse(_timeController.text),
                          );
                        }
                      },
                    ),
                    height: 50,
                    width: 110,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
