class Person{ 
    late String? name;  // 맴버변수 나중에 초기화 해줄거라 late 붙이고
    late int? age;      // 널값을 가질수 있도록 ? 해줌 
    late String? sex;
    
    Person({this.name, this.age, this.sex}){
      // 생성자의 매개변수 개수가 5개 10개 30개면 어떻게 해야할까요
      // 그리고 그중 2개만 써야 할때는 어떨 까요?
      // 현재의 생성자는 매개변수가 3개면 3개다 입력을 해야 함
      // 이걸 해결하기 위해 만든것이 named argumenet 임 생성자 매개변수를 {}로 묶으면 됨  
      // 이제 매개변수는 선택 사항으로 바뀜 아에 인스턴스 만들때 값 입력 안해도 됨 

      }
    }
    
    int addNumber(int num1, int num2){ 
        return num1 + num2;

    
        
    }
    
    void main(){
    Person p1 =  Person(age:30);  // 이제 원하는 매개변수만 입력해도 되고 순서도 상관 없음 
    Person p2 =  Person(sex:'male');  // 타겟팅 해주는 스타일로 바뀜
    // 플러터 위젯에서 이렇게 쓰는게 이런 매개변수 값을 이용하는 거였음 
    // 지금까지 사용했던 모든 위젯들이 결국 클레스를 통해 생성된 인스턴스 였다는 것
    
    print(addNumber(3,4));
    print(p1.age);
    print(p2.sex);  
    
    }
    
    