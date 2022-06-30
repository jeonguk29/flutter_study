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
          body: Container(
            height: 150,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset("koko1.png", width: 150,),
                Flexible(flex: 10,child:
                Container(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("카메라 팝니다."),
                      Text("금호동 3가"),
                      Text("7000원"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite),
                          Text("4"),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),


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
