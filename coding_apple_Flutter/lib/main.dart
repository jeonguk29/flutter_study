import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}



class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = "연락처앱";
  var name2 = ["김영숙", "홍길동", "피자집"];
  var like = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(          // 레이아웃 이전 커밋처럼 MaterialApp 올리거나 그런게 싫으면 FloatingActionButton
        // 누르고 빌더라는 위젯으로 감싸주면 됨 Builder 위젯은 중간에서 족보 context를 만들어줌
        floatingActionButton: Builder(
          builder: (context) {  // 그리면 여기 context 위에 MaterialApp, Scaffold 부모 위젯이 들어가서 오류 안남
            // 아래 showDialog 함수는 MaterialApp 이 들어가있는 context가 필요하니까
            // 하지만 이전 커밋에 있는 첫번째 방법 MaterialApp을 위로 빼는것을 권장 뭐 하다가 오류나면 중간 빌더 위젯
            // 사용해서 중간 족보 context 만들면 오류 해결 가능 할것임 
            return FloatingActionButton(
              child: Text(a.toString()),
              onPressed: () {
                    showDialog(context: context, builder: (context){
                      return Dialog(child: Text('안녕'));
                  });
                },
            );
          }
        ),


        appBar: AppBar(
          title: Text(name),
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
          itemCount: 3,
          itemBuilder: (context, i) {
            return ListTile(
              leading: Image.asset('koko1.png'),
              title: Text(name2[i]),
            );
          },
        ),
      ),
    );
  }
}




class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  // 여기 context는 무슨 정보 Scaffold  + 그리고 Scaffold의 부모인 마테리얼 앱 같은게 있을것임
    return Container();
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

