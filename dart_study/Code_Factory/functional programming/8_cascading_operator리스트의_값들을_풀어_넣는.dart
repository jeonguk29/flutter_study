void main(){
  List<int> even = [
    2,
    4,
    6,
    8,
  ];
  
  List<int> add = [
    1,
    3,
    5,
    7,
  ];
  
  
  // cascading operator
  // ...
  // 여러개의 리스트를 하나로 합칠때 많이 사용함 
  // 리스트 안에 값들을 풀어 넣는 역할을 함
  
  print([even, add]);
  print([...even, ...add]); // 하나에 리스트 안에 값들이 펼쳐짐
  // 즉 리스트를 없애고 새로운 리스트에 값들을 넣는 것임
  // 그리고 이렇게 생성한 리스트는 완전히 새로운 리스트가 됨 
  
  print(even);
  print([...even]);
  print(even == [...even]); // false가 나옴 
  
}

