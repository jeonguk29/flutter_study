void main()
{
  Idol blackPink = Idol(
    "블랙핑크",
    ['지수', '제니', '리사', '로제'],
  );
  // Idol blackPink = new Idol(); 다른언어에서는 new 넣어야 하는 경우가 많지만 dart에서는 넣으나 안넣으나 같음 

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();

  Idol BTS = Idol(
    "BTS",
    ['RM', '진', '슈가', '뷔', '정국'],  // 생성자 타입에 들어가는 순서에 맞춰서넣어야함 안그러면 오류남 

  );
  print(BTS.name);
  print(BTS.members);
  BTS.sayHello();
  BTS.introduce();

    Idol BTS2 = Idol.fromList(  // 네임드 생성자 이용시 지정한 // 네임드 생성자 이름 안에 넣어주면 됨 
      [
        ['RM2', '진2', '슈가2', '뷔2', '정국2'],
        "BTS2",      
      ]
    );

    // 즉 이렇게 하면 어떤 생성자를 사용하던 인스턴스를 만들수 있고, 아무거나 하나 선택에서 인스턴스를 만들수 있는것임 

  print(BTS2.name);
  print(BTS2.members);
  BTS2.sayHello();
  BTS2.introduce();


    // 생성자 타입에 들어가는 순서에 맞춰서넣어야함 안그러면 오류남 

  

}

// Idol class
// name (이름) - 변수
// members (맴버들) - 변수
// sayHello (인사) - 함수
// introduce (맴버소개) - 함수
class Idol{
  String name ;
  List<String> members;
/*
  Idol(String name, List<String> members)  // 이렇게 생성자를 만들수 있음 this가 붙은건 현제 클래스에 있는 변수들이고 안붙은건 매개변수로 받은 애들임 
  : this.name =  name,
    this.members = members;
*/
// 대부분 생성자들은 외부 매개변수 값을 받아 저장 하는 역할을 90% 용도로 사용하기 때문에 엄청 간단하게 작성할수 있는 문법이 있음
Idol(this.name, this.members); // 이렇게 사용하는걸 기본 생성자라고함 

// 네임드 생성자 

Idol.fromList(List values)   // fromList 원하는 이름 넣고 
    : this.members = values[0], // 첫번째는 맴버이름
      this.name = values[1];   // 두번째는 그룹 이름 사용하겠다 

  

  void sayHello()
{
  print("안녕하세요 ${this.name}입니다.");
}

void introduce(){
  print("저희 멤버는 ${this.members}가 있습니다.");
}

}