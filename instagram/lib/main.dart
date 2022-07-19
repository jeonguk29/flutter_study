import 'dart:ui';

import 'package:flutter/material.dart';
//import './style.dart';  // main.dart랑 같은 경로에 있어서 그냥 이렇게 해주면됨
import './style.dart' as style; // import 할때 변수 중복문제 해결 maindart에도 theme 변수 있을수 있으니
import 'package:http/http.dart' as http; // 웹 서버로 데이터 요청, 보낼때 필요한 패키지
import 'dart:convert';
import 'package:flutter/rendering.dart';// 스크롤 관련 유용한 함수들 들어있음
import 'package:image_picker/image_picker.dart'; // 이미지 권한 관련 이미지 관련 함수들 들어있음
import 'dart:io'; // 파일 다루는 유용한 함수가 들어있는 기본 패키지입니다.

void main() {
  runApp(
      MaterialApp(
          theme: style.theme,
          home: MyApp()
      )
  );
}





class MyApp extends StatefulWidget {  //state 만들려면 StatefulWidget 이여야함
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var data = [];
  var userImage;
  var userContent; // 자식에서 입력받는 거니까 미리 부모가 자식에게 수정할수 있도록 함수 구현 해줘야함

  setUserContent(a){
    setState((){
      userContent = a;
    });
  }

  addMyData(){
   var myData = {
     'id': data.length, // 게시물 개수에 따라 id 정해지게
    'image': userImage,
    'likes': 5,
    'date': 'July 25',
    'content': userContent,
    'liked': false,
    'user': 'John Kim'
   };
    setState((){
      data.insert(0, myData); //add 는 끝에 추가 되지만 insert는 몇번째 항목에 추가할지 결정 할수 있음
    });
  }


  addData(a){
    setState(() {
      data.add(a);
    });
  }
  getData()async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json')); // 결과 반환 해주면 변수에 담아 쓰면됨
    if (result.statusCode == 200) {  // 에러 체크  get 요청 성공시 200 나옴
      // GET 요청 많이 해야하는 앱이라면 Dio라는 패키지 실전에서더 많이 사용함
      var result2 = jsonDecode(result.body);
      setState((){
        data = result2; // 뭔가 많이 변경 될거 같아서 스테이트에 저장 변경하는 거니까 setState 안에
      });
    } else {
      throw Exception('실패함ㅅㄱ');
    }
  }

  @override
  void initState(){  // 앱 로드 될때 바로 GET 하고 싶음 그럼 이렇게
    super.initState();
    // 여기다 코드 짜면 MyApp 이라는 커스텀 위젯이 로드될때 실행됨
    getData();  //initState() 에는 await 사용 못해서 밖으로 따로 함수를 빼줌
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined),
            onPressed: () async{ // await  하려면 있어야함
              // 이미지 패키지 사용 방법일뿐
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              // source: ImageSource.gallery  사진 고르기
              // source: ImageSource.camera   카메라 열기
              // 비디오 고르고 싶으면 picker.pickVideo() 하면 됨
              // 여러 이미지 고르고 싶을때는 picker.pickMultiImage()  여러개 고르면 리스트 안에 다 저장되서 꺼내쓰면 됨


              // 선택한 이미지 위젯으로 보여주기
              if(image != null) {
                setState(() {
                  userImage = File(image.path);  // 경로같은거 저장해서 꺼내쓰는게 일반적임
                  // 이렇게 if 문으로 사용자가 하는건 널이아닌지 체크해야 오류 안나고 예외처리 가능함
                  // 그리고 userImage 는 state라 이렇게 해줌
                });
                }





              Navigator.push(context,// context 는 MaterialApp 들어있는 context 넣어야함 위에   Widget build(BuildContext context) 이걸 쓰는 거임
               MaterialPageRoute(builder: (context) => Upload(userImage : userImage,
                  setUserContent : setUserContent, addMyData : addMyData ))
              );// 자식에게 전송
            },
            iconSize: 30,
          )
        ],

      ),
      body: [Home(mamber:data,addData:addData), Text('샵페이지')][tab],  // 0과 1에 따라 보이는게 다름
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState((){
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
              label : '홈',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label : '샵',
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag)
          )
        ],
      ),
    );


  }
}

/*
스크롤바 높이 측정하려면 우선 listview 담은 곳이 statefulwidget 이여야함
 */

class Home extends StatefulWidget {

  // statefulwidget은 부모가 보낸state 등록은 첫 class에
  // 사용은 두번째 class에 해야함
  const Home({Key? key, this.mamber, this.addData}) : super(key: key);
  final mamber;
  final addData;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int get = 0; // get 요청 횟수

  getStatus(){
    setState(() {
      get++;
    });
  }

  getMore() async {
    if(get == 0) {
      var result = await http.get(
          Uri.parse('https://codingapple1.github.io/app/more1.json'));
      var result2 = jsonDecode(result.body);
      widget.addData(result2); // 함수도 똑같이 widget 붙여서 사용
      getStatus();
    }
    else{
      var result3 = await http.get(Uri.parse('https://codingapple1.github.io/app/more2.json'));
      var result4 = jsonDecode(result3.body);
      widget.addData(result4); // 함수도 똑같이 widget 붙여서 사용
    }


  }

  /*
    그래서 위에 있던 클레스 변수 사용을 하기 위해
    widget.mamber 이런식으로 해줘야함
     */
  var scroll = ScrollController(); //스크롤 높이 저장할 state 하나 만들기
  // ScrollController() : Scroll 같은 정보를 쉽게 저장할수 있도록 저장함을 만들어 주는놈
  void initState() {
    super.initState();
    scroll.addListener((){
      // addListener 왼쪽에 있는 변수가 변할때마다  이아래 코드 실행해 달라는 유용한 함수임
      //print(scroll.position.pixels); // 스크롤바 내린 높이 출력함 (위에서 부터 얼마나 스크롤이 됬는지)
      // maxScrollExtent 스크롤바 최대 내릴수 있는 높이
      //userScrollDirection : user가 어느 방향으로 스크롤하는지

      if(scroll.position.pixels == scroll.position.maxScrollExtent){ // 맨 밑까지 스크롤 했는지 체크 가능
              getMore();
        //print('같음');
      }
    });
  }

  @override
  Widget build(BuildContext context) {


    if (widget.mamber.isNotEmpty) { // 리스트 안 비어 있는지 물어보는 코드임
      return ListView.builder(
          itemCount: widget.mamber.length,
          controller: scroll, // ListView가 스크롤될 때 마다 스크롤 위치정보들이 scroll 변수에 기록됩니다.
          // 위치 측정은 스크롤 움직일때마다 해야함 (바닥인지 계속 체크해야함)
          itemBuilder: (context, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 1 == 1 ? '이거' : '저거' (삼항 연상자 문법) 조건식 ? 조건식이 참이면 실행할 코드 , 거짓이면 실행할 코드
                widget.mamber[i]['image'].runtimeType == String
                    ? Image.network(widget.mamber[i]['image']) // image.network() 에는 http 부터 시작하는 이미지만 가능함:
                : Image.file(widget.mamber[i]['image']), // 유저가 선택한 이미지는 _File 타입입니다.

                Text('id ${widget.mamber[i]['id'].toString()}'),   // 글자 중간에 변수 삽입
                Text('좋아요 ${widget.mamber[i]['likes'].toString()}'),
                Text('날짜 ${widget.mamber[i]['date'].toString()}'),
                Text('내용 ${widget.mamber[i]['content'].toString()}'),
                Text(widget.mamber[i]['liked'].toString()),
                Text('글쓴이 ${widget.mamber[i]['user'].toString()}'),
              ],
            );
          }); // 3번 반복
    }
    else{  //데이터 들오기도 전에 뿌리려고 하면 아레 메세지가 화면 출력 된후 나옴
      return CircularProgressIndicator();
      //Text('로딩중입니다');
    }

  }
}


class Upload extends StatefulWidget {
  const Upload({Key? key, this.userImage, this.setUserContent, this.addMyData}) : super(key: key);
  final userImage;
  final setUserContent;
  final addMyData;
  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,  스크롤 원하지 않을때 사용
        appBar: AppBar(
          actions: [IconButton(onPressed: (){
           widget.addMyData(); // 버튼 누르면 누른 내용들 추가가 됨
          }, icon: Icon(Icons.send))],

        ),
        body:
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  IconButton(  // 화면 닫는 버튼
                      onPressed: (){
                        Navigator.pop(context); // 다이얼 로그 했던거랑 유사 MaterialApp 포함한 context 넣어야함  요 context는   Widget build(BuildContext context) 요건데 위로위로
                        // 가다보면 MaterialApp 도 있을것임
                      },
                      icon: Icon(Icons.close)
                  ),

                  Container(
                    width: 350,
                    child: Image.file(widget.userImage),// 파일 경로로 이미지 띄우는 법
                    // 이렇게 사이즈 조절 하는 방법 말고도 다양한 방법있음
                  ),
                  Text('이미지업로드화면'),

                  TextField(onChanged: (text) { // onChanged: 에 이렇게 변수 하나 넣으주면 사용자가 입력한 글이 됨
                      widget.setUserContent(text); // 사용자가 입력한거 값 바로 부모 state에 넣어줌
                    },
                  ),
                  /*
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '좋아요 개수를 입력해 주세요'),
                    onChanged: (String str) {
                      setState(() {
                          likes = str;
                      });
                    },
                  ),
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '날짜를 입력해 주세요'),
                    onChanged: (String str) {
                      setState(() {
                          data = str;
                      });
                    },
                  ),
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '내용을 입력해 주세요'),
                    onChanged: (String str) {
                      setState(() {
                            context2 = str;
                      });
                    },
                  ),
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '진실 거짓을 입력해 주세요'),
                    onChanged: (String str) {
                      setState(() {
                            liked = str;
                      });
                    },
                  ),
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '사용자 이름을 입력해 주세요'),
                    onChanged: (String str) {
                      setState(() {
                              user = str;
                      });
                    },
                  ),
                  */
                   

                ],
              )
            ),
        );

  }
}