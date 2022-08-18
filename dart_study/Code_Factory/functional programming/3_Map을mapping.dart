/*
Map을 Mapping 하는 방법 

2가지만 기억하면됨 Map 자체를 Mapping 해서 새로운 Map을 만들때

그리고 키 값 혹은 벨류 값만 리스트 형태로 만들때 
*/


void main(){
  
  Map<String, String> harrypotter = {
    "Harry Potter" : "해리 포터",
    "Ron weasley" : "론 위즐리",
    "Hermione Granger" : "헤르미온느 그레인저"    
  };
  
  
  /*
  Map 자료형도 map 함수 사용 가능함 함수를 넣게 되는데 arrow 함수 사용 할거임
  
  파라미터 넣어야 하는데 Map 자료형 특징은  키와 벨류 모두 넣어줌 하나가 세트니까
  Map 자료형은 MapEntry 함수를 사용해서 다시 Map 형태로 돌려줌 첫번째로 key 두번째로 value 
  에 대한 가공할 값을 넣어주면 됨 
  
   */
  final result =  harrypotter.map(
  (key, value) => MapEntry(
    "Harry potter Character $key", 
    "해리포터 캐릭터 $value",
    ),
  );
  
  print(harrypotter);  // 리스트와 똑같이 기존 Map은 변하지 않았음 
  print(result); 
  
  
  
  // 위에서 했던 Map을 Map으로 바꾸는 형태 이런건 잘 안함 
  
  // 아래와 같은 상황을 제일 많이 씀 
  final keys =  harrypotter.keys.map((x) => 'HPC $x').toList();
  // harrypotter.keys 하면 Map 자료형에 키 값을 Iterable로 키값들을 받을수 있었음
  // Iterable 자료형도 map 함수를 이용해서 mapping이 가능함 
  
  // map((x) => 'HPC $x') 이걸 이런식으로 가공해서 리스트형태로 변환 시켜주는 형태로 많이씀
  
  final values =  harrypotter.values.map((x) => '해리포터 $x').toList();
  
  print(keys);
  print(values);
}
  

















                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      



























                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      














