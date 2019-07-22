import 'dart:async';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './text.dart';

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

// Future<String> loadAsset() async {
//   return await rootBundle.loadString('assets/config.json');
// }

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title:'demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new MyHomeApp(title: 'alert'),
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

const textStyle = const TextStyle(
  fontFamily: 'impact.ttf'
);

class _MyAppState extends State<MyHomeApp>{
  int _counter;

  @override
  void initState(){
    super.initState();
    _counter = 0;
    print('initState');
  }

  void _incrementCounter(){
    setState(() {
      _counter ++;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title)
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            DefaultTextStyle(
              style: TextStyle(
                color:Colors.red,
                fontSize:20
              ),
              child:Column(
                children: [
                  new Text(
                    '在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout),对齐(alignment)、填充(padding)和布局(layout),',
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height:1.2,
                      color: Colors.blue,
                      fontFamily: 'impact'
                    ),
                  ),
                ]
              )
            ),
            
            new Text(
              new WordPair.random().toString() * 4,
              style: textStyle
            ),
            new Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'home: '
                  ),
                  TextSpan(
                    text: 'https://www.baidu.com',
                    style: TextStyle(
                      color:Colors.blue
                    )
                  )
                ]
              )
            ),
            // new DecoratedBox(
            //   decoration: new BoxDecoration(
            //     image: new DecorationImage(
            //       image: new AssetImage('assets/screenshot-1.png')
            //     )
            //   ),
            // ),
            new Text(
              '$_counter'
            ),
            new RaisedButton(
              child: new Text('normal'),
              onPressed: () => {},
            ),
            new FlatButton(
              child: new Text("goto textPanel"),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () => {
                // Navigator.of(context).pushNamed('textPage', arguments: '1')
              },
            ),
            new OutlineButton(
              child: new Text('hhhello'),
              onPressed: () => {},
            ),
            new IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: () => {},
            ),
            new Column(
              children: <Widget>[
                new Image.asset('assets/chao.jpg', width:120),
                new Image.network('https://js1.epy.wpscdn.cn/security/hot03.jpg', width:150),
                Icon(Icons.ac_unit, color:Colors.green)
              ],
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