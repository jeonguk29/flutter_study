
import 'package:flutter/material.dart';
import 'package:kokoa_login/kakao_login.dart';
import 'package:kokoa_login/main_view_model.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';


void main() {
  KakaoSdk.init(nativeAppKey: 'dc8f53d1dc69307cff929ce71c106117'); // 초기화 코드 넣어줘야함 네이티브 앱키 넣기
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            // 로그인 해서 카카오 프로필 사진 있으면 뿌리고 없으면 '' 빈값 처리
            Text(
              '${viewModel.isLogined}', // True, false 값 나오게
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton( // 로그인 실행버튼
              onPressed: () async {
                await viewModel.login();
                setState(() {}); // 화면 갱신
              },
              child: const Text('Login'),
            ),
            ElevatedButton( // 로그 아웃 버튼
              onPressed: () async {
                await viewModel.logout();
                setState(() {}); // 화면갱신
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}