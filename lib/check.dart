import 'package:flutter/material.dart';
import 'dart:async';

void collectLog(String line){
  // 收集日志
}

void reportErrorAndLog(FlutterErrorDetails details){
  // 上报错误和日志逻辑
} 

FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
  // 构建错误信息
}

void main () {
  // 自定义上报错误 
  FlutterError.onError = (FlutterErrorDetails details){
    reportErrorAndLog(details);
  };

  runZoned(
    () => runApp(new MyApp()),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line){
        collectLog(line);
      }
    ),
    onError: (Object obj, StackTrace stack){
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    }

  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:'demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new SwitchAndCheckBoxTestRoute()
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget{
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute>{
  bool _switchSelected = true;
  bool _switchCheckboxSelected = true;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Center(
        child: Column(
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState((){
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _switchCheckboxSelected,
              onChanged: (value) {
                setState((){
                  _switchCheckboxSelected = value;
                });
              },
            )
          ],
        )
      )
    );
  }
}
