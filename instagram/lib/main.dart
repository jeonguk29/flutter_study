import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import './style.dart';  // main.dart랑 같은 경로에 있어서 그냥 이렇게 해주면됨
import './style.dart' as style; // import 할때 변수 중복문제 해결 maindart에도 theme 변수 있을수 있으니
import 'package:http/http.dart' as http; // 웹 서버로 데이터 요청, 보낼때 필요한 패키지
import 'package:flutter/rendering.dart';// 스크롤 관련 유용한 함수들 들어있음
import 'package:image_picker/image_picker.dart'; // 이미지 권한 관련 이미지 관련 함수들 들어있음
import 'dart:io'; // 파일 다루는 유용한 함수가 들어있는 기본 패키지입니다.
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



/*
앱을 껐다가 켜면 state는 초기화됩니다.
그래서 state 안에 있던걸 어디 저장해두고 싶으면
서버로 보내서 Database에 저장을 하든가 아니면
shared preferences 라는 로컬 공간에 저장하면 됩니다.

중요한건 서버로 덜중요한건 로컬에 저장하는게 좋은 관습임
 */

void main() {

  //store를 사용할 위젯들을 전부 ChangeNotifierProvider() 로 감싸면 됩니다.
  // 모든 위젯들이 사용할거면 MaterialApp() 을 감싸면 되겠군요.
  runApp(
    MultiProvider(  // store 여러개면  MultiProvider로 등록 해야함
      providers: [
        ChangeNotifierProvider(create: (c) => Store1()),
        ChangeNotifierProvider(create: (c) => Store2()),
      ],
      child: MaterialApp( // 이제 Store1, Store2 둘다 사용 가능
          theme: style.theme,
          home: MyApp()
      ),
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
  var userLikes;
  var userDate;
  var userName;

  // shared preferences 에 데이터 저장하는 법
  saveData() async {
    var storage = await SharedPreferences.getInstance(); // 저장공간 오픈하는법  기초 셋팅

    storage.setString('name',
        'john'); // storage.setString('작명','저장할데이터')   key : value 형태로 저장 하는 거임
    var result3 = storage.get('name'); // 데이터 출력 하는 방법
    print(result3);
    storage.setStringList('name', ['john', 'park']);
    storage.remove('name'); // 데이터 삭제 저장한 데이터 삭제 하는 방법임
    var result = storage.get('name'); // 데이터 출력 하는 방법
    print(result);

    // map 자료 저장하려면 JSON으로 바꿔서 저장해야함
    var map = {'age': 20};
    storage.setString('map', jsonEncode(map)); // map 자료 넘겨주면 "" 다 붙여서 문자열로 만들어줌
    var result2 = storage.getString('map') ?? "없는데요";
    print(jsonDecode(
        result2)); // jsonDecode 안에는 Stirng? 은 뷸가 확실해야함 그래서 위에 처럼 널체크 필요
    print(jsonDecode(result2)['age']); // 이렇게 하면 map에서 원하는 데이터 꺼내 쓸수 있음
  }

    /*
    storage.setString('name', 'john');
    storage.setBool('name', true);
    storage.setInt('name', 20);
    storage.setDouble('name', 20.5);
    storage.setStringList('name', ['john', 'park']);
    실은 숫자, 문자, Bool, List<String> 자료형도 저장가능합니다.
    참고로 List<int> 이런거 저장 못해서 List<String>으로 바꿔서 저장하든 해야합니다.
    저것들 출력하려면 set어쩌구를 get어쩌구로만 바꿔주면 출력가능합니다.

    꺼낼때도
    storage.getString();
    storage.getBool();
    storage.getInt();
    storage.getDouble();
    storage.getStringList();
     */



  void initState(){  // 앱 로드 될때 바로 GET 하고 싶음 그럼 이렇게
    saveData();
    super.initState();
    // 여기다 코드 짜면 MyApp 이라는 커스텀 위젯이 로드될때 실행됨
    getData();  //initState() 에는 await 사용 못해서 밖으로 따로 함수를 빼줌
  }


  setUserContent(a){
    setState((){
      userContent = a;
    });
  }
  setUserLikes(a){
    setState((){
      userLikes = a;
    });
  }
  setUserDate(a){
    setState((){
      userDate = a;
    });
  }
  setUserName(a){
    setState((){
      userName = a;
    });
  }

  addMyData(){
   var myData = {
     'id': data.length, // 게시물 개수에 따라 id 정해지게
    'image': userImage,
    'likes': userLikes,
    'date': userDate,
    'content': userContent,
    'liked': false,
    'user': userName,
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
                  setUserContent : setUserContent,
                   setUserLikes : setUserLikes,
                   setUserDate : setUserDate,
                   setUserName : setUserName,
                   addMyData : addMyData ))
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

                // 글쓴이 누르면 글쓴이 프로필 들어가게 만들기  onpessed text에 만들려면 아래 GestureDetector 위젯으로 감싸고 구현 시키는 방법있음
                  // GestureDetector 위젯으로 감쌓으면 다양한 기능을 사용자가 할때  원하는 위젯들을 실행 가능함
                GestureDetector(
                  child:Text('글쓴이 ${widget.mamber[i]['user'].toString()}'),
                  onTap: (){
                    Navigator.push(context,
                        PageRouteBuilder(pageBuilder: (c,a1,a2) => Profile(),
                        transitionsBuilder: (c,a1,a2, child) =>
                            SlideTransition(  // 슬라이드 애니매이션은 이렇게 구현
                              position: Tween(
                                begin: Offset(-1.0, 0.0), // 시작 좌표
                                end: Offset(0.0, 0.0),   // 최종 좌표
                              ).animate(a1),
                              child: child,
                            )
                          /*
                            FadeTransition(opacity: a1,child: child),
                          transitionDuration: Duration(milliseconds: 1500)// 밀리 세컨드 단위로 페이지 전환 애니메이션 속도조절 가능
                         */
                        )
                        //CupertinoPageRoute(builder: (C) => Profile() 아이폰 스타일 화면 전환
                    );
                  },
                  //onDoubleTap: , 이건 두번 딱딱 하면 뜨는 기능 이거 말고도 다양한 기능 제공
                 // onHorizontalDragStart: , 왼쪽 스와이프 할때 기능 나오게
                 // onScaleStart: , 확대 모션 취하면 기능 실행
                ),
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
  const Upload({Key? key, this.userImage, this.setUserContent, this.addMyData, this.setUserLikes, this.setUserDate, this.setUserName}) : super(key: key);
  final userImage;
  final setUserContent;
  final addMyData;
  final setUserLikes;
  final setUserDate;
  final setUserName;
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
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '내용을 입력해 주세요'),
                    onChanged: (text) {
                      setState(() {
                        widget.setUserContent(text); // 사용자가 입력한거 값 바로 부모 state에 넣어줌
                      });
                    },
                  ),

                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '좋아요 개수를 입력해 주세요'),
                    onChanged: (text) {
                      setState(() {
                        widget.setUserLikes(text); // 사용자가 입력한거 값 바로 부모 state에 넣어줌
                      });
                    },
                  ),
                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '날짜를 입력해 주세요'),
                    onChanged: (text) {
                      setState(() {
                        widget.setUserDate(text); // 사용자가 입력한거 값 바로 부모 state에 넣어줌
                      });
                    },
                  ),

                  TextField(style: TextStyle(fontSize: 22, color: Colors.red),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: '사용자 이름을 입력해 주세요'),
                    onChanged: (String text) {
                      setState(() {
                        widget.setUserName(text); // 사용자가 입력한거 값 바로 부모 state에 넣어줌
                      });
                    },
                  ),

                ],
              )
            ),
        );
  }
}

class Store2 extends ChangeNotifier{ // 이렇게 store 여러개 만들어도 됨
  var name = 'john kim';
}


class Store1 extends ChangeNotifier { // state 보관함임 일면 store
  var follower = 0;
  bool friend = false; // 일종의 스위치 역할 state
  // 현재 서버와 get 요청중인지 아닌지 그런거 알려주고 싶을때도 이런 스위치 많이 씀

  /*
  profile 페이지 방문시 get 요청해서 데이터 가져오고 그걸 state 안에 넣으려면
  아래와 같이 해주면 됨
   */
  var profileImage = [];
  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body); // json 형태 다시 map 자료로 Decode
    profileImage = result2;
    notifyListeners(); // 재랜더링
  }


  addFollower(){
    if(friend == false){
      follower++;
      friend = true;
    }
    else{
      follower--;
      friend = false;
    }
    notifyListeners();
  }

/*
  changeName(){  // 애도 자식전송 했을때 처럼 변경 함수를 만들어서 사용 해야함
    name ='john park';
    notifyListeners();  // 재랜더링 해주려면 이게 꼭 필요함 그냥은 재 랜더링 안되서 변경 사항이 화면에 안보임
  }
*/
  /*
  1.이러는 이유는 class 안의 변수는 바깥에서 직접 조작시 나중에 버그같은게 날수 있기 때문에 위험 하기때문문
  2. state 이상해지면 버그찾기 쉬움
  */

}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.watch<Store2>().name),), // 이렇게 불러주면 됨 모든 위젯에서 이거 직접 사용 가능함
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/koko1.png'), // 동그란 이미지 만들때 이런거 사용 하면 유용함
          ),
          Text('팔로워 ${context.watch<Store1>().follower}명'),
          ElevatedButton(onPressed: (){
            context.read<Store1>().addFollower();
          }, child: Text('팔로우')),
          ElevatedButton(onPressed: (){
            context.read<Store1>().getData();
            print(context.read<Store1>().profileImage);
          }, child: Text('사진가져오기')),
        ],
      ),


    );
  }
}
