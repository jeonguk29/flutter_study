import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kokoa_login/kakao_login.dart';
import 'package:kokoa_login/main_view_model.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{

  kakao.KakaoSdk.init(nativeAppKey: 'dc8f53d1dc69307cff929ce71c106117'); // 초기화 코드 넣어줘야함 네이티브 앱키 넣기

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return ElevatedButton(
                onPressed: () async {
                  await viewModel.login();
                  setState(() {});
                },
                child: const Text('Login'),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                    viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                Text(
                  '${viewModel.isLogined}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.logout();
                    setState(() {});
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          }
      ),
    ),
    );
  }
}

      /*
      body: Center(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(), // 로그인이 되고 안될때 마다 새로운 스트림 들어옴
          builder: (context, snapshot) {
            if(!snapshot.hasData){  // 로그인 안되어 있으면 여기 보여주기
              return ElevatedButton( // 로그인 실행버튼
                onPressed: () async {
                  await viewModel.login();
                  setState(() {}); // 화면 갱신
                },
                child: const Text('Login'),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                    viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
                // 로그인 해서 카카오 프로필 사진 있으면 뿌리고 없으면 '' 빈값 처리
                Text(
                  '${viewModel.isLogined}', // True, false 값 나오게
                  style: Theme.of(context).textTheme.headline4,
                ),

                ElevatedButton( // 로그 아웃 버튼
                  onPressed: () async {
                    await viewModel.logout();
                    setState(() {}); // 화면갱신
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}*/