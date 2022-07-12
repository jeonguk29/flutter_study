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


var a = TextStyle(

);




class MyApp extends StatefulWidget {  //state 만들려면 StatefulWidget 이여야함
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;
  var list = [1,2,3]; // 리스트는 이렇게 만듬
  var map = {'name':'john', 'age':20};
  // map 은 키 와 벨류로 구분 해서 만듬
// 참고로 list와 map안에는 서로 list , map 넣어도 상관 없음 아무거나 다 넣을수 있음

  getData()async{
    // get요청  보낼때 이렇게
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json')); // 결과 반환 해주면 변수에 담아 쓰면됨
    // http 함수도 오래걸리는 함수임 (전문용어로 Future) 그래서 await 붙어줌 await 쓰려면 함수 뒤에 async 키워드 필요
    //print(result.body);  다 "" 로 되어있음  서버랑 주고받는 데이터는 오직 문자만 가능
    var result2 = jsonDecode(result.body);
    print(result2[0]['likes']);
    //조작하기 쉬운 list, map같은 자료로 변환하려면 json.Decode() 여기에 넣었다가 빼면 됩니다.
    // 현제 [{}] 이구조임  이걸 보니 리스트자료형 안에 map 자료형이 있는거임
  }

  @override
  void initState(){  // 앱 로드 될때 바로 GET 하고 싶음 그럼 이렇게
    super.initState();
    // 여기다 코드 짜면 MyApp 이라는 커스텀 위젯이 로드될때 실행됨
    getData();  //initState() 에는 await 사용 못해서 밖으로 따로 함수를 빼줌
  }


  var name2 = ["김영숙", "홍길동", "피자집"];

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
      body: [Home(), Text('샵페이지')][tab],  // 0과 1에 따라 보이는게 다름
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
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, i) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 웹상 이미지 넣을수 있음
              Image.network('https://mblogthumb-phinf.pstatic.net/MjAxNzAxMjZfMjEw/MDAxNDg1NDIxNjIxOTA2.yCkDe0TNtSfretPURTVrdDqay50odvbiNIyDGIG8bEgg._mge-2IK2a4RsLDkU-etvMmgNn-R66yPCFFKIKkut3Yg.JPEG.momossense/Deja_Vu_%28feat._Justin_Bieber%29_-_Single_2.jpg?type=w800'),
              Text("좋아요"),
              Text("글쓴이"),
              Text('글내용'),
            ],
          ),
        );
      },  // 3번 반복
    );
  }
}
