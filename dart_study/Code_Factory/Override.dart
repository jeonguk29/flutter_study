void main() {
  TimesTwo tt = TimesTwo(2);
  print(tt.calculate());

  TimesTwo tf = TimesFour(2);
  print(tf.calculate());
  
}
//method - function (class 내부에 있는 함수)
// override - 덮어쓰다 (우선시 하다)

class TimesTwo{
  final int number;

  TimesTwo(
  this.number,  // 생성자 간단한 문법 바로 값을 this 클레스 안 number 변수로 바로 값 넣음 
  );

  int calculate(){
    return number *2;
  }
}

class TimesFour extends TimesTwo{
  TimesFour(
    int number  
  ) : super(number);

  @override  // 즉 매소드 덮으쓰는거임 
  int calculate(){
    return super.number * 4; 
    // 부모거에 * 4  결론적으로 생성자를 통해 값 을 부모에서 선언한 변수로 넣고 그 값에 *4로 만들어 준거임

    // super.calculate() * 2; 이런식으로도 작성 가능함 
  }
}