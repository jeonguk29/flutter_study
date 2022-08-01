import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // 파이어 스토어 쓰기 위한거

final firestore = FirebaseFirestore.instance;
// firestore 여기에 유용한 firestore 관련 유용한 함수들이 막 담겨있는거임


class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() async {
    try {
      var result = await firestore.collection('product')
          .doc('niLtviaD9KQksPhbcjvV')
          .get(); // 아까 product 라는 관계형으로 치면 테이블을 만들어 두었음 doc('') 이안에 document id 넣으면 됩니다.
      //print(result);// Instance of '_JsonDocumentSnapshot' 이렇게 뜨면 도큐먼트 하나 가져온거임
      print(result['name']);

      var result2 = await firestore.collection('product')
          .get(); // 이렇게 하면 모든 거큐먼트 가져올수 있음  리스트에 담아줌
      for (var doc in result2.docs) {
        //print(doc);  도큐먼트 2개 나옴
        print(doc['name']); // 이렇게 하면 각 도큐먼트에 name 필드 값이 나옴
      }

      // Firestore에 데이터 저장 하는법
      await firestore.collection('product').add({'name':'내복','price': 5000});  // 저장실패 체크하려면 try catch 사용하기

      // 쿼리 줘서 부합 데이터만 가져오기
     //await firestore.collection('product').where(field).get()//get() 하면 모든 데이터 다 가져오지만 .where(field) 하고 조건에 부합하는 것만 가져올수 있음
      // ex 가격이 7000원 이하인것만 , 날짜순으로 데이터 20개만 가져와 주세여 전문용어로 쿼리문


     // Firestore 데이터 삭제 요청
      await firestore.collection('product').doc().delete(); // doc 안에 id 넣으면 삭제 됨

      // Firestore 데이터 수정
      await firestore.collection('product').doc().update({'name':'ddd'}); // doc 안에 id 넣고 수정할값 넣으면 수정됨



    }catch (e) {    // 예외 처리 인터넷 접속 끊어지거나 값이 빌때 사용 언제나 중요한 에러처리
      print('에러남');
      print(e);//에러나면 메세지 출력
    }
  }

  void initState(){
    super.initState();  // 여기에는 await 키워드 못써서 함수로 만듬
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('샵 페이지임'),
    );
  }
}
