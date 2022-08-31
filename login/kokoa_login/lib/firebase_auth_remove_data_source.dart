import 'package:http/http.dart' as http;

class FirebaseAuthRemoteDataSource {
  final String url = 'https://us-central1-loginkakao-41228.cloudfunctions.net/createCustomToken'; // 서버주소 서버 구축해서 주소 넣어주기

  // 서버 통신해서 토근 받고 유저 정보 받아오기
  Future<String> createCustomToken(Map<String, dynamic> user) async {
    final customTokenResponse = await http
        .post(Uri.parse(url), body: user);

    return customTokenResponse.body;
  }
}