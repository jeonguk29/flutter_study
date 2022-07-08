void main()
{
  print('--------Idol---------');
  Idol apink = Idol(name: "에이핑크", membersCount: 5);

  apink.sayname();
  apink.sayMembersCount();
  //apink.sayMale();  불가능 부모에서 자식거는 사용 못함 


  print('--------Boy Grouo---------');
  BoyGroup bts =BoyGroup("bts", 7); 
  bts.sayMembersCount();
  bts.sayname();  
  bts.sayMale();
  //bts..sayFemale();  사용못함 걸그룹에만 있고 그냥 공통점은 Idol 클래스를 상속 받는거 뿐 관계가 없음 

  print('--------Girl Group---------');
  GirlGroup redvelvet = GirlGroup("Red velvet", 5); 
  redvelvet.sayMembersCount();
  redvelvet.sayname();  
  redvelvet.sayFemale();



print('---------Type Comperison------------');
print(apink is Idol);
print(apink is BoyGroup);
print(apink is GirlGroup);


print('---------Type Comperison------------');
print(bts is Idol);
print(bts is BoyGroup);   // 상속시 자식클레스는 자식 클레스 뿐만아니하 부모 클레스도 될수 있음 
print(bts is GirlGroup);

print('---------Type Comperison------------');
print(redvelvet is Idol);
print(redvelvet is BoyGroup);   // 상속시 자식클레스는 자식 클레스 뿐만아니하 부모 클레스도 될수 있음 
print(redvelvet is GirlGroup);


// 부모 클레슨 자식 클레스가 되지 못하지만 부모 클레스의 인스턴스인 bts ,redvelvet 부모클레스, 자식 클레스 (자기자신)됨 
}
/*

정리 : 상속을 하면 부모클레스와 자식클래스가 생기고 부모클레스의 속성들이 자식클레스로 다 넘어간다 
자식 클레스 속성들은 부모클레스 넘어가지 않는다 그리고 같은 자식 클레스 끼리도 속성공유를 하지 않는다.

*/





class Idol{
  // 이름
  String name;
  // 멤버 숫자
  int membersCount;
  
  Idol({
    required this.name,
    required this.membersCount,
  });
  
  void sayname(){
    print('저는 ${this.name}입니다.');
  }

  void sayMembersCount(){
    print('${this.name}은 ${this.membersCount}명의 멤버가 있습니다');
  }


}


class BoyGroup extends Idol{  // extends 부모클레스  : 상속 받겠다 
  BoyGroup(// 생성자에서 아래와 같은 맴버 변수를 받고 
    String name,    
    int membersCount,  
  ) : super(name : name,  // super 키워드로 Idol 클래스에 생성자로 전송함     그냥 그대로 받은거 부모로 전달임 
            membersCount : membersCount,    // 그러면 부모클래스는 자동으로 생김  그럼 부모는 자동으로 BTS 7 값을 가지고 생성됨 
          
          );
  
  void sayMale()
  {
    print("저희는 남자 아이돌입니다.");
  }
}

class GirlGroup extends Idol{  // extends 부모클레스  : 상속 받겠다 
  GirlGroup(// 생성자에서 아래와 같은 맴버 변수를 받고 
    String name,    
    int membersCount,  
  ) : super(name : name,  // super 키워드로 Idol 클래스에 생성자로 전송함     그냥 그대로 받은거 부모로 전달임 
            membersCount : membersCount,    // 그러면 부모클래스는 자동으로 생김  그럼 부모는 자동으로 BTS 7 값을 가지고 생성됨 
          
          );
  
  void sayFemale()
  {
    print("저희는 여자 아이돌입니다.");
  }
}