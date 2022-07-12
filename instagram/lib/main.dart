import 'package:flutter/material.dart';
//import './style.dart';  // main.dart랑 같은 경로에 있어서 그냥 이렇게 해주면됨
import './style.dart' as style; // import 할때 변수 중복문제 해결 maindart에도 theme 변수 있을수 있으니
import 'package:http/http.dart' as http; // 웹 서버로 데이터 요청, 보낼때 필요한 패키지
import 'dart:convert';
import 'package:flutter/rendering.dart';// 스크롤 관련 유용한 함수들 들어있음

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
            onPressed: (){},
            iconSize: 30,
          )
        ],

      ),
      body: [Home(mamber:data), Text('샵페이지')][tab],  // 0과 1에 따라 보이는게 다름
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

class Home extends StatefulWidget {  // statefulwidget은 부모가 보낸state 등록은 첫 class에
  // 사용은 두번째 class에 해야함
  Home({Key? key, required this.mamber}) : super(key: key);
  List<dynamic> mamber;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AddData()async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json')); // 결과 반환 해주면 변수에 담아 쓰면됨
    if (result.statusCode == 200) {
      var result2 = jsonDecode(result.body);
      setState((){
        widget.mamber.add(result2);
      });
    } else {
      throw Exception('실패함ㅅㄱ');
    }
  }


  var scroll = ScrollController();
  void initState() {
    super.initState();
    scroll.addListener((){
      if(scroll.position.pixels == scroll.position.maxScrollExtent){ // 맨 밑까지 스크롤 했는지 체크 가능
        AddData();
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
                Image.network(widget.mamber[i]['image']),
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
