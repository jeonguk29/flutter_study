import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Charactor card',
      home: MyCard(),
    );
  }
} 

class MyCard extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("BBANTO"),
        centerTitle: true,  // 불리언 값을 가짐 centerTitle 참이면 중앙으로 옴 
        backgroundColor: Colors.red,
        elevation: 0.0,  // 앱바가 떠있어 보이는 걸 소수점 단위로 조절 해줌 
      ),
       //Padding(  // 패딩 특정 지점으로부터 위젯이 떨어져야 할때 사용
      //padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
      //child: 
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // 위젯을 앱 스크린 내 개념에서 정렬 
        children: <Widget>[   // 패딩위젯에 자식 위젯이라 위에 적용한 패딩값으로 위젯을 세로로 배치 할것임 
        Text('hello'),
        Text('hello'),
        Text('hello'),  // 정리 세로축으로 정 중앙 정렬 하려면 mainAxisAlignment 필요 
                        // 컬럼 위젯을 가로축 상으로 정 중앙 시키려면 센터 위젯을 이용 
          ],
        ),  
      ), 
    );
  }
}