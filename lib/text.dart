import 'package:flutter/material.dart';

class TextPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    var args = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      title: 'first',
      theme: new ThemeData(
        primaryColor: Colors.red
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(args)
        ),
        body: Center(
          child: Text(
            '在Flutter中，大多数东西都是widget，包括对齐(alignment)、填充(padding)和布局(layout)',
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 255, 150, 150),
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid
            ),
          )
        )
      )
    );
  }
}