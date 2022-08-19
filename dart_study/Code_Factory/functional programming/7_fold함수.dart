void main(){
  // Fold 함수 
  /*
   reduce 의 단점 같은 타입을 리턴하는 것을 보안 한것임
   fold 함수도 두개의 파라미터를 가짐 
   fold 함수는 리턴할값을 지정할수가 있음 어떤 값이 리턴될거지 정해줘야함 
   
   */
  List<int> numbers = [1,3,5,7,9];
  final sum = numbers.fold<int>(0, (prev, next) => prev + next);
  print(sum);
  
  
  
  // 분석 
  final sum2 = numbers.fold<int>(0, (prev, next) {
    print("---------------");
    print("previous : $prev");
    print("next : $next");
    print("total : ${prev + next}");
    
    return prev + next;
    });
  
  /*
   reduce는 첫번째 숫자가 즉 첫번째 원소가 prev 여기 들어갔었음 
   하지만 fold 는 첫번째 파라미터로 첫번째 시작할값을 넣어줘야함 
   ex 여기서는 0을 줌 그러면 처음에 prev에 0이 들어가면서 시작함 
   
   그다음 부터는 prev에 리턴으로 정의한 값이 들어가고 next 는 계속 다음 값이 들어감 
   처음만 다르고 이후 방식은 reduce랑 똑같은 방식으로 진행됨 
    
    유일한 차이는 첫번째 값이 prev 두번째 값이 next에 들어가는게 아니고
    첫번째 값이 지정한값 next에 첫번째 값이 들어가고 그다음부터 reduce랑 똑같이 진행됨
   */
  
  print(sum2);
  
  
  
  
  
  List<String> words = [
    "안녕하세요 ",
    "저는 ",
    "코드팩토리입니다.",
  ];
  
  final sentence = words.fold<String>("", (prev, next) => prev + next);
  print(sentence);
  
  
  // 이렇게 특징은 반환값을 지정할수가 있음 
  final count = words.fold<int>(0, (prev, next) => prev + next.length);
  print(count);
}

