class Person{
String name = "woogie"; 
// dart는 타입 추론 기능이 있어서 자료형 안쓰고 var 붙이면 
// 알아서 변수가 자료형 추론해서 이해함
late int age;
late String sex;
}

void main(){
  Person p1 = new Person(); // 자바랑 비슷 함 
  p1.age = 30;  //  Person 클래스로 만들어진 p1 인스턴스는 age라는 변수값이 30을 가지게됨 
  print(p1.age);
}