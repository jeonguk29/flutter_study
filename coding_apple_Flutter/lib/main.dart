import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      // 보통 앱만들때 이렇게 마테리얼 앱을 밖으로 빼줌
      home: MyApp() // 이렇게 해도 레이아웃 똑같음 마테리얼 안에 MyApp 즉 Scaffold가 들어가는 것임
      ));
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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(a.toString()),
        onPressed: () {
          showDialog(
              barrierDismissible: false, //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
              context: context,
              builder: (context) {

                return DialogUI(state : a);  // 부모 변수 쓰려면 자식 위젯(작명:보낼state)해줘야함     , 기준으로 여러개 가능
                // 스테이트라는 이름으로 부모 a를 보냄 크게  1.보내고, 2등록하고, 3사용
                // 참고로 부모가 자식에게 보내는건 가능 하지만 자식이 부모에게 같은 자식이 자식에게 보내는건 불허
                // 교훈 : 많은곳에서 쓰는 state는 최대한 부모 위젯에 만들자.
              });
        },
      ),
      appBar: AppBar(
        title: Text(name),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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

class DialogUI extends StatelessWidget {
  const DialogUI({Key? key, this.state}) : super(key: key);
  final state;    //  위에 this.state 로 등록 아래 등록 지정한 이름으로 등록하면됨 그리고 const 지우거나 var 대신 final 쓰면 되는데
  //// final은 나중에 변수 수정 불가능함  관습적으로 final 사용 부모가 보낸걸 잘 변경 안함
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          height: 300, width: 300,
          //padding: EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [             // 부모 -> 자식 state 전송해줘야 부모의 변수 사용 가능함
              TextField(),
              // 3. 사용
              TextButton(child: Text(state.toString()),onPressed: () {}, ),  // 이렇게 부모에 a변수를 접고 하고 싶은데 원래 다른 class에 있는 변수는 마음대로 못씀
              TextButton(child: Text('취소'),
                onPressed: (){ Navigator.pop(context);})
            ],
          ),
        )
    );
  }
}



class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 여기 context는 무슨 정보 Scaffold  + 그리고 Scaffold의 부모인 마테리얼 앱 같은게 있을것임
    return Container();
  }
}

class Botoom_Main extends StatelessWidget {
  const Botoom_Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //색상
      child: Container(
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
