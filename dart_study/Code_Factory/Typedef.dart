void main()
{ 
  Operation operation = add;  // 현제 add라는 함수가 들어가 있는거임 
  int result = operation(10,20,30); 
  print(result);

  operation = subtract; // 빼기 함수로 정의 
  int result2 = operation(10,20,30);  // 이렇게 typedef 를 선언하면 시그니처에 부합하는 모든 함수들을 마음것 집어 넣을수 있음 
  print(result2);

  int result3 = calculate(30, 40, 50, add); // 실제로는 이렇게 사용함 
  print(result3);
}

// typedef 함수와 비슷하지만 바디가 없음 

typedef Operation = int Function(int x, int y, int z);  //함수 선언 하듯이 리턴되는 타입 지정해주기  Function(int x, int y, int z) 이러한 파라미터 받는다는 뜻

// 더하기 
int add(int x, int y, int z) => x + y + z;   // 위에 지정한 함수의 형태를 가지고 typedef 를 만들수 있음 중요한건 위에 함수 파라미터 형태와 완전 일치 해야함 

// 빼기
int subtract(int x, int y, int z) => x - y - z;

// 계산 
int calculate(int x, int y, int z, Operation operation){
  return operation(x,y,z);
}