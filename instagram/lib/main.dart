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


/*
      tab으로 페이지 나누는법 동적인 UI만드는법
      1.state에 tab의 현재상태 저장
      2.state에 따라 tab이 어떻게 보일지 작성
        -> 3 유저가 쉽게 state 조작할수있게 ex 버튼을 만든다던지

        꼭 tab이 아니어도 동적인 ui 만들고 싶으면 이단계 거치면 모든 만들수 있음

       */

class MyApp extends StatefulWidget {  //state 만들려면 StatefulWidget 이여야함
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0; // 버튼누르는거에 따라 보여지는화면 2가지니까 0,1 로 표현할거임
  // 현재 0 이면 첫번째 화면
  // 1.state에 tab의 현재상태 저장


  @override
  Widget build(BuildContext context) {


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
      //2.state에 따라 tab이 어떻게 보일지 작성   if문으로 써도 되지만  [] 이런 리스트 써도 쉬울수 있음
      body: [Text('홈페이지'), Text('샵페이지')][tab], // 리스트안에 위젯널고 [0] 이런식으로 값 뽑음
      // 이렇게 짜면 tab 즉 state에 따라 보여지는 화면이 달라짐

      bottomNavigationBar: BottomNavigationBar(
      showSelectedLabels: false,  // 아래 글자 나오는걸 안보이게함
        showUnselectedLabels: false,
        onTap: (i){ // 매개변수 하나 넣게 되어 있음 버튼 하나 누르면 0이되고 그 다음꺼 누르면 자동적으로 1이 됨
         setState((){
           tab = i;
         });
        }, // onpressed랑 똑같은 기능임 이안에 누르면 실행
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵'),
        ],
      ),



      );


  }
}
