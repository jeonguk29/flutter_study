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

  var total =3;


  AddName(New_name)  // 다양한 자료형 입력가능
  {
    setState(() {
      name2.add(New_name); // 자동 스테이트 추가됨 그러면 자동 UI 반영됨 왜냐 스테이스 수정되면 자동 재 랜더링 하기때문
    });
  }

  AddNum()  // 다양한 자료형 입력가능
  {
    setState(() {
    total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(total.toString()),
        onPressed: () {
          showDialog(
              barrierDismissible: false, //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
              context: context,
              builder: (context) {

                return DialogUI(AddName : AddName, AddNum : AddNum);  // 함수도 이렇게 전송함  변수명 or 함수명만 전송
              });
        },
      ),
      appBar: AppBar(
        title: Text(total.toString()),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ],
      ),
      bottomNavigationBar: Botoom_Main(),
      body: ListView.builder(
        itemCount: name2.length,   // 이거때문에 오류 났음 구현은 했는데 값출력인 안된 이유 3만 반복하라고 해서
        // 이걸 동적으로 바꾸면 됨  name2.length   길이만큼
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
  DialogUI({Key? key, this.AddName, this.AddNum}) : super(key: key);
  final AddName;
  final AddNum;
  var inputData = TextEditingController();
  var inputData2 = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: SizedBox(
          height: 300, width: 300,
          //padding: EdgeInsets.all(10),

          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              TextField(
                controller: inputData,
              ),
  
              TextButton(child: Text("완료"),onPressed: () {
                AddName(inputData.text);//.text 를 해서 넘겨 줘야함
                AddNum();
                Navigator.pop(context);
              }, ),
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
