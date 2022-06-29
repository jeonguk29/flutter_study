void main()
{ 
 
  // for loop
 for(int i = 0; i < 10; i++){
   print(i);
 }
  
  print("-----------------------");
  
  int total = 0;
  List<int> numbers = [1,2,3,4,5,6];
  for(int i = 0; i < numbers.length; i++)
  {
    total += numbers[i];
  }
  print(total);
  
  total = 0;
  
  for(int number in numbers)
  {
    total += number;
  }
  print(total);
  
  
  print("-----------------------");
  //while loop
  total = 0;
  
  while(total < 10)  // 언제 까지 실행 할거냐 
  {
    total += 1;
  }
  
  print(total);
  
  print("-----------------------");
  //break 
   total = 0;
  
  while(total < 10)  // 언제 까지 실행 할거냐 
  {
    total += 1;
    
    if(total == 5)
    {
      break;
    }
  }
   print(total);
    total = 0;

  for(int i = 0; i < 10 ; i++)
  {
     total += i;
    if(i ==5)
    {
      break;
    }
  }
    
    print(total);
    total = 0;
  
  //continue;
   print("-----------------------");
   for(int i = 0; i < 10; i++){
   if(i==5)
   {
    continue; 
   }
    print(i);
 }
  
  
    
  
}