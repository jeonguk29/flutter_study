void main(){
  // reduce 함수 
  List<int> numbers = [1,3,5,7,9];
  
  final result = numbers.reduce((prev, next) {
    print("-----------------------"); 
    print("previous : $prev");
    print("next : $next");
    print("total : ${prev + next}");
    return prev + next;
  });
  print(result);
  
  /*
   reduce 에는 똑같이 함수가 들어감 단 map 함수랑 다르게 파라미터 2개 들어감
   맨처음에 만 prev, next 에 원소에 첫번째, 두번째 값이 들어감 
   
   그다음 prev 값에는 return으로 정의한 값이 들어감 즉 4가 들어감
   그다음 4랑 5랑 더한 9가 prev 값으로 들어감 
   그래서 계속 돌다가 종적으로 25를 리턴 하게 됨 
   
   정리하면 prev는 처음에만 원래 원소값이 들어가고 그다음부터는 리턴으로 정의한 값
   next는 계속 다음원소의 값이 들어감 
   
   */
  
  // 이렇게 => arrow 함수로 만들수 있음
  final result2 = numbers.reduce((prev, next) => prev + next);
  print(result2);
  
  
  
  // 글자 합치기 
  List<String> words = [
    "안녕하세요",
    "저는 ",
    "코드팩토리입니다.",
  ];
  
  final sentence = words.reduce((prev, next) => prev + next);
  print(sentence);
  
  /* reduce 가 절대적으로 지켜야 하는 법칙 
   List<int> numbers
   List<String> words
   반환값이 기존에 선언할때 정의한 값 즉 int면 int String이면 String으로 반환되어야함
   
   아래와 같이 처음에 선언할때 String이지만 반환값이 int라 오류가 남  
    
    즉 reduce를 실행하는 멤버들의 타입과 반환하려는 타입이 같아야함 
  */
  //words.reduce((prev, next) => prev.length + next.length)
  
  
}