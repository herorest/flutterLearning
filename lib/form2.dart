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
  GlobalKey _formkey = new GlobalKey<FormState>();
  
  @override
  void initState() {
    _unameController.addListener((){
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        // primarySwatch: Colors.teal,
        iconTheme: IconThemeData(color: Colors.teal),
        hintColor: Colors.black,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey),    // 定义label字体样式
          hintStyle: TextStyle(color: Colors.red, fontSize:14)  //定义提示文本样式
        ),
      ), 
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('form')
        ),
        body: 
          Padding(
            padding:const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child:
              Form(
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
                          prefixIcon: Icon(Icons.person),
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
                    ),

                    RaisedButton(
                      child: Text('登录'),
                      onPressed: (){
                        print(_formkey.currentState as FormState);
                        (_formkey.currentState as FormState).validate();
                      },
                    )
                  ],
                ),
              )
            )
          )
        );
  }
}
