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
    await firestore.collection('product').get(); // document들 전부 가져오는 코드

    /*

    Firestore에 데이터를 넣을 때 서버를 안거치고 직접 넣다보니

데이터가 더럽거나 개나소나 입출력하거나 그런 점들이 나중에 문제될 수 있습니다.

그래서 데이터입출력시 엄격하게 규칙을 정할 수 있는데

Firebase Console로 가서 Firestore 규칙란을 펼쳐보면 됩니다.











이렇게 되어있는데 여기서

1. 어떤 document 에

2. 누가 어떤 내용을 read, write 할 수 있는지 if문으로 조건을 정할 수 있습니다.

그럼 대부분의 보안 문제는 해결됩니다.











규칙 새로 만드는 법



match 경로 {
  allow read : if 규칙
}
이런 문법으로 작성해주면 됩니다.

document 읽을 때 규칙은 read

document 추가 규칙은 create

수정규칙은 update

삭제규칙은 delete

키워드 적어주시면 되고

경로란엔 컬렉션과 document 경로를 적으면 됩니다.









예를 들어서 product라는 컬렉션의 모든 document 읽기접근권한을 정하고 싶으면

match /product/{docid} {
  allow read : if 규칙
}
이런 문법으로 작성해주면 됩니다.

{} 이건 모든 문서~ 를 뜻하는 키워드인데 그 안에는 자유롭게 아무거나 변수명 작명해주시면 됩니다.

작명한 변수는 document를 가리킵니다.











로그인된 유저 검사하는 법



예를 들어서 로그인한 유저들만

product 컬렉션의 {document}를 read할 수 있게 코드를 짜고 싶습니까



match /product/{docid} {
  allow read : if request.auth != null;
}
이러면 되는데

if문 안에서 request라고 쓰면 현재 Firestore 데이터베이스에 접근요청하는 유저의 정보를 출력해볼 수 있습니다.

그 중에 점찍고 .auth라고 쓰면 유저의 로그인정보가 나옵니다.

여기 안엔 유저의 uid 이런 것도 있고 그런데 그게 null인지 아닌지 확인하라고 코드를 짰을 뿐입니다.

이제 로그인한 사람만 product 게시물을 가져올 수 있습니다.

진짠지 확인해보셈















내 게시물만 수정하고 싶으면







- 지금 유저들이 product 컬렉션에 document를 발행할 수 있게 만들어놓고

- 글 발행한 사람의 uid도 who 필드에 기록해놨다고 합시다.





Q. 일단 document를 수정하는 법은



firestore.collection('product').doc('문서id').update({'name' : '내복2'});
이러면 된다고 하는군요.

근데 이 코드를 실행하면 개나소나 수정이 가능하기 때문에

"내 uid가 문서에 기록된 who 항목이랑 같으면 수정하게 해주세요~" 라고 제한을 두는게 좋겠습니다.



if문 쓰면 될까요?

되긴 되겠지만 앱에 있는 코드는 언제나 악성유저가 위조할 수 있어서 언제나 백엔드에서 검사하는게 좋습니다.

그러고 싶으면 규칙란 가서 "수정요청하는 사람의 uid"를 검사하라고 설정하면 됩니다.







match /product/{docid} {
  allow read : if request.auth != null;
  allow update : if 수정요청하는사람uid == 게시물에저장된uid
}
이런 식으로 작성해주면 됩니다.





match /product/{docid} {
  allow read : if request.auth != null;
  allow update : if request.auth.uid == resource.data.who;
}
코드로 번역하면 이렇습니다.

request.auth는 서버측에서 지금 로그인된 사용자의 정보를 출력해볼 수 있고

resource.data는 지금 읽으려는 document의 내용을 출력해볼 수 있습니다.

그래서 두개 같은지 비교하고 같으면 읽게 해달라고 코드짜놓으면 안심할 수 있는 것임





이거 말고도 많은 것들을 검사할 수 있습니다.

- 공백검사하기

- 문서만들 때 필드 하나 빼먹은거 있는지 검사하기

- 정규식으로 특정 문자가 포함되어있는지 검사하기

- 실수로 숫자로 보내면 문자타입으로 변환해주기

- 문자길이 검사하기

- 문자 앞뒤 공백제거하기

- 시간 위조되었는지 검사



어떤 규칙을 추가해야 안전할지 생각하기 어려우면

1. 직접 악성유저가 되어서 생각해보면 되고

2. 님들 앱에 작성된 모든 코드는 위조할 수 있다는 점도 생각해보면 됩니다.













유용한 함수들



request에는 method, time, query, resource, auth 등 document 접근원하는 사람에 대한 정보들이 담겨있고

resource에는 지금 접근원하는 document의 정보가 들어있습니다.

resource.data하면 지금 다루려는 문서의 내용이 출력되는데

여기에 여러 함수들을 붙일 수 있습니다.



.size() 이러면 길이를 출력해줍니다.

.matches(정규식) 이러면 정규식으로 해당문자를 검사해줍니다.

string() 안에 넣으면 문자로 변환해줍니다.

int() 안에 넣으면 정수로 변환해줍니다.

이런걸로 데이터 validation이 전부 가능합니다.



자주쓰는건 함수로 만들어놓기도 합니다. rules 편집란에서 함수만들어쓰는거 제약없음















접근 방법은 총 5개가 있는데



allow get : if 어쩌구
allow list : if 어쩌구
get은 딱 하나의 document,

list는 collection 안의 document들을 접근할 때

이렇게 따로도 규칙을 지정가능합니다.

두개 싸잡아서 allow read 라고 표현할 수 있습니다.





allow create : if 어쩌구
allow update : if 어쩌구
allow delete : if 어쩌구
create는 새로운 게시물 추가

update는 수정

delete는 삭제

이럴 때 규칙을 따로 지정가능합니다.

세개 싸잡아서 allow write 라고 표현할 수 있습니다.





match /product/{docid} {
  allow read : if true;
  allow create : if request.auth != null;
  allow update : if request.auth.uid == resource.data.uid;
}
그래서 심심해서 create는 로그인한 사람만 할 수 있게 바꿔봤습니다.






별표두개 입력하면 뺑뺑이 돌려줌



match /{document=**} {
  allow read : if true
}
기본으로 입력되어있는 경로입니다.

{} 이건 안의 모든 문서를 뜻한다고 했는데 (여기서는 모든 collection이기도 하겠네요)

근데 작명할 때 =** 이걸 뒤에 붙여주면 recursive라는 뜻이되어

하위경로까지 전부 계속 이걸 적용해주라는 뜻입니다.

그래서 저 경로는 모든 컬렉션과 파일을 의미한다고 보시면 되겠습니다.

하위경로까지 전부 설정이 필요하면 =** 이걸 붙여보십시오.













(주의) 규칙 중복발생시



막 짜다보면 가끔 규칙에 중복이 발생합니다.



match /product/{docid} {
  allow read : if true;
}

match /product/{docid} {
  allow read : if false;
}
규칙을 이렇게 만들어놨다고 칩시다.

/product안에 document 하나를 read 하고싶은 경우

규칙 2개가 둘다 발동되어서 서로 상충하고 있군요.

이럴 경우 이것만 알면 됩니다



"규칙에서 중복이 발생하면 항상 관대하게 적용함"

그래서 적어도 하나의 규칙이 허락해준다고 하면 무조건 허락해줍니다.

(그래서 위의 규칙은 누구나 read가 가능한 규칙입니다.)





규칙 테스트하는게 귀찮으면 왼쪽에 보면 규칙 플레이그라운드라는 메뉴가 있는데

거기서 규칙이 잘 만들어져있는지 테스트해보는게 훨씬 빠르고 간편할 수 있습니다.

rules 문법에 대해 더 알아보고 싶으면 https://firebase.google.com/docs/rules/basics 이걸 참고합니다.

또는 구글 검색이 가장 빠름











더 다양하게 규칙을 두고 싶으면

Firebase Functions라는 기능과 함께 사용해야합니다.

서버역할을 해주는 간단한 프로그램 만들 수 있는 공간인데

그거 할 바엔 그냥 서버만드는게 훨씬 쉽고 저렴하고 확장성있기 때문에

Firebase는 언제나 간단한 앱 만들 때 쓰는게 이득입니다.
     */
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
