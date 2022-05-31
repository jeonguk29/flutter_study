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
      drawer: Drawer(
        // 드로월 매뉴는 위젯을 가짐
        child: ListView(  // ListView 여러줄의 위젯을 보여줌
            padding: EdgeInsets.zero,
            children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/koko2.png'),
                backgroundColor: Colors.white,
                //required this.accountName,  UserAccountsDrawerHeader을 컨트롤 눌러서 확인해보니 required  키워드가 있음 반드시 이 두개를 사용 해야함
                //required this.accountEmail,
                // https://zionh.tistory.com/55 추가적으로 야물 파일 건들때 들여쓰기 주의하자
              ), // CircleAvatar 현재 사용자의 이미지를 가져오는 역할을 함
              accountName: Text('woogie'),
              accountEmail: Text('jejejej@naver.com'),
              onDetailsPressed:(){
                print('arrow is clicked');
              },  // 펼처질때 기능을 수행할 함수이름을 넣어줘야함
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
            ),
          )
      ],
      ),
      ),
    );
  }
}

