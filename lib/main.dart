


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
                      
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: FlatButton(
                          child: Text('normal'),
                          onPressed: (){},
                        ),
                        
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
