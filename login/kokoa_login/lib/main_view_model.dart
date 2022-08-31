import 'package:firebase_auth/firebase_auth.dart';
import 'package:kokoa_login/firebase_auth_remove_data_source.dart';
import 'package:kokoa_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;


class MainViewModel {
  final _firebaseAuthDataSource = FirebaseAuthRemoteDataSource();
  final SocialLogin _socialLogin;
  bool isLogined = false;
  kakao.User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await kakao.UserApi.instance.me();


      // 파이어 베이스 어스에서 필요료 하는데이터 보내주면 됨
      final token = await _firebaseAuthDataSource.createCustomToken({
        'uid': user!.id.toString(), //. 유저 객체 id 넘김 카카오에서 숫자로 주지만 파이어베이스에서는 문자로 받아야함
        'displayName': user!.kakaoAccount!.profile!.nickname,
        'email': user!.kakaoAccount!.email!,
        'photoURL': user!.kakaoAccount!.profile!.profileImageUrl!,// 다 널러블이라 ! 신경 쓰기
      });// 여기다 내용을 보내고

      await FirebaseAuth.instance.signInWithCustomToken(token); // 여기서 파이어 베이스 어스랑 연결하면 됨

    }
  }

  Future logout() async {
    await _socialLogin.logout(); // 카카오 로그인
    await FirebaseAuth.instance.signOut(); // 파이어 베이스 어스 까지 로그인 해줘야함
    isLogined = false;
    user = null;
  }
}

/*
class MainViewModel{
  final SocialLogin _socialLogin;
  bool isLogined = false; // 로그인 처음 로그인 안되어 있으니 false
  User? user; // 카카오에서 유저 라는 클레스로 제공함 널러블로 처리 유저 없을수도 있으니

  MainViewModel(this._socialLogin);
  Future login() async {
    isLogined = await _socialLogin.login(); // 로그인 true면 로그인 된거임
    if(isLogined){
      user = await UserApi.instance.me(); // 유저 정보를 가져옴
    }
  }

  Future logout()async{  // 로그아웃 구현
    await _socialLogin.login();
    isLogined = false;
    user = null;
  }
}

 */