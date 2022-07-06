void main()
{
  Idol blackPink = Idol( 
    "블랙핑크",     
    ['지수', '제니', '리사', '로제'],   

  );

  Idol bts = Idol.fromList([
        ['RM', '진', '슈가', '뷔', '정국'],
        "BTS",      
  ]);
  print(blackPink.firstMember);
  print(bts.firstMember);
  
  blackPink.firstMember = "코드팩토리";
  bts.firstMember = "woogie";

  print(blackPink.firstMember);
  print(bts.firstMember);

  //의문 1 왜  Getter 를 사용하는가?
  print(blackPink.GetFirstMember()); // Getter  와 똑같은 기능을 수행하는 함수임

  // 둘이 솔직히 기능적인 차이는 없다고 봐도 됨 
  // 뉘앙스에 차인데  Getter 는 데이터를 간단하게 가공할때 사용하고 ex 첫번째 값만 가져온다던지 
  // 함수는 로직이 많이 들어갈때 사용 
  // 어떤 상황에서 겟터 쓰고 어떤 상황에서 함수를 쓰고 정해진건 없음   :개발하면서 자연스럽게 느낄수 있음


  

}

//  Getter and Setter


class Idol{  // Setter 사용 위해 final 과 const 지움 
String name ;                
List<String> members;      


Idol(this.name, this.members);   


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



// getter
String get firstMember{   
  return this.members[0];
}

//setter                setter는 무조건 하나의 파라미터만 들어갈수 있음
set firstMember(String name){
  this.members[0] = name;
}


// getter 와 기능이 똑같은 함수 
  String GetFirstMember(){
    return this.members[0];
  }

}