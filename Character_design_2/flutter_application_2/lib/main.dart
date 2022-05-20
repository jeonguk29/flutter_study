import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 디버그 빨간띠 없애기 불리한 값을 가짐 
      title: 'BBANTO',
      home: Grade(),
    );   
  }
}

class Grade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: const Text('BBANTO'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/KakaoTalk_20220520_215447724_01.png'),
              radius: 60.0,
            ),
          ),// tip컨트롤 스페이스 누르면 그 위젯이 가지는 속성 들이 나옴 
      Divider(  // 선을 넣어서 위 아래 를 구분해주는 위젯 그냥 선 위젯임  
        height: 60.0,
        color: Colors.grey[850],
        thickness: 0.5,  // 선두께 속성 
        endIndent: 30.0,  // Divider 선이 끝에서 부터 얼마나 떨어져야 하는지 지정해주는 속성 
      ),
      Text('NAME', 
      style: TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
      ),
      ),
      SizedBox(   // 눈에 보이지 않지만 두 택스트 사이에서 가로 세로 간격 마음대로 조절 가능 
        height: 10.0,
      ),
      Text('BBANTO',
      style: TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
        fontSize: 28.0,
        fontWeight: FontWeight.bold // 글자 굵기 
      ),
      ),
      SizedBox(   // 눈에 보이지 않지만 두 택스트 사이에서 가로 세로 간격 마음대로 조절 가능 
        height: 30.0,
      ),

      Text('BBANTO POWER LEVEL', 
      style: TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
      ),
      ),
      SizedBox(   // 눈에 보이지 않지만 두 택스트 사이에서 가로 세로 간격 마음대로 조절 가능 
        height: 10.0,
      ),
      Text('14',
      style: TextStyle(
        color: Colors.white,
        letterSpacing: 2.0,
        fontSize: 28.0,
        fontWeight: FontWeight.bold // 글자 굵기 
      ),
      ),

      SizedBox(
        height: 30.0,
      ),

      Row(  
        children: [
          Icon(Icons.check_circle_outlined),
          SizedBox(
        width: 10.0,
        ),
          Text('using lightsaber',
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0
          ),
          ),
        ],
      ),
      Row(  
        children: [
          Icon(Icons.check_circle_outlined),
          SizedBox(
        width: 10.0,
        ),
          Text('face hero tattoo',
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0
          ),
          ),
        ],
      ),
      Row(  
        children: [
          Icon(Icons.check_circle_outlined),
          SizedBox(
        width: 10.0,
        ),
          Text('fire flames',
          style: TextStyle(
            fontSize: 16.0,
            letterSpacing: 1.0
          ),
          ),
        ],
      ),
      Center(
        child: CircleAvatar(
        backgroundImage : AssetImage('assets/KakaoTalk_20220520_215447724.png'),
        radius: 40.0,
        backgroundColor: Colors.amber[800],
      ),
      )
      ],
      ),
      
  
      ),
    );
  }
}