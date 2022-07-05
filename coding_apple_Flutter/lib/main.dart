import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';  //  외부 패키지 가져옴
import 'package:contacts_service/contacts_service.dart';

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
    if (status.isGranted) {
      print('허락됨');   // 허락하면 이거 실행됨
     var contacts = await ContactsService.getContacts(); // 이렇게 하면 연락처 다나옴   외울필요 x 그냥 패키지 사용법임
      // 연락처 다나오는 함수를 사용해 변수에 넣어줌  그리고 이것도 오래 걸리는 코드라 await 사용하는걸 권장함
      //print(contacts);
      // 확인해보니 애뮬레이터에서 실제로 연락처 2개 저장하니까 [Instance of 'Contact', Instance of 'Contact'] 이런식으로 리스트로 출력됨
      //print(contacts[0].displayName); // 실제 이름이나옴 . 찍으면 값 접근 가능함

      // 폰에 연락처 강제로 추가하는 법
      /*
      var newPerson = Contact(); // class 인스턴스 뽑을때 new 생략 가능
      newPerson.givenName ="민수";
      newPerson.familyName ="김";
      ContactsService.addContact(newPerson); // 실제로 폰에 연락처 강제 추가됨
      // 색상 노란거 보니 await 지원 함
      */

      // dart는 타입을 잘 지켜야함 아래에 total 변수는 숫자만 넣을수 있도록 했는데 중간에 문자 못 넣음 오류남
      // 우리는 이제 리스트에 실제 연락처를 넣을 거임
      setState((){
        name2 = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }


  var a = 1;
  var name = "연락처앱";
  var name2 = []; // 빈걸로 넣으면 마우스 올리면 dynamic 타입이라고 알려줌 이건 리스트안에 모든 타입 아무거나 나 올수 있다는 것임
  // List<Contact> name2 =[]; 혹은 이렇게 지정해서 사용할수도 있음 무조건 저 타임만 넣을수 있다는 것임 : 제너릭
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
      appBar: AppBar(
        title: Text(total.toString()),
        actions: [  // 안에 아이콘 넣을수 있는데
         IconButton(onPressed: (){ getPermission(); }, icon: Icon(Icons.contacts)) // 이렇게 앱바에 아이콘 버튼 만들어서 연락처 권한 허락 띄울거임
        ],
      ),
      bottomNavigationBar: Botoom_Main(),
      body: ListView.builder(
        itemCount: name2.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset('assets/koko1.png', width: 100,),  // 앱에서는  이렇게 assets/ 까지 전체 경로 입력 필요함
            title: Text(name2[i].givenName),
          );
        },
      ),

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