import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 앱 메인 페이지 입력하면 됩니다.
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
        appBar: AppBar(
          title: Text("앱제목"),
        ),
          body: Text("안녕"),
          bottomNavigationBar:
          BottomAppBar(
            child: Container(
              height : 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
              ),
            ),
          ),
/*
    Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,    // row 일때 가로 정렬 Column 일때는 세로 정렬임
    //crossAxisAlignment: CrossAxisAlignment.center,   세로축 정렬

    children: const [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
    ],
    */
        ),

        );
  }
}
