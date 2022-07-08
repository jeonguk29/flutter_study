void main()
{
  print('--------Idol---------');
  Idol apink = Idol(name: "에이핑크", membersCount: 5);

  apink.sayname();
  apink.sayMembersCount();


  print('--------BTs---------');
  BoyGroup bts =BoyGroup("bts", 7); // 이렇게 넘겨줘도   BoyGroup 에는 아무 값도 없지만  Idol 클래스를 상속받아 모든걸 사용가능함
  bts.sayMembersCount();
  bts.sayname();  // 이렇게 하면 사실상 부모에 있는 걸 접근해서 그대로 쓰는 거임 
}

// 상속 inheritance
// 상속을 받으면 부모 클래스의 모든 속성을 
// 자식 클래스가 부여 받는다. 


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
}