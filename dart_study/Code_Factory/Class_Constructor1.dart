void main()
{
  Idol blackPink = Idol();
  // Idol blackPink = new Idol(); 다른언어에서는 new 넣어야 하는 경우가 많지만 dart에서는 넣으나 안넣으나 같음 

  print(blackPink.name);
  
  print(blackPink.members);
  

}

// Idol class
// name (이름) - 변수
// members (맴버들) - 변수
// sayHello (인사) - 함수
// introduce (맴버소개) - 함수
class Idol{
  String name = "블랙핑크";
  List<String> members = ['지수', '제니', '리사', '로제'];

  void sayHello()
{
  print("안녕하세요 블랙핑크입니다.");
}

void introduce(){
  print("저희 멤버는 지수, 제니, 리사, 로제가 있습니다.");
}

}