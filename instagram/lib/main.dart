import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          //iconTheme: IconThemeData(color: Colors.grey),
          appBarTheme: AppBarTheme(
              color: Colors.white,
              actionsIconTheme: IconThemeData(color: Colors.black, size: 35.0),
              titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
          ),

          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.red)
          ),
        ),// 스타일 모아 놓는 ThemeData()   css 파일 같은 것임
        home: MyApp()
    )
  );
}


var a = TextStyle(

);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(       // MaterialApp 밖으로 빼야 나중에 편해서 빼줄거임
      home: Scaffold(),
    );
    */

    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          Icon(Icons.add_box_outlined)
        ],
      ),

    );

  }
}
