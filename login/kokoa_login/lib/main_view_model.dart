import 'package:kokoa_login/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';


class MainViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  MainViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
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