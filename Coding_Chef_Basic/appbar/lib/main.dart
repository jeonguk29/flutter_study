import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Mypage(),
    );
  }
}

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(  // leading 속성 간단한 위젯이나 아이콘버튼을  왼쪽에에 배치할때 사용
          icon: Icon(Icons.menu),
          onPressed: () {
            print('menu button is clicked');
          },
        ),
        // actions 속성은 복수의 아이콘 버튼등을 오른쪽에 배치할때 사용함
        actions: <Widget>[  // [] 이곳에 한개 이상이 위젯을 가진다는 이야기임 앱바의 경우 주로 아이콘 버튼 위젯이 올거임 우리는 쇼핑카트, 검색 아이콘 넣을거임
          IconButton(
          icon: Icon(Icons.shopping_cart),   // onPressed 속성은 함수의 형태로 일반 버튼이나 아이콘 버튼을 터치 했을때 일어나는 이벤트를 정의 한 곳임
          onPressed: () {
            print('shopping cart button is clicked');
          },
        ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('search button is clicked');
            },
          ),
        ],
      ),
    );
  }
}


