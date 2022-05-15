
import 'package:flutter/material.dart';    // 가장 먼저해줘야함 자동완선 이용하기 이것을 가져와야 플러터 관련 머티리얼등 다 이용 할수 있음 

// main 함수 앱에 시작점 자바랑 비슷 함 
void main() => runApp(MyApp());   // 플러터 최상위에 위치하는 함수 호출시 인자 값으로 위젯을 가짐 
// 그래서 안에 우리가 원하는 위젯 이름 아무거나 지어서 하나 넘겨주면 됨 (우리가 위젯으로 만들거임 ) 현재Myapp으로 넘겨줌 
// 플러터에서 main() 같이 소문자 시작이면 함수 MyApp 같이 대문자 시작시 위젯(자바에서 클래스랑 유사)임 

/*
// 플러터는 메번 시작할때마다 버튼 누를 때마다 숫자 증가하는 카운트 앱이 처음에 만들어짐
좌측에 pubspec.yaml 파일은 프로젝트에 메타데이터를 정의 하고 관리 하는 파일 ex 프로젝트 버전 라이브러리 등 
ios와 android 폴더는 각 플랫폼에 맞게 앱을 배포하기 위한 정보들을 가지고 있음 
우리가 가장 자주 사용할 폴더는 lib 폴더임 앱만들때99% 여기서 작업함 

최상위 위젯이될 MyApp 위젯은 뼈대를 만든 역할만 할거라서 어떠한 변화나 움직임 없는 정적인 위젯이 될것임 
그래서 우리가 만드는 MyApp위젯은 StatelessWidget 으로 지정해야함 
*/

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) { //모든 커스텀 위젯은 또다른 위젯을 리턴하는 빌다라는 함수를 가지고 있음 
    return MaterialApp(     //  MaterialApp을 리턴함으로 플러터 프레임 워크가 제공하는 모든 기본 위젯과 기본 테마 사용 가능 
      title: 'First app',
      theme: ThemeData(
      primaryColor: Colors.blue // 특정색을 지정해 사용 하겠다.
      ),
    home: MyHomepage(),            //홈은 앱이 정상적으로 실행되었을때 가장먼저 화면에 보여주는 경로 앱실행시 MyHomepage(), 위젯내에 내용을 가장 먼저 보게될것임 
    );
  }


}
