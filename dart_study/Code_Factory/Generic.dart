void main(){
  //List<String> names = []; // 리스트 선언할때 했었음

// id 값 String 값으로 넣고 싶다면 이렇게  Generic  부분에 지정할 타입 값 넣을때 '123' 이렇게 문자로 보내주면됨
  Lecture<String> lecture1 = Lecture('123', 'lecture1');
  
  lecture1.printIdType();// 확인시 우리가 지정한거 처럼 id는 string 타입이 됨 


  Lecture<int> lecture2 = Lecture(123, 'lecture2');
  
  lecture2.printIdType();  // 이렇게 하면 int형이 나옴 
  
  // 즉 Generic은 type을 외부에서 변수처럼 받아서 사용할수 있도록 해주는 것임 
}

// Generic - 타입을 외부에서 받을때 사용 

class Lecture<T>{ // T말고 어떤 이름이던 상관 없음 
  final T id; // id의 자료형 즉 뭐가 될지 외부에서 선언할수 있음    가끔 이런게 필요한 상황이 있음 
  final String name;

  Lecture(this.id, this.name);

  void printIdType(){
    print(id.runtimeType);
  }


/*


Lecture<String, String> lecture1 = Lecture('123', 'lecture1');

class Lecture<T, X>{         이렇게 타입을 2개 넣을수도 있음 
  final T id; 
  final X name;
*/
}