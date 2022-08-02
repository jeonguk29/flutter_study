import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // 파이어 스토어 쓰기 위한거

import 'package:firebase_auth/firebase_auth.dart'; // 로그인 기능 사용시 필요
final auth = FirebaseAuth.instance; // 로그인 기능 짧게 사용하기 위해사

final firestore = FirebaseFirestore.instance;
// firestore 여기에 유용한 firestore 관련 유용한 함수들이 막 담겨있는거임


class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() async {
    try { // 유저 회원 가입 시키려면 이코드 필요
      var result = await auth.createUserWithEmailAndPassword( // uth.createUserWithEmailAndPassword 이 함수안에 유저 이메일, 비번 넣으면 가입끝남
        email: "kim@test.com", // 나중에 유저가 텍스트 필드 넣으면 될거임
        password: "123456",
      );
      result.user?.updateDisplayName('john'); // 유저 회원 가입시 이름도 넣고 싶으면 회원 가입후 추가하는 식으로 짜야함
    } catch (e) {
      print(e); // 가입 거절시 실행  (이메일 중복이거나 , 비번 짧거나)
    }
  }

  getData2() async{ // 유저 로그인시 이 코드사용 하면 됨
    try {
      await auth.signInWithEmailAndPassword( // signInWithEmailAndPassword( 여기에 유저 이메일 비먼 넣으면 로그인 시켜줄거임
          email: 'kim@test.com',
          password: '123456'
      );
    } catch (e) {
      print(e);
    }

    // 로그인 여부 판단 방법 코드
    if(auth.currentUser?.uid == null){  // auth.currentUser 출력하면 현재 유저 나옴  auth.currentUser?.displayName 같은거도 할수 있음
      print('로그인 안된 상태군요');
    } else {
      print('로그인 하셨네');
    }
  }

  getData3() async {
    await auth.signOut();// 이거 실행하면 로그아웃 됩니다.
  }


  /*

  로그인 기능 왜 추가하는 것임?



"그냥 다른 앱에 다 있으니까 나도 로그인 기능 만들어야지~" 라는 생각으로 개발하면 망하는 것임

로그인 기능을 어디에 쓰는지 잘 생각해봅시다.

로그인 기능은 지금 유저가 누군지 구분하려고 만드는 것입니다.



로그인 기능이 있으면

- 인스타그램 글을 발행하면 누가 발행하는 글인지 유저의 uid를 몰래 추가할 수 있음

- 그러면 나중에 내가 발행한 글만 모아볼 수 있고

- 글 수정 삭제할 때도 "현재 유저의 uid가 글에 저장된 uid와 일치하는지" 검사할 수도 있고

- 로그인시 유저가 남자인걸 기록해놓고 나중에 재방문하면 남자용 샵 상품들을 보내줄 수도 있고

- 싫어하는 유저의 uid가 있는 게시물은 안보이게 차단할 수 있고

- 친구가 발행한 게시물만 가져와서 보여줄 수 있고

그래서 사용하는 것입니다.

유저간 구분이 필요없으면 로그인기능 필요없습니다.


  */


  /*
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


   */
  void initState(){
    super.initState();  // 여기에는 await 키워드 못써서 함수로 만듬
    getData2();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('샵 페이지임'),
    );
  }
}
