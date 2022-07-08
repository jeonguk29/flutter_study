void main()
{
  _Idol blackPink = _Idol( 
    "블랙핑크",     
    ['지수', '제니', '리사', '로제'],   

  );

  _Idol bts = _Idol.fromList([
        ['RM', '진', '슈가', '뷔', '정국'],
        "BTS",      
  ]);
  print(blackPink.firstMember);
  print(bts.firstMember);
  




  

}

// Private 속성 이 파일 외부에서 사용할수 없는 값들 이 파일을 import 해도 안딸려옴 

class _Idol{  // 이렇게 클래스 이름 앞에 _로해주면  Private 속성이됨
final String name ;             // final String _name  변수도 되고  함수도 다됨 
final List<String> members;      


_Idol(this.name, this.members);   



_Idol.fromList(List values)   
    : this.members = values[0], 
      this.name = values[1]; 

  

  void sayHello()                //  void _sayHello()
{
  print("안녕하세요 ${this.name}입니다.");
}

void introduce(){
  print("저희 멤버는 ${this.members}가 있습니다.");
}



String get firstMember{   
  return this.members[0];
}



  String GetFirstMember(){
    return this.members[0];
  }

}