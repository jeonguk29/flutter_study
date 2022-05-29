class Person{ // 우리가 클래스 만들때 생성자 만들지 않으면 dart가 기본 생성자를 만들게 됨 
    late String name; 
    late int age;
    late String sex;
    
    Person(String name, int age, String sex){// 생성자 만들기 함수랑 같은 모양을 가지고 있음
       // 이 3개의 입력을 꼭 입력 받아야함 그렇지 않으면 인스턴스 생성 안됨 
    this.name = name;
    this.age = age;
    this.sex = sex;
        // 매개변수로 입력받은 값을 맴버 변수안에 넣어 주어야함 
    }
    }
    
    int addNumber(int num1, int num2){ // 일반 함수 구현
        return num1 + num2;
      // addNumber 함수앞에 void 쓰면 에러남 아무것도 반환하지 않겠다는 뜻이라
    
        
    }
    
    void main(){
    Person p1 = new Person('Tom', 30, 'male'); // 생성자 매개변수랑 순서 일치해야함
    Person p2 = new Person('jane', 27, 'female'); // 생성자 매개변수랑 순서 일치해야함
    // 같은 클래스를 통해 생성된 인스턴스임  
    
    print(addNumber(3,4));
    print(p1.age);
    print(p2.age);  
    
    }
    
    