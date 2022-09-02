import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() async {
    var result = await fireStore.collection('user').doc('I5HCWVRwU9YpV8zFD3PS').get();
    print(result['uid']);
    print(result['name']);
  }

  // 데이터 뽑기
  void initState(){
    super.initState();
    //getData();
    setData();
  }


  // 데이터 저장
  setData() async {
    try {
      await fireStore.collection('user').add({'name': '우기', 'uid': "qwer1234"});
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('샵페이지임!!'),
    );
  }
}
