import 'package:flutter/material.dart';
//import './style.dart';  // main.dart랑 같은 경로에 있어서 그냥 이렇게 해주면됨
import './style.dart' as style; // import 할때 변수 중복문제 해결 maindart에도 theme 변수 있을수 있으니



void main() {
  runApp(
      MaterialApp(    // 스타일이 길어지면 외부 파일로 만들어서 가져올수 있음
                      // 즉 긴코드를 다른 파일로 빼는법
        // theme, 다른 파일 불러와서 다른 파일 변수 사용 가능함
        theme: style.theme, // 이렇게 사용 가능함
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
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: (){},
            iconSize: 30,
          )
        ],
      ),
      body: Text('안녕', style: Theme.of(context).textTheme.bodyText2,),
      /*
      Theme.of()는 족보를 하나 입력할 수 있는데
      그 족보에서 가장 가까운 ThemeData()를 찾아서 가져와주는 함수입니다.
      그럼 위 예제처럼 그 안에서 bodyText2에 정의한 스타일을 꺼내올 수도 있는 것임
      원하는 스타일을 딱 집어서 꺼내고 싶은 경우 쓰는 함수입니다.

      현제 내부모  MaterialApp(
        theme: style.theme,   여기를 찾음   그러면 글자 빨간색 됨
       */
    );
  }
}
