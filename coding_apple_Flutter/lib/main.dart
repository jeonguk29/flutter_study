import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // 앱 메인 페이지 입력하면 됩니다.
}

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
          body: Row(children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset('koko1.png'),

            ),
            Container(
              height: 200,
              width: 210,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("정정욱 개발자 네카라쿠배 취업하다 "),
                  Text("서울시 구로구", style: TextStyle(color: Color(0xffbeb4b4))),
                  Text("23"),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.favorite_border),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('4'),
                ],
              ),
            ),





          ],),


        ),
            /*
             Icon(Icons.star, color: Color(0xFFFA0000),),  아이콘 꾸미기

            글자 꾸미기
            text("안녕하세요",
              style: TextStyle(color: Color(0xFF645454),
                fontSize: 50, fontWeight: FontWeight.w700,
            ),*/
    );
  }
}
