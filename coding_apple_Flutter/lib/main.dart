import 'package:flutter/material.dart';

void main() {
  runApp( MyApp()); // 앱 메인 페이지 입력하면 됩니다.
}

var a = SizedBox(
  child: Text('안녕'),
);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var a =1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          floatingActionButton:FloatingActionButton(
            child:Text(a.toString()),
            onPressed: (){
              print(a);
              a++;
            },
          ),
        appBar: AppBar(
          title: Text("금호동3가"),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.search),
                Icon(Icons.reorder),
                Icon(Icons.notifications)],
            ),
          ],
        ),
          bottomNavigationBar: Botoom_Main(),
          body: ListView.builder(
              itemCount: 300,  // 3번 반복
              itemBuilder: (context,i){ // i 반복시 1씩 증가
                //print(i);  // 값 출력시 이용 이건 브라우저가 아니라 콘솔창에서 임  궁금한거 바로 찍어볼수 있음
                return ListTile(   // ListTile 위젯 쓰면 연락처 같은 거 쉽게 만들수 있음
                    leading: Image.asset('koko1.png'),
                title: Text(i.toString()),
                );
              }),
          /*
          ListView(
            children: [
             ListTile(   // ListTile 위젯 쓰면 연락처 같은 거 쉽게 만들수 있음
               leading: Image.asset('koko1.png'),
               title: Text("홍길동"),
             ),
              ListTile(
                leading: Image.asset('koko1.png'),
                title: Text("홍길동"),
              ),
              ListTile(
                leading: Image.asset('koko1.png'),
                title: Text("홍길동"),
              ),

            ],
            */
          ),
    );
  }
}

class ShopItem extends StatelessWidget {
  const ShopItem ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    child: Text('안녕'),
  );
  }
}

class Botoom_Main extends StatelessWidget {
  const Botoom_Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //색상
      child:  Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.call),
            Icon(Icons.message),
            Icon(Icons.contacts),
          ],
        ),
      ),
    );
  }
}

