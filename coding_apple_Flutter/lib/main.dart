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
      /*
      var newPerson = Contact(); // class 인스턴스 뽑을때 new 생략 가능
      newPerson.givenName ="민수";
      newPerson.familyName ="김";
      ContactsService.addContact(newPerson); // 실제로 폰에 연락처 강제 추가됨
      // 색상 노란거 보니 await 지원 함
      */

      setState((){  // 넣는것도 State 값변경이니까 setState 사용
        name2 = contacts; // 전화번호 반환 리스트 담기 Contact 형객체들을 넣어줌
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
      //ContactsService.addContact(New_name);
      // 위에걸로 하면 앱 자체적인 전화번호부에 강제 추가 되는 거라 버튼 누르면 이름 보이고
      name2.add(New_name); // 이건 리스트에 추가 하는거라 반복분돌려서 자동으로 보임 단 이렇게 했을때는 재랜더링시 값이 사라지지만
      // 직접적으로 주석처리한 코드로 하면 폰에 자체적으로 저장됨
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
  var newPerson2 = Contact(); // class 인스턴스 뽑을때 new 생략 가능 
// Contact() 인스턴스여야 전화번호 리스트에 들어가니까 하나 생성후
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
                newPerson2.givenName = inputData2;  // 생성한 Contact 객체에 입력한 이름을 넣고
                AddName(newPerson2); // 객체 자체를 함수로 전송 하면됨
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