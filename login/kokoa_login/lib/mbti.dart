import 'package:flutter/material.dart';
import "package:flutter/cupertino.dart";

class Mbtisave extends StatelessWidget {
  const Mbtisave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Mbtiinput(),
    );
  }
}

class Mbtiinput extends StatefulWidget {
  const Mbtiinput({Key? key}) : super(key: key);

  @override
  State<Mbtiinput> createState() => _MbtiinputState();
}

class _MbtiinputState extends State<Mbtiinput> {
  var _isOn = false;


  List<String> colorItem = [
    "ENFJ",
    "ENTJ",
    "ENFP",
    "ENTP",
    "ESFP",
    "ESFJ",
    "ESTP",
    "ESTJ",
    "INFP",
    "INFJ",
    "INTP",
    "ISTP",
    "ISFP",
    "ISFJ",
    "ISTJ",
    "INTJ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        // material AppBar에 대응
        middle: Text('쿠퍼티노 디자인'), // material AppBar의 title 에 대응
      ),
      body: Center(
        child: Column(
          children: [
            CupertinoSwitch(
              // material 의 Switch
                value: _isOn,
                onChanged: (bool value) {
                  setState(() {
                    _isOn = value;
                  });
                }),
            CupertinoButton(
              // ElevatedButton 에 대응
              child: const Text('쿠퍼티노 AlertDialog'),
              borderRadius: BorderRadius.circular(16.0),
              onPressed: () {
                _showCupertinoDialog();
              },
            ),
            CupertinoButton(
              child: const Text('쿠퍼티노 Picker'),
              onPressed: () {
                _showCupertinoPicker();
              },
            ),
          ],
        ),
      ),
    );
  }

  _showCupertinoDialog() {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('제목'),
        content: const Text('내용'),
        actions: [
          const CupertinoDialogAction(
            child: Text('Cancel'),
          ),
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // 다이얼로그 닫기
            },
          )
        ],
      ),
    );
  }

  // Future 사용을 위해 async 사용
  _showCupertinoPicker() async {

    var colorString;
    // showCupertinoModalPopup() 함수는 Future 타입을 반환하기 때문에 await 피커가 닫힐때까지 대기한 후, result 변수의 값을 출력합니다.
    await showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 200.0,
        child: CupertinoPicker(
            itemExtent: 75,
            onSelectedItemChanged: (i) {
              setState(() {
                colorString = colorItem[i];
              });
            },
            children: [
              ...colorItem.map((e) => Text(e,style: TextStyle(color: Colors.black, fontSize: 28)))
            ]),
      ),
    );
  }
}
