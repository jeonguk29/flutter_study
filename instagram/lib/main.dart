import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.blue), // 이렇게 하면 아이콘 전부 블루색상 지정됨
          // 장점 : 이제 모든 아이콘은 파래짐 (인스타 그램 보면 색상 통일성 있음)
            //하지만 여기서 아이콘 스타일 줘 밨자 AppBar 안은 (아이콘)불가능
          appBarTheme: AppBarTheme(
              color: Colors.grey,
              actionsIconTheme: IconThemeData(color: Colors.blue)// ThemeData 사용시 특징 2 복잡한 위젯은 복잡한 위젯 theme()안에서 스타일 줘야할 수도
            // 그래서 아이콘 전체 위에 해줬지만 위젯은 나랑 가까운 스타일을 가장 먼저 적용하기 때문에 이렇게 한번 더 준거임
            // AppBar 안에 엑션 안에도 디폴트로 주라고
          ),

          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.red)
                /*
                bodyText2 이런걸 하나 결정해줘야하는데
                글자 위젯들은 이러한 당양한 스타일중 하나를 가져다 씀
                ex
                Text 위젯은 이 중에 bodyText2 스타일을 사용하고
                AppBar와 Dialog 위젯은 이 중에 headline6을 사용하고
                ListTile 위젯은 이 중에 subtitle1을 사용하고
                그런 식으로 정해져있습니다.  다 외우고 알필요 x

                 */
          ),
        ),// 스타일 모아 놓는 ThemeData()   css 파일 같은 것임
        home: MyApp()
    )
  );
}


var a = TextStyle(

);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(       // MaterialApp 밖으로 빼야 나중에 편해서 빼줄거임
      home: Scaffold(),
    );
    */

    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.star) // 위에서 전체 블루지정했는데 이놈은 하얀색임 ThemeData 사용시 특징1 : 위젯은 나랑 가까운 스타일을 가장 먼저 적용
        ],
      ), // 스타일 잘 넣는법  Text('sdf', style: ,) 이런식으로 스타일 넣으면 길어짐 따로 분리 할수 있음
      body: Column(
        children: [
          Icon(Icons.star),
          Text('안녕'),
          Text('안녕', style: a), // 하지만 TextTheme 사용하기 복잡하다 싶으면 변수로 빼서 사용할수도 있음 특히 글자에 경우 이렇게 사용하는게 더 편할거임
          // 전체 글자는 TextTheme 사용하고 세부 조정 변수로 할수도 있음
        ],
      )
       //Icon(Icons.star), // Icon(Icons.star, color: Colors.blue),

    );

  }
}
