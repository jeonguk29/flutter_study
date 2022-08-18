// 리스트를 mapping 하는 방법
// mapping. 일반적 의미에서 매핑이랑 어떤 값을 다른 값에 대응시키는 과정

void main(){

  List<String> blackpink = ["로제", "지수", "리사", "제니"];
  
  final newBlackPink = blackpink.map((x){
    return "블랙핑크 $x";
  }); 
  
  /*
   리스트는 모두 이 map 함수가 있음 
   첫번째 파라미터에 함수를 넣어줌 
   x 라고 아무 이름을 넣어주면 각각의 리스트 원소들을 받게되고
   뭔가를 리턴 해줘야함 리턴 되는게 자기가 가진 원소를 대체 하게됨
   즉 반환 값으로 현제 원소에 뭔가를 가공한게 되는 거임 
   하지만 자기 자신 리스트가 변경 되는게 아니라 새로운 리스트로 받게 되어 있음
   다시 정리하면 
   기존 리스트에 원소를 가공해서 새로운 리스트에 저장 하는 것임
   
   */
  
  print(blackpink); 
  print(newBlackPink);
  // (블랙핑크 로제, 블랙핑크 지수, 블랙핑크 리사, 블랙핑크 제니) 이렇게 Iterable 로 나옴   
  print(newBlackPink.toList());// Iterable 변환 쉬우니까 리스트로 변환 
  
  
  // 이 map 함수를 간단하게 쓰는 방법이 있는데 바로 화살표 함수 arrow 함수를 이용 하는거임 
  final newBlackPink2 = blackpink.map((x) => "블랙핑크 $x");  // 훨신더 간결해서 많이 사용함
  print(newBlackPink2.toList());
  
  
  
  // map 함수를 쓰면 완전 새로운 리스트가 나온다고 했음 
  print( blackpink  ==  blackpink );
  print( newBlackPink ==  blackpink );
  print( newBlackPink  ==  newBlackPink2 ); // 그래서 완전히 같은 원소를 가지고 있어도 false가 나옴  
  
  
  
  // 실제 활용하는 방법 [1.jpg, 3.jpg, 5.jpg, 7.jpg, 9.jpg,]
  String number = "13579";
  final parsed = number.split('').map((x) => "$x.jpg").toList();
  // number.split('') 하면 리스트로 문자열 하나하나 나눠서 넣어줌 
  // 리스트는 map 가능하니까 위와 같이 해주고  Iterable 을 리스트로 변환도 가능함 
  print(parsed);
  
  
}
  
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      














