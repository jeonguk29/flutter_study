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
              ), 
              otherAccountsPictures: const <Widget>[
                // 한개이상의 다른계정 이미지를 추가 할수 있으므로 위젯리스트를 가짐
                CircleAvatar(
                  backgroundImage: AssetImage('assets/koko1.png'),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/koko1.png'),
                //   backgroundColor: Colors.white,
                // ),
              ],
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
          ),
        ListTile(
          leading: Icon(Icons.home,  // leading은  ListTile시작점에 아이콘 넣는걸 말함 
          color: Colors.grey[850],
          ),
          title: Text('Home'),
          onTap: (){
            print('Home is clicked');
          },
          trailing: Icon(Icons.add),  // trailing: 속성은 끝에 넣는걸 말함 
        ),
        ListTile(
          leading: Icon(Icons.settings,  // leading은  ListTile시작점에 아이콘 넣는걸 말함 
          color: Colors.grey[850],
          ),
          title: Text('Settings'),
          onTap: (){
            print('Settings is clicked');
          },
          trailing: Icon(Icons.add),  // trailing: 속성은 끝에 넣는걸 말함 
        ),
        ListTile(
          leading: Icon(Icons.question_answer,  // leading은  ListTile시작점에 아이콘 넣는걸 말함 
          color: Colors.grey[850],
          ),
          title: Text('Q&A'),
          onTap: (){
            print('Q&A is clicked');
          },
          trailing: Icon(Icons.add),  // trailing: 속성은 끝에 넣는걸 말함 
        ),        
      ],
      ),
      ),
    );
  }
}

