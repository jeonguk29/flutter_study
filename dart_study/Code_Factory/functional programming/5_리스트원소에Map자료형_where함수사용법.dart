// where를 사용하면 필터링이 가능함 굉장히 많이 쓰는 기능임 


void main(){
  
  // List 자료형 안에 Map 자료형 
 List<Map<String, String>> people = [
   {
     "name" : "로제",
     "group" : "블랙핑크",
   },
   {
     "name" : "지수",
     "group" : "블랙핑크",
   },
   {
     "name" : "RM",
     "group" : "BTS",
   },
   {
     "name" : "뷔",
     "group" : "BTS",
   }
 ];
 
  print(people);
  
  
  /* where함수 작동하는 방식은 map이랑 같음 이안에 함수를 넣을수 있음 
  안에 함수를 넣을수 있고 하나의 파라미터를 받음 
  그걸 일단 arrow 함수로 만들고 어떤 일이 생기냐면 리스트 안 각각의 원소들 
  즉 Map 자료형이 하나씩 들어가고 true 혹은 false 값을 골라줌 
  true가 나오는 것만 값유지 하고 false 는 값을 삭제함 
  */
  final blackPink = people.where((x) => x['group'] == "블랙핑크").toList();
  // 블랙핑크 그룹 값을 유지하고 싶으면 x는 Map 자료형이니까 키 값을 불러올수 있음 
  // 그 키 값이 블랙핑크 인것 즉 true을 리턴 하고 Iterable 자료형으로 값을 다 담아줌 
  // 이후 리스트형으로 변환해서 저장 가능함 
  // 참고로 기존리스트는 변경없이 새로 저장 되는 것임 
  
  final bts = people.where((x) => x['group'] == "BTS").toList();
  // bts 응용 
  
  print(blackPink);
  print(bts);
  
}
  

















                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      
                                      














