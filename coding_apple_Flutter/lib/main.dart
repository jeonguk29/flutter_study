import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 앱 메인 페이지 입력하면 됩니다.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Center(
          child:  Container(width: 50, height: 50,color: Colors.blue),
        )
    );
  }
}
