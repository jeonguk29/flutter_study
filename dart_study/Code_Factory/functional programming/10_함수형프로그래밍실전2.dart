void main(){
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
 

  // 클레스로 바꿔주는 방법 
  final parsedPeople = people.map(
  (x) => Person(
      name: x['name']!,
      group: x['group']!, 
    ),
  ).toList();
  
  print(parsedPeople);  
  
  
  // 파싱된 자료에서 BTS만 뽑기 where이용  \
  //클레스에 인스턴스로 반환된 결과에서  각 인스턴스 에서 그룹명이 BTS 인거만 추출 하여 저장 
  final bts =  parsedPeople.where(
    (x) => x.group == "BTS",
  );
  
  print(bts);
  
  
  
  // 함수형 프로그래밍 장점 함수 연동을 이용해서 위에 2단계를 1단계로 끝내버리기 
  final result = people.map(
  (x) => Person(
      name: x['name']!,
      group: x['group']!, 
    ),
  ).where((x) => x.group == "BTS")
    .fold<int>(
    0,
    (prev, next) => prev + next.name.length,
    );
  
  print(result);
  
  // .where((x) => x.group == "BTS"); 바로 where을 달아버림
  // 어짜피 Person으로 파싱이 다 되어 있는 상태라  즉 반환이 클레스 인스턴스로 될거니까 거기에 함수를 또 연동하는 것임
  // 결론적으로 이렇게 한번에 할수 있는 것임 

  // +  거기에 또 fold 함수 연동 함수의 결과의 함수의 결과의 함수의 결과를 리턴 하는 것임 
}

class Person{
  final String name;
  final String group;
  
  Person({
    required this.name,
    required this.group,
  });
  
  @override
  String toString(){
    return "Person(name:$name, group:$group)";
  }
}