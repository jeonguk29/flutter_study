import 'package:flutter/material.dart';

void main() {
  runApp( MyApp()); // 앱 메인 페이지 입력하면 됩니다.
}



class MyApp extends StatefulWidget {               // 현제  StatefulWidget 로 바꿈
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}                                                       //여기 까지 개무시

class _MyAppState extends State<MyApp> {
  var a =1;                                           //변수가 자동으로 state임 StatefulWidget 에서는
  var name = "연락처앱";
  var name2 = ["김영숙", "홍길동", "피자집"];  //이래야 김영숙 2로 바뀔때 바로바로 보여질거임
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          floatingActionButton:FloatingActionButton(
            child:Text(a.toString()),
            onPressed: (){
                setState((){    // state 변경하려면 여기서
                  a++;   // state는 변경시 재 랜더링이 됨 즉 다시 그려줌 기존거 지우고
                });
            },
          ),


        appBar: AppBar(
          title: Text(name), // state 사용 사실상 이렇게 쓸필요 없음 자주 변하는게 아니라
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
              itemCount: 3,  // 3번 반복
              itemBuilder: (context,i){ // i 반복시 1씩 증가
                return ListTile(
                    leading: Image.asset('koko1.png'),
                title: Text(name2[i]),  //    i 가 반복시 증가하니까 이렇게 하면 리스트 순서대로 이름이 출력됨
                  //ListTile 처음 생성시 i는 o 그다음 생성시 1 그다음 생성시 2 이렇게 됨
                );
              }),
          ),
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

