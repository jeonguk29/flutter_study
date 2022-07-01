import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 앱 메인 페이지 입력하면 됩니다.
}

var a = SizedBox(
  child: Text('안녕'),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
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
          body: // ShopItem(),  커스텀 위젯 사용법
          ListView(
            children: [
              SizedBox(
                height: 30,
                width: 50,
                child:Row(
                  children: [
                    Icon(Icons.person),
                    Text("홍길동"),
                  ],
                ) ,
              ),
              SizedBox(
                height: 30,
                width: 50,
                child:Row(
                  children: [
                    Icon(Icons.person),
                    Text("홍길동"),
                  ],
                ) ,
              ),
              SizedBox(
                height: 30,
                width: 50,
                child:Row(
                  children: [
                    Icon(Icons.person),
                    Text("홍길동"),
                  ],
                ) ,
              ),

            ],
          ),
          bottomNavigationBar: Botoom_Main()
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

