import 'package:flutter/material.dart'; // 이것도 넣어줘야 아래 위젯들 작동됨

// ThemeData 부분만 변수에 담음

var _var1;
/*
언더바 붙이면 자동으로 "다른 파일에서 import해서 쓸 수 없는 변수"가 됩니다.   : Private 속성
함수명, 클래스명에도 통하니까 다른 파일에서 쓰기 싫은 변수들은 언더바를 쓰도록 합시다.
*/


var theme = ThemeData(
  textButtonTheme: TextButtonThemeData(  // 여기만 이름 바꾸면 다른 버튼도 동일함
    style: TextButton.styleFrom( // 버튼 스타일 변경시 여기 안에서 바꿔야 모든 버튼 적용됨
      backgroundColor: Colors.grey,
    )
  ),



//iconTheme: IconThemeData(color: Colors.grey),
appBarTheme: AppBarTheme(   // 이렇게 길어졌을때 다른 파일에 넣어놓고 불러오기 가능
color: Colors.white,
elevation: 1, // 그림자
actionsIconTheme: IconThemeData(color: Colors.black, size: 35.0),
titleTextStyle: TextStyle(color: Colors.black, fontSize: 25.0),
),

textTheme: TextTheme(
bodyText2: TextStyle(color: Colors.red),
  bodyText1: TextStyle(color: Colors.blue),// 여기에 다양한 스타일 만들어 놓고 Theme.of()이걸로 가져다 쓸 수도 있는 것임
),

bottomNavigationBarTheme: BottomNavigationBarThemeData(
  selectedItemColor: Colors.black,
),



);


