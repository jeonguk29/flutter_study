import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      // 보통 앱만들때 이렇게 마테리얼 앱을 밖으로 빼줌
      home: MyApp() // 이렇게 해도 레이아웃 똑같음 마테리얼 안에 MyApp 즉 Scaffold가 들어가는 것임
      ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = "연락처앱";
  var name2 = ["김영숙", "홍길동", "피자집"];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(a.toString()),
        onPressed: () {
          showDialog(
              barrierDismissible: false, //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
              context: context,
              builder: (context) {

                return Dialog(
                    child: Container(
                      height: 200, width: 350,
                      //padding: EdgeInsets.all(10),

                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(30),
                            child: Text("Contact",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: 320,
                            padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
                            child:
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Hint',
                              )
                            ),  // 사용자 텍스트 입력
                          ),


                          Container(
                            padding: const  EdgeInsets.fromLTRB(30, 0, 20, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context); //열려있는 Dialog를 닫는 부분입니다.
                                }, child: Text("Cansel")),

                                TextButton(onPressed: (){
                                  Navigator.pop(context); // 열려있는 Dialog를 닫는 부분입니다.
                                }, child: Text("OK")),
                              ],
                            ),
                          )



                        ],
                      ),

                    ));
              });
        },
      ),
      appBar: AppBar(
        title: Text(name),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ],
      ),
      bottomNavigationBar: Botoom_Main(),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Image.asset('koko1.png'),
            title: Text(name2[i]),
          );
        },
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 여기 context는 무슨 정보 Scaffold  + 그리고 Scaffold의 부모인 마테리얼 앱 같은게 있을것임
    return Container();
  }
}

class Botoom_Main extends StatelessWidget {
  const Botoom_Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, //색상
      child: Container(
        height: 70,
        padding: EdgeInsets.only(bottom: 10, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.call),
            Icon(Icons.message),
            Icon(Icons.contacts),
          ],
        ),
      ),
    );
  }
}
