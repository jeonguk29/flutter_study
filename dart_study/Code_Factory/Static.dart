void main(){
  Employee seulgi = Employee('슬기');
  Employee chorong = Employee('초롱');

  seulgi.name = "코드팩토리";  // 이걸 인스턴스에 귀속된다고 함 

  seulgi.printNameAndBuilding();   
  chorong.printNameAndBuilding();  // 이 두값이 다름 
  // 같은 클레스 에서 인스턴스를 만들었는데 함수를 실행하거나 값을 가져오면 그 값은 각각 변수에 따라 다름
  // seulgi.name = "코드팩토리"; 한다고 해서 초롱이도 코드팩토리가 되지 않음 

   // 보면 인스턴스 만들지 않아도 바로 값을 넣을수 있음 
  Employee.buliding = '오투타워';
  seulgi.printNameAndBuilding();   
  chorong.printNameAndBuilding(); 
  // 슬기 초롱 둘다 빌딩 값이 '오투타워' 임 왜냐 클레스 자체에 다 귀속 되가 때문에 
  // 이런식으로  static 키워드를 사용해서 어느 변수를 클레스에 귀속 시킬수가 있음 

  Employee.printBuilding(); // 이게 static 메소드를 사용 하는 방법임 어디서근 사용 가능

}
class Employee{
  // static은 instance에 귀속 되지 않고 class에 귀속된다 

  // 알바생이 일하고 있는 건물
  static String? buliding; // ? 있으니 널이 들어 갈수도 있음 
  // 알바생 이름
  String name;

  Employee(
    this.name,
  );

  void printNameAndBuilding(){
    print("제 이름은 $name입니다.  $buliding 건물에서 근무하고 있습니다.");
  }

  static void printBuilding(){
    print('저는 $buliding 건물에서 근무중입니다.');
  }

}

/*
추가 정리 
인스턴스 귀속 : 인스턴스를 만든다음에 값을 변경하거나 실행 할수 있는거고
클레스 귀속 : .클래스명 이런식으로 클래스 에 값을 다이렉트로 바꿀수 있고 실행 할수 있음 


*/