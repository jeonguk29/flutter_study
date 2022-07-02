import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(        // 보통 앱만들때 이렇게 마테리얼 앱을 밖으로 빼줌
      home: MyApp()              // 이렇게 해도 레이아웃 똑같음 마테리얼 안에 MyApp 즉 Scaffold가 들어가는 것임
  )
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
  Widget build(BuildContext context) {  // 여기 context 아래에도 계속 스는 context 임
    // context는 부모 위젯의 정보를 담고 있는 변수임 커스텀 위젯을 생성 할때마다 만들어 줘야함
    // 쉽게 생각하면 족보라고 생각하기 부모들 정보가 담긴 단 형제는 x 상위 부모들만
    return  Scaffold(
      //floatingActionButton: Test(),  context 연습퀴즈 : Test 클레스 내려가서 답확인
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: () {
                //print(context.findAncestorWidgetOfExactType<MaterialApp>());
                // 부모중에 MaterialApp이 있는지 찾아주세요라는 간단한 함수  찾으면 콘솔에 나옴
                showDialog(context: context, builder: (context){ //현제 스케폴드 위에 부모는 마테리얼 앱 + 부모들을 말함
                  //showDialog 함수는 context에 MaterialApp이 들어 있어야 잘 동작하는 함수임 아무 context는 X
                  /*

                  MaterialApp(
                  home: Scaffold(    이런식으로 코드를 짜면 아까 오류가 나는게   MaterialApp에 context를 불러 오는데
                  MaterialApp에 context 즉 부모가 없어서 오류가 나는 것임 그래서   Scaffold로 만들고 위로  MaterialApp
                  를 보낸것임

                   */


                  return Dialog(child: Text('안녕'));   // MaterialApp 을 밖으로 빼줘야  Dialog 작동 됨
              });
            },
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

