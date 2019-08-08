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
        Wrap(
          spacing: 8,
          runSpacing: 4,
          alignment: WrapAlignment.start,
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.green, child: Text('A')),
              label: new Text('Apple')
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.green, child: Text('B')),
              label: new Text('Apple')
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.green, child: Text('C')),
              label: new Text('Apple')
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.green, child: Text('D')),
              label: new Text('Apple')
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.green, child: Text('E')),
              label: new Text('Apple')
            ),
          ],
        )
    );
  }
}
