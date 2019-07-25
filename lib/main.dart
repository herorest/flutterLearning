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
  bool _switchSelected = true;
  bool _switchCheckboxSelected = true;
  // 使用controller保存输入框内容
  TextEditingController _unameController = new TextEditingController();
  
  @override
  void initState() {
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context){
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.teal,
        iconTheme: IconThemeData(color: Colors.teal),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),
          hintStyle: TextStyle(color: Colors.red, fontSize:14)
        ),
      ), 
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('form')
        ),
        body: new Center(
          child:Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '手机号/邮箱',
                  prefixIcon: Icon(Icons.person),
                ),
                controller: _unameController,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '登录密码',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
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
      )
    );
  }
}
