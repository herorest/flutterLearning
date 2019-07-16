import 'package:flutter/material.dart';
import './text.dart';
import 'package:english_words/english_words.dart';

void main () => runApp(new MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:'demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new MyHomeApp(),
      routes: {
        'textPage': (context) => new TextPage()
      }
    );
  }
}

class MyHomeApp extends StatefulWidget{
  MyHomeApp({Key key, this.title}): super(key: key);
  final String title;
  
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyHomeApp>{
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('title')
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              '在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis
            ),
            new Text(
              new WordPair.random().toString()
            ),
            new Text(
              '$_counter'
            ),
            new FlatButton(
              child: new Text("goto textPanel"),
              onPressed: () => {
                Navigator.of(context).pushNamed('textPage', arguments: '1')
              },
            )
          ],
        )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add)
      )
    );
  }
}