void main()
{
  // final 와 const 키워드
  // final로 선언하면 변수에 값 변경 불가능함
  
  final String name = "코드팩토리";
  //name = "woogie";
  
  const String name2 = "우기";
  print(name2);
  
  //name2 = "코드팩토리";
  
  // final 와 const 키워드 둘다 선언하면 변수값 못 바꿈 
  
   final name3 = "코드팩토리";  
   const name4 = "우기";      // 둘다 var 키워드가 생략 가능함 
  
  
  // final 와 const 키워드의 차이점 빌드 타임에 유무 
  // final 은 빌드타임에 값을 몰라도 되는데 const는 알고 있어야함 
  // 즉 코드가 알수 있게 010101으로 변환 하는 빌드타임에서 값을 알고 있어야 함
  // 다시말해 이 코드를 작성하는 당장 그 순간에 값을 알고 있어야 하는데 
  // DateTime now = DateTime.now(); 이코드가 실행되는 순간에 값을 가져오는거라 값이 정해져 있는게 없음
  // 0101010 변환 하는데 값이 없으니까 오류를 내는 거임 final은 바뀌는 순간에 값을 몰라도 상관 없는거고 
  
  //DateTime now = DateTime.now(); // 는 현제 시간을 반환 해주는데 이코드가 실행되는 그 순간임 현제 우리 시계 시간이 아니라
  final DateTime now = DateTime.now();
  print(now);
  
  //const DateTime = now2 = DateTime.now();
  // 그래서 const 같은경우는 절대적으로 값을 알아야함
  
  print("----------------------");  
  
  // operators
  int num = 2;
  print(num);
  print(num + 2);  // 더하기 
  print(num - 2);   // 빼기 
  print(num * 2);   // 곱하기
  print(num / 2);   // 나누기 
  
  print("----------------------"); 
  
  num++;   // 더한값을 다시 넣는 것 즉 num = num +1 
  print(num);
  num--;
  print(num);
 
  print("----------------------"); 
  
  double num2 = 4.0;
  print(num2);
  
  num2 +=1;
  print(num2);
  num2 -=1;
  print(num2);
  num2 *=2;
  print(num2);
  num2 /=2;
  print(num2);
  
  // null 조건 operators
  
  double? number = 4.0;   // ?해줘서 널 or 실수형 담을수 있음 
  print(number);
  
  number = 2.0;
  print(number);
  
  number = null;
  print(number);
  
  number ??= 3.0;  // ?? 는 넘버가 널이라면 이 오른쪽 값을 넣어라 라는 뜻 널 아니라면 안넣음 
  print(number);
  
  // 비교 연산자 
  
  int number3 = 1;
  int number4 = 2;
  
  print(number3 > number4);
  print(number3 < number4);
  print(number3 >= number4);
  print(number3 <= number4);
  print(number3 == number4); 
  print(number3 != number4);
  print("----------------------"); 
  
  // 타입비교 연산자 
  print(number3 is int);   // 이런식으로 타입을 비교해서 불리언 값 반환함 
  print(number3 is String);
  
  print(number3 is !int);   // !는 반대니까 반대값 나옴 
  print(number3 is !String);
  
  
  // 논리 연산자
  // && - and 조건
  // || - or 조건 
  bool result = 12 >10 && 1 > 0 && 3 > 0;
  print(result);
  
  bool result2 = 12 >10 &&  0 > 1;
  print(result2);
  
  
  bool result3 = 12 >10 || 1 > 0;
  print(result3);
  
  
  bool result4 = 12 >10 || 0 > 1;
  print(result4);
  
  
  bool result5 = 12 < 10 || 0 > 1;
  print(result5);
  
  
  
  
  
}
