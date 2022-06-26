void main() {
  var name = "코드 팩토리";

  print(name);

  var name2 = "레드벨벳";
  print(name);

  name = "플러터 프로그래밍";
  print(name);

  //정수
  int number1 = 10;
  print(number1);

  int number2 = 15;
  print(number2);

  int number3 = -20;
  print(number3);

  print(number1 + number2);
  print(number1 - number2);
  print(number1 * number2);
  print(number1 / number2);

  print("---------------------------------");

  //실수
  double num1 = 2.5;
  double num2 = 0.5;

  print(num1 + num2);
  print(num1 - num2);
  print(num1 * num2);
  print(num1 / num2);

  print("---------------------------------");
  //Boolean 맞다/틀리다
  bool isTrue = true;
  bool isFalse = false;

  print(isTrue);
  print(isFalse);

  print("---------------------------------");

  // String 글자 타입
  String name4 = "레드벨벳";
  String name5 = "우기";

  print(name4);
  print(name5);

  //var String은 무엇이냐면
  var name6 = "jjk";
  var num3 = 2; // 이런식으로 자료형을 직접 정하지 않고 오른쪽 값에 따라 정해지는 것임
  
  print(name6.runtimeType); // runtimeType 실제 실행되는 순간 어떤 타입인지 알려줌 
  print(num3.runtimeType);
  // 정말 필요할때만 쓰는것이 좋음
  
  // 가독성이 떨어지기 때문에 직접 명시해주는게 좋음 
  
  //Map<String, Map<int, List<double>>> testType = {};
  var testType = {}; // 위처럼 매번 저렇게 작성하기 그럴때 사용함

  
  
  
  
  print(name4 + name5);   // 스트링으로도 연산 가능 
  print(name4 + ' ' + name5);

  print('${name4} ${name5}'); // 이런식으로 문자열 안에도 넣어줄수 있음
  print('${name4.runtimeType} ${name5}');
  print('$name4 $name5'); //{} 생략 가능함 다만 바로 위에 처럼 함수까지 널어주어야 할때는 위에것을 사용해야함
  
  print("---------------------------------");
  // 다이나믹 타입   (어떤 타입이던 다 넣을수 있음 var랑 비슷)
  
  dynamic name7 = "플러터 최고";  // 자료형을 마음대로 변경 가능하게 해줌 
  print(name7);
  
  dynamic name8 = 3;
  print(name8);
  
  var name9 = "플러터 최고";
  print(name9);
  
  print(name7.runtimeType); // 둘다 스트링 형인걸 알수 있음 그럼 무슨 차이냐?
  print(name9.runtimeType);
  
  name7 = 1;
  print(name7);
  
  //name9 = 1;   
  
  //var는 선언 뒤로 바꿀수가 없음 처음 초기화시 지정된 자료형이 픽스 되는 것임   바꾸려면 오류남 
  
  
  print("---------------------------------");
  // nullable 과 non-nullable
  
  // nullable - null 이 될수 있다.
  // non-nullable - null이 될수 없다.
  // null - 아무런 값도 있지 않다.
  String strTest1 = "woogie";
  print(strTest1);
  //strTest1 = null 오류남     널이 들어갈수 없는 타입인데 널을 넣었다는 오류임 
  
  // 지금까지 배운 모든 타입들은 전부 두가지로 나뉨
  // 지정한 타입만 들어갈수 있는경우
  // 지정한 타입과 null이 들어 갈수 있는 경우.
  
  String? strTest2 = "woogie";
  strTest2 = null; // 
  print(strTest2);
  
  // 어떤 타입이던 위와같이 ? 넣으면 null 까지 들어갈 수 있는것임
  // 나중에 앱개발 할때 null 들어가서 앱이 뻗어버리는 것을 방지 할 수 있음 
  
  // 반대는 !임 
  
  
  String? strTest3 = "!널 불가능";
  print(strTest3!);// 나중에 함수같은거에 ! 을 넣으면 널이 들어갈 수 없다고 알려주는 것임
  // 즉 ?에 반대가 !임   즉 현재 이값은 널이 아니다 알려주는 것 
  
  
  
  
  
}
