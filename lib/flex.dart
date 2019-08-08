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
        Column(
          children: <Widget>[
           SizedBox(
             width:1080,
             child:Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    color:Colors.green,
                    height:30
                  ),
                ),
                Spacer(
                  flex:1
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color:Colors.red,
                    height:30
                  ),
                )
              ],

            )
           )
            
            
          ],
        )

    );
  }
}
