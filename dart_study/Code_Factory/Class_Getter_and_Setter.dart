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
  




  

}

//  Getter and Setter


class Idol{ 
final String name ;                //의문 2  immutable 프로그래밍 많이 해서 final 키워드 많이 넣는다고 했는데 
final List<String> members;      


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

//setter                

/*
set firstMember(String name){
  this.members[0] = name;                                           // final 키워드를 쓰면 이 값 변경 불가능임 
  // 지금은 가능함 List는 final이어도 값 변경 가능함 dart : List 특징임 
}


set firstMember(List<String> members){
  this.members = members;              // 하지만 이렇게 리스트를 받아서 아에 members를 바꾸는건 못함 

}
*/
// 사실상 immutable 프로그래밍  할때는 setter가 쓸모 없어지는것임 실제 그런이유 때문에 현대 프로그래밍에서는 셋터 잘 사용안함
// setter를 쓰게 되면 원래 의도했던 값을 못바꾸게 하려는 원래 의도에서 어긋나기 때문임 



// getter 와 기능이 똑같은 함수 
  String GetFirstMember(){
    return this.members[0];
  }

}