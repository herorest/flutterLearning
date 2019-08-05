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
      body: Padding(
        padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Form(
          key: _formkey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              Container(
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '手机号/邮箱',
                    icon: Icon(Icons.person),
                    border: InputBorder.none
                  ),
                  controller: _unameController,
                  validator: (v){
                    return v.trim().length > 0 ? null : '用户名不能为空';
                  }
                ),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
                )
              ),
              TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: '密码',
                        hintText: '登录密码',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
              RaisedButton(
                child: Text('登录'),
                onPressed: (){
                  print(_formkey.currentState as FormState);
                  if((_formkey.currentState as FormState).validate()){
                    print('right');
                  }
                },
              )
            ],
          ),
        )
      )
    );
  }
}
