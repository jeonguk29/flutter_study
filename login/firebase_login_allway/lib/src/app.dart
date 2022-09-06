import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login_allway/src/pages/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapShot){
        if(snapShot.hasError){
          return Center(
            child: Text("Firevase load fail"),
          );
        }
        if(snapShot.connectionState == ConnectionState.done){
          return Home();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
