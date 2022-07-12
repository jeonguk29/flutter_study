void main(){
  BoyGroup bts = new BoyGroup('BTS');
  GirlGroup redvelvet = GirlGroup('레드벨벳');

  bts.sayName();
  redvelvet.sayName();

  print(bts is IdolInterface);
  print(bts is BoyGroup);
  print(bts is GirlGroup);  // 상속 이랑 똑같은 결과가 나옴 

  print(redvelvet is IdolInterface);
  print(redvelvet is BoyGroup);
  print(redvelvet is GirlGroup); 

}
// Interface
// 다른 언어에서는 Interface 키워드가 있는 경우가 많은데 dart에서는 class 라는 키워드를 사용함

abstract class IdolInterface {
  String name;     // 실제 인터페이스를 만들때 사용하려는게 아니고 다른 클레스를 만들때 
                    // IdolInterface 를 사용해서 이 선언되어있는 형태를 지킬수 있도록 사용할거임 
  IdolInterface(this.name);
/*
  //IdolInterface test = IdolInterface('블랙핑크');
  //이렇게 인스턴스로 만들 용도가 아닌데 이런식으로 해버리면 문제가 됨 
  // 그래서 인스턴스 앞에 abstract(추상적)를 넣으면 인스턴스 생성 불가능 함  
*/
  void sayName(); // {} abstract 해주면 이렇게 함수 body 지우는게 가능 어쩌피 인스턴스로 못만들어서
  // 어떤 형태인지 선언만 해주면 됨 

  // 즉 abstract  있으면 인스턴스로 만들지 마라 라는 뜻 
  
}

class BoyGroup implements IdolInterface // extends 는 상속이고 implements는 인터페이스 사용 하겠다는것임
{
   // 처음 만들때 빨간줄이 뜨는데 인터페이스에서 정의한걸 똑같이 사용해주어야 사라짐 일종에 강제성을 부여하는거임
  String name;

  BoyGroup(this.name);
  
  @override
  void sayName() {
    print("제이름은 $name입니다.");  // 여기서는 정의 가능 
  }   

}

class GirlGroup implements IdolInterface{

  String name;
  GirlGroup(this.name);
  
  @override
  void sayName() {
    print("제이름은 $name입니다.");  // 여기서는 정의 가능 
  }  

}

/*
상속은 : 속성과 기능들을 물려주기 위해서 
인터페이스 : 특수한 구조를 강제 하는 것을 말함 



*/