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

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('form')
      ),
      body: 
        Container(
          child: Column(
            children: <Widget>[
              Text('detail'),
              Container(
                color:Colors.grey,
                child:ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 200,
                    minHeight: 200
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child:Text('helloworld')
                        ),
                        color: Colors.red,
                      ),
                      Positioned(
                        left:18,
                        top:20,
                        child: Text('i am jack')
                      )
                    ],
                  )
                )
              )
            ],
          ),
        )
    );
  }
}
