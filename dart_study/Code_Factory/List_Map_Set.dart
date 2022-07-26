void main()
{ 
  //list
  List<String> blackpink = ["제니", "지수", "로제", "리사"]; 
  // <String> 제너릭 안에 어떤 타입을 넣을지 알려주는거  숫자 넣으면 에러 
  List<int> numbers =[1,2,3,4,5,6];
  
  print(blackpink);
  print(numbers);
  
  print(blackpink[0]);
  print(blackpink[1]);
  print(blackpink[2]);
  print(blackpink[3]);
    // print(blackpink[4]);  index 값 보다 높으면 오류 남 
  
  print(blackpink.length);
  blackpink.add('코드팩토리');
  print(blackpink);
  
  blackpink.remove('코드팩토리');
  print(blackpink);
  
  print(blackpink.indexOf('로제'));  // 인덱스 값 반환
  
  
  print("--------------------------");
  
  // Map
  // 리스트랑 다르게 key, value 값을 짝을 이뤄 값을 가짐 
  // 왼쪽이 항상 키 오른쪽이 값 언제나 키를 가지고 값을 찾음 
  
  
  Map<String, String> dictionary = {
    'Harry potter' : '해리포터',
    'Ron Weasley' : '론 위즐리',
    'Hermine Granger' : '헤르미온느 그레인저',
    
};
  
  print(dictionary);


  Map<String, bool> isHarryPotter = {
  'Harry potter' : true,
  'Ron Weasley' : true,
  'Ironman' : false,
};
  
  print(isHarryPotter);
  
  isHarryPotter.addAll({        // map 에 추가 하는것 하나 말고 여러개 입력해도 가능 
    'Spiderman' : false,
  });
  
  print(isHarryPotter);
  print(isHarryPotter['Ironman']);     // 키를 가지고 값 출력 해여함 
  
  isHarryPotter['woogie'] = false;  // 이렇게 임의적으로 값 추가하는 방법도 있음
 
  
  isHarryPotter['Spiderman'] = true;   // 이렇게 기존 값을 변환 하는 것도 가능 이미 있다면
 
  print(isHarryPotter);
    
  print("--------------------------");
  
  
  isHarryPotter.remove('Harry potter');   // 키값주면 벨류값이랑 같이 지워짐 
  print(isHarryPotter);
  
  print(isHarryPotter.keys);   // 키 전체 출력
  print(isHarryPotter.values);  // 벨류 전체 출력
  
  
  
  
  
  print("--------------------------");
  //Set  은 map 이랑 완전 비슷함 근데 키랑 벨류짝이 아니고 리스트 처럼 단일 값이 들어감 
  // 리스트는 중복 값이 들어 갈수 있고 set은 중복값 들어갈수 없음 자동으로 체크 해줌 
  
  final Set<String> names = {
    'Code Factory',
    'Flutter',
    'Black Pink',
    'Flutter',
  };
  
  print(names); //  'Flutter' 한번만 출력됨 
  names.add('woogie'); // 리스트와 거의 비슷한 함수들 존제 
  print(names); 
  
  names.remove('woogie');
  print(names);
  print(names.contains('Flutter'));  // 값이 이 set에 존재 하는지 아닌지 확인 bool형 반환 
  
  
  // set 과 list 가장 큰 차이는 중복된 값에 유무임 set은 절대 중복 값 허용 안하는걸 알고 가자 
  
  
}