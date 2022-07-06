void main()
{
  Idol blackPink = const Idol( 
    "블랙핑크",     // const 는 빌스 타임에 값을 알수있어야 하느데 지금 다 알수 있음 
    ['지수', '제니', '리사', '로제'],    // 그리고 const 생성자에는 const 변수만 (빌드 타임값을 알수 있는) 넣을수 있음 
    // 이전시간에 배운 DateTime.now().toString(), 이렇게 해도 못 사용 한다는 뜻 
  );
  // 즉 요약하면 const로 선언할수 있는 변수들로 구성된 생성자 매개변수들은  사용 했을때 const 생성자로 인스턴스를 만들수 있다
  // 플러터사용시 효율을 올려줌




// 인스턴스를 생성하면 하나의 메모리에

  Idol blackPink2 = const Idol( 
    "블랙핑크",    
    ['지수', '제니', '리사', '로제'],    
  );

  print("----------------");
  print(blackPink == blackPink2);  

  Idol blackPink3 = Idol( 
    "블랙핑크",    
    ['지수', '제니', '리사', '로제'],    
  );

    Idol blackPink4 = Idol( 
    "블랙핑크",    
    ['지수', '제니', '리사', '로제'],    
  );

  print("----------------");
  print(blackPink3 == blackPink4);


 // blackPink.name = "코드팩토리";  // 이렇게 이름을 변경 가능한데 
// 개발자들은 이러한 상황을 선호하지 않음 처음 선언한 값을 절대로 변경할수 없도록 함  그래서 아래 클레스 변수에 final을 넣음
// 변경할거면 새로 생성하도록 함

  print(blackPink.name);
  print(blackPink.members);
  blackPink.sayHello();
  blackPink.introduce();


    Idol BTS = Idol.fromList(  
      [
        ['RM', '진', '슈가', '뷔', '정국'],
        "BTS",      
      ]
    );


  print(BTS.name);
  print(BTS.members);
  BTS.sayHello();
  BTS.introduce();



  

}

// Idol class
// name (이름) - 변수
// members (맴버들) - 변수
// sayHello (인사) - 함수
// introduce (맴버소개) - 함수

// immutable 프로그래밍 : 요즘 많이 사용하는데 한번 값들을 선언 하면 값을 바꿀수 없도록 코딩함 

class Idol{
final String name ;                 // final 은 한번 선언되면 절대 값 변경 불가능임 
final List<String> members;

// 우리 개발자들은 클래스 변수를 만들때 몇몇 상황을 제외하고 final을 쓰는 습관을 들여야함 

const Idol(this.name, this.members);  // const 생성자로 만들수도 있음 const 생성자 사용하면 한번 선언시 값 변경이 불가능하게 됨 
// const 생성자 장점은 const 생성자로 사용해도 되고 그냥 const 없이 기본 생성자로 사용해도 됨 즉 둘다 가능함 
// 단 위에 인스턴스 만들때도 const 넣어줘야함 

// 네임드 생성자 

Idol.fromList(List values)   
    : this.members = values[0], 
      this.name = values[1]; 

  

  void sayHello()
{
  print("안녕하세요 ${this.name}입니다.");
}

void introduce(){
  print("저희 멤버는 ${this.members}가 있습니다.");
}

}