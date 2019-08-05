import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

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

  // 使用controller保存输入框内容
  TextEditingController _unameController = new TextEditingController();
  GlobalKey _formkey = new GlobalKey<FormState>();
  
  @override
  void initState() {
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('form')
      ),
      body: 
        Row(
          children: <Widget>[
            Container(
              width: 100,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('line1')  
                      ],
                    ),
                  ),
                  
                  Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('line2')  
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('see'),Text('..more')
              ],
            )
          ],
        )  
      

    );
  }
}
