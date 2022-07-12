import 'package:flutter/material.dart';
//import './style.dart';  // main.dart랑 같은 경로에 있어서 그냥 이렇게 해주면됨
import './style.dart' as style; // import 할때 변수 중복문제 해결 maindart에도 theme 변수 있을수 있으니
import 'package:http/http.dart' as http; // 웹 서버로 데이터 요청, 보낼때 필요한 패키지
import 'dart:convert';


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

class Home extends StatelessWidget {
  const Home({Key? key, this.mamber}) : super(key: key);
  final mamber; // state 자식 위젯으로 보내기 3단계 복습  부모가 보낸거 수정 안하니까 final로
  @override
  Widget build(BuildContext context) {

    // 빨간줄 없에기
    //내가 찾은거 : 데이터 목록의 길이를 지정해야 빨간줄 안나옴  // https://stackoverflow.com/questions/54977982/rangeerror-index-invalid-value-valid-value-range-is-empty-0 참고
    //코딩애플 : 빨간줄 뜨는 이유는 서버에서 데이터 들어오기도 전에 data[0]['content'] 해서 에러 남
    // 들어오기도 전에 하면 비어 있기 때문임
    /*
      방지 data에 뭐 들어오면 보여달라고 코드 짜야함

       */
    if (mamber.isNotEmpty) { // 리스트 안 비어 있는지 물어보는 코드임
      return ListView.builder(
        itemCount: mamber.length,
        itemBuilder: (context, i) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(mamber[i]['image']),
                Text(mamber[i]['id'].toString()),
                Text(mamber[i]['likes'].toString()),
                Text(mamber[i]['date'].toString()),
                Text(mamber[i]['content'].toString()),
                Text(mamber[i]['liked'].toString()),
                Text(mamber[i]['user'].toString()),
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
