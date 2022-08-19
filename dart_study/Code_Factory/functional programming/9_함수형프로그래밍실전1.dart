
void main()
{
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
  
  // 클레스로 바꿔주는 방법 
  final parsedPeople = people.map(
  (x) => Person(
      name: x['name']!,// ! 없으면 오류가 남 Map 이기 때문에 
    // name , group값이 이 안에 존재하는지 확실하게 알수 없기 때문에 오류가남
    // 하지만 우리가 눈으로 봤을때 이 값이 확실하게 있다고 ! 로 알려주는 것임
      group: x['group']!, // 우리가 이 클레스로 바꿔주지 않으면 매번 쓸때마다 ! 해줘야하는데
    // 그러면  에러가 여기저기서 날수도 있음 
    ),
  ).toList();
  
  print(parsedPeople);  
}

class Person{
  final String name;
  final String group;
  
  Person({
    required this.name,
    required this.group,
  });
  

  /*
클레스를 출력하면 이렇게 나오는게 원래 클레스의 기본값이 인스턴스 오브 이렇게 나옴 
이걸 변경 하는 방법 toSting() 함수를 이용하면됨(override 사용해서) 기본으로 오브젝트 클레스에 제공되는 함수임
이 함수를 변경하게 되면 이 인스턴스 값들이 출력될때 어떤형태로 나올지 수정이 가능함 
  */
  @override
  String toString(){
    return "Person(name:$name, group:$group)";
  }
}