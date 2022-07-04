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


  AddOne()
  {
    setState(() {
      total++;     // 부모 state를 자식이 수정하려면 1.부모안에 수정함수부터 만들고 수정 함수를 전송함
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

                return DialogUI(AddOne : AddOne);  // 함수도 이렇게 전송함  변수명 or 함수명만 전송
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
  DialogUI({Key? key, this.AddOne}) : super(key: key);
  final AddOne;
  var inputData = TextEditingController(); // 유저가 입력한걸 저장 하고 싶으면 이 TextEditingController() 위젯을 넣어주여야함
  var inputData2 = '';
  var inputData3 = {};  // 이런 Map 혹은 list [] 이용하면 TextField 얼마나 많던 각각 저장 할수 있음
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
                // 1번째 사용자 입력 input 받는 방법
                // 유저가 입력한 데이터를 변수에 담아야 저장이 가능함 controller
                controller: inputData, // 유저가 입력한 값을 이 변수에 담게됨
                // inputData.text 나중에 이렇게 하면 유져가 입력한 값 확인 가능함

                // 2번째 방법 (좀더 직관적)
                onChanged: (text){ // 사용자가 입력한 값 여기에 저장됨
                  //print(text);
                  inputData2 = text;
                },// onPressd랑 비슷 이건 버튼 누르면 함수 실행해주세요이지만
                //onChanged는 입력 데이터가 들어오면 함수 실행임
                // 이방법은 TextField가 많을때 유용함
              ),
              TextField(onChanged: (text2){ // 사용자가 입력한 값 여기에 저장됨
                inputData2 = text2;
              },),

              TextButton(child: Text("완료"),onPressed: () {
                AddOne();
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
