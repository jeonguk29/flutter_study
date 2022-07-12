// 왜 클레스를 사용하여 코딩 하는걸 oop 라고 하는가?


// Object Oriented Programming
// 객체지향 프로그래밍            



void main(){

  Test test = Test();

  //test.  
  /*
  아래 클레스에서 아무것도 선언 하지 않았는데도 이미 4개의 속성이 존재하고 있음 

  */

}
class Test extends Object{} //  => class Test{}

/*

class Test{} 와 위 코드는 완전 동일 한것임 왜냐 
모든 class는 선언하자마자  extends Object 부분을 생략 하기 때문임 
모든 class는 Object를 상속받음 

그래서 모든 class의 최상위 부모는 Object 임  
그리고 이 Object 라는 클래스에서 제공해주는 기능들이 아무것도 하지 않았을때 제공 해주는 4가지 기능임


정리 모든 클레스들이 최상위에서 Object 라는 클래스를 상속 받고 있기 때문에 객체지향 프로그래밍 이라고 부르게 되는것임 
*/