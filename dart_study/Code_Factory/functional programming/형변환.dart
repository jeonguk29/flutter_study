/*
함수형 프로그래밍에 기본은 형변환임

보통 리스트, 멥, 셋 같은 자료형을 사용함 
*/

void main(){

  List<String> blackpink = ["로제", "지수", "리사", "제니","제니"];
  
  print(blackpink);
  print(blackpink.asMap()); // map으로 변환 
  print(blackpink.toSet()); // Set 함수로 변환 
  // set 자료형은 중복을 허용 하지 않기 때문에 제니가 한번 출력됨 
 
  
  // 리스트로 Map 자료형 형변환 
  Map blackpinkMap = blackpink.asMap();
  
  print(blackpinkMap.keys);
  print(blackpinkMap.values);
  /*
   (0, 1, 2, 3, 4)
    (로제, 지수, 리사, 제니, 제니) 
    
    dart에서 ()은 Iterable라는 거임
    일종에 리스트 같은건데 다른 형태로 변환이 쉬운 자료형임
    리스트나 맵 같은거로 실제로 사용 하는 경우는 많지는 않음
    
  */
  print(blackpinkMap.keys.toList());  // 요렇게 리스트로 변환 
  print(blackpinkMap.values.toList());
  
  // 리스트로 Set 자료형 형변환
  
  
  Set blackpinkSet = Set.from(blackpink); // blackpink.toSet() 이렇게 해도됨 
  print(blackpinkSet.toList());
  // Set 자료형을 리스트로 형변환 
  
  // 서로 각각의 타입을 형변환 하는걸 알아 보았음 
  
}















