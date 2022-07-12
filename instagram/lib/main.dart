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
  var list = [1,2,3]; // 리스트는 이렇게 만듬
  var map = {'name':'john', 'age':20};
  var mamber = [];
  // map 은 키 와 벨류로 구분 해서 만듬
// 참고로 list와 map안에는 서로 list , map 넣어도 상관 없음 아무거나 다 넣을수 있음

  getData()async{
    // get요청  보낼때 이렇게
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json')); // 결과 반환 해주면 변수에 담아 쓰면됨
    if (result.statusCode == 200) {  // 에러 체크
      this.mamber  = jsonDecode(result.body);
    } else {
      throw Exception('실패함ㅅㄱ');
    }
    //print(result2[0]['likes']);
    //조작하기 쉬운 list, map같은 자료로 변환하려면 json.Decode() 여기에 넣었다가 빼면 됩니다.
    // 현제 [{}] 이구조임  이걸 보니 리스트자료형 안에 map 자료형이 있는거임
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
      body: [Home(mamber:mamber), Text('샵페이지')][tab],  // 0과 1에 따라 보이는게 다름
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
  final mamber;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, i) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*

              [{id: 0, image: https://codingapple1.github.io/app/img0.jpg, likes: 5, date: July 25, content: 등을 대라 등대, liked: false, user: John Kim}, {id: 1, image: https://codingapple1.github.io/app/img1.jpg, likes: 22, date: Aug 3, content: 요즘 폰카는 성능이 좋습니다, liked: false, user: Hilton_m}, {id: 2, image: https://codingapple1.github.io/app/img2.jpg, likes: 10, date: Nov 30, content: 기린바보 😵, liked: false, user: rimvely1}]

               */
              Image.network(mamber[i]['image']),
              Text(mamber[i]['id'].toString()),
              Text(mamber[i]['likes'].toString()),
              Text(mamber[i]['date'].toString()),
              Text(mamber[i]['content'].toString()),
              Text(mamber[i]['liked'].toString()),
              Text(mamber[i]['user'].toString()),
            ],
          ),
        );
      },  // 3번 반복
    );
  }
}
