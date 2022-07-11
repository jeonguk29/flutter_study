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
      body: Theme(
        data: ThemeData(

        ),
        child: Container(  // 레이아웃 중간에 ThemeData() 생성가능 ex 얘의 자식부터는 모든 글자색이 달라졌으면 좋겠다
          // Theme으로 감싸고 data 안에 ThemeData() 안에 스타일주면
          // child 속성 위젯 이안에 자식들은 다 이 스타일을 따라감
          // 위에 style.theme 이 아니라 원칙1 : 나랑 조금더 가까운 스타일 먼저 적용 하려고함

        ),
      ),
      //TextButton(onPressed: (){},child: Text('안녕'),),
    );

  }
}
