addNumbers(int x, int y, int z)
{
// 세개의 숫자(x,y,z)를 더하고 짝수인지 홀수인지 알려주는 함수
// parameter / argument - 매개변수 
// positional parameter - 순서가 중요한 파라미터

  int sum = x + y + z;
  print('x : $x');
  print('y : $y'); 
  print('z : $z'); 

if(sum % 2 == 0)
{
  print("짝수입니다.");
}else{
  print("홀수 입니다.");
}


}

// optional parameter - 있어도 되고 없어도 되는 파라미터 

addNumbers2(int x, [int y = 20, int z = 30])
// []넣주면 값 임력 안해도 되는데 ?로 널값이 들어간다고 알려줘야함 
// [int? y , int? z] 하지만 아래 널과 정수를 더할수 없으니 오류나서 위와 같이 기본값을 설정 해주면 오류 발생 x
{                                            

  int sum = x + y + z;
  print('x : $x');
  print('y : $y'); 
  print('z : $z'); 

if(sum % 2 == 0)
{
  print("짝수입니다.");
}else{
  print("홀수 입니다.");
}


}

addNumbers3(   // named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
  {
    required int x, 
    required int y,   
    int z = 30, // named parameter함수 매개변수에서  optional parameter - 있어도 되고 없어도 되게 선언 
  }
)
{                                            

      int sum = x + y + z;
      print('x : $x');
      print('y : $y'); 
      print('z : $z'); 

    if(sum % 2 == 0)
    {
      print("짝수입니다.");
    }else{
      print("홀수 입니다.");
    }


}

int addNumbers4(int x,          // 반환과 매개변수 조합 
  {
    required int y,   
    int z = 30, // named parameter함수 매개변수에서  optional parameter - 있어도 되고 없어도 되게 선언 
  }
)
{                                            

      int sum = x + y + z;
      print('x : $x');
      print('y : $y'); 
      print('z : $z'); 

    if(sum % 2 == 0)
    {
      print("짝수입니다.");
    }else{
      print("홀수 입니다.");
    }

    return sum;

}

// arrow function - 화살표 함수
int addNumbers5(int x,{
  required int y,
  int z = 30,
}) => x + y + z;         // 이렇게 해주면 그냥 => 다음이 바로 반환 값이라는걸 알려주는 거임


enum Status{
  approved,// 승인 
  pending,  // 대기 
  rejected, // 거절
}

void main()
{ 
  Status status = Status.approved;
  //String string = "approved";
  /*
    위에처럼 문자열로 해도 되는거 아닌가? 
    =>
    정확하게 3개의 값만 존재한다고 나 또는 같은 팀 개발자에게 알려주려고 쓰는 용도이기 때문에 
    사용 하는 것이고 문자열로 할경우 오타나 다른 값이 들어갈수도 있기 때문임 
  */
  print("enum----------------");
  if(status == 'approved'){
    print("승인입니다.");
  }else if(status == 'pending')
  {
    print('대기입니다.');
  }
  else{
    print("거절입니다.");
  }

  print("positional parameter----------------");

  addNumbers(10, 20, 30);
  addNumbers(20, 30, 40); //positional parameter - 순서가 중요한 파라미터 받는 함수 실행 

  print("optional parameter----------------");
  addNumbers2(10);//optional parameter - 있어도 되고 없어도 되는 파라미터 받는 함수 
  addNumbers2(10,100,200); // 값을 넣어주면 기본값은 무시가 됨 

  print("named parameter----------------");
  addNumbers3(x: 10,y: 20,z: 30);  //named parameter 사용시 직접 지정 해줘야함 
  addNumbers3(x:10,y:20); // /named parameter에서 optional parameter 사용 

  print("retrun 과 parameter 조합----------------");
  int result = addNumbers4(10, y:20, z:30); // x는 positional parameter 라 키워드 넣을 필요가없음 
  int result2 = addNumbers4(10, y:20);

  print('result : $result');
  print('result : $result2');

  print('sum: ${result + result2}');

print("arrow function - 화살표 함수----------");

  int result3 = addNumbers5(10, y:20, z:30); // x는 positional parameter 라 키워드 넣을 필요가없음 
  int result4 = addNumbers5(10, y:20);
  print(result3 +1);
  print(result4);

}