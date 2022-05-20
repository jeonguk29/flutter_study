import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      ],
      ),
      
  
      ),
    );
  }
}