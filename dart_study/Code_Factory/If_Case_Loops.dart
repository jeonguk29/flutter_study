void main()
{ 
  int number = 3;
  if(number % 3 == 0)
  {
    print('나머지가 0입니다');
  }
  else if(number % 3 == 1)
  {
    print("나머지가 1입니다.");
  }
  else
  {
    print('나머지가 2입니다.');
  }
 
  
  int number2 = 2;
  switch(number2 % 3){
    case 0:
      print('나머지가 0입니다.');
      break;   // case 문은 break를 넣어줘야함 
    
    case 1:
      print('나머지가 1입니다.');
      break;
    
    default:   //else 와 같은거 해당 하는게 없다면 마지막은 여기임 
      print('나머지가 2입니다.');
      break;
      
  }
  
  
  
}