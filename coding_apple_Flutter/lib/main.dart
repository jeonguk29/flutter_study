import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';  //  외부 패키지 가져옴

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

  getPermission() async {       // 패키지 만든 사람이 정한 사용 법임
    var status = await Permission.contacts.status; // 연락처 권한 줬는지 여부
    // dart특징 오래걸리는 줄은 제껴두고 다음줄 실행하려고 함
    // await 하지만 기다렸다 다음줄 실행하라고 하는 문법임 아래 값도 없이 if 실행되면 안되니까
    // await  막쓰는게 아니라 쓸수있는 코드들이 따로 있음
    if (status.isGranted) {
      print('허락됨');   // 허락하면 이거 실행됨
    } else if (status.isDenied) {
      print('거절됨');                           // 허락 안하면 이거 실행됨
      Permission.contacts.request();  // 허락해달라고 팝업띄우는 코드
      // openAppSettings(); 위에 팝업 2번 취소하면 다신 뜨지 않음 앱 정책임
      // 그래서 주석한것처럼 직접 설정가서 켜달라고 하는게 좋음
    }
  }


  void initState(){  // 유용한 함수인데 이 위젯 즉 Myapp 위젯이 처음 로드될때
    super.initState();  // 이안에 코드를 한번 실행함
    getPermission(); // 우리가 방금 허락 요청하는 함수도 여기에 넣으면 로드될때 실행될거임
    // 요즘은 이렇게 코드 안짬 사람들이 뜨자마자 저런거 허락해달라고 하면 혐오감 생겨서 필요할때만 뜨게 해야함
  }


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
        itemCount: name2.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset('assets/koko1.png'),  // 앱에서는  이렇게 assets/ 까지 전체 경로 입력 필요함
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
                onChanged: (text){ // 사용자가 입력한 값 여기에 저장됨
                  inputData2 = text;
                },// onPressd랑 비슷 이건 버튼 누르면 함수 실행해주세요이지만
              ),

              TextButton(child: Text("완료"),onPressed: () {
                AddName(inputData2);
                AddNum();
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