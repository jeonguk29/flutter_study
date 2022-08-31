import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kokoa_login/social_login.dart';



class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (error) {
      return false;
    }
  }

}
/*
class KakaoLogin implements SocialLogin{
  @override
  Future<bool> login() async{
    try{
      bool isInstalled = await isKakaoTalkInstalled(); // 카카오 설치 되었는지 여부 확인
      if(isInstalled ) {
        try{
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch(e){
          return false;
        }
      }else { // 설치 되어 있지 않다면
        try {
          await UserApi.instance.loginWithKakaoAccount(); // 카카오 계정으로 로그인 유도
          return true;
        }catch(e){
          return false;
        }
      }
    }catch(e){
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    // TODO: implement logout
    try{
      await UserApi.instance.unlink();
      return true;
    }catch (error){
      return false;
    }

  }

}


 */