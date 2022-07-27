import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final notifications = FlutterLocalNotificationsPlugin();

//아래 코드 앱로드시 1회 실행 필요

//1. 앱로드시 실행할 기본설정
initNotification(context) async {        // 함수로 만듬

  //안드로이드용 아이콘파일 이름
  var androidSetting = AndroidInitializationSettings('me'); // 투명 png 파일 권장함

  //ios에서 앱 로드시 유저에게 권한요청하려면
  var iosSetting = IOSInitializationSettings( // ios에서 알림 띄우기전 허락 받는 코드
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting
  );

  await notifications.initialize(  // 알림 누를때 원하는 페이지 뛰우는 법  현제 알람 누르면 다시 앱 로드 돰
    initializationSettings,
    onSelectNotification: (payload){// 이안에 함수 만들면 알람 눌렀을때 이안에 함수 코드가 실행됨
      Navigator.push(
        context, //마테리얼앱 위젯이 부모에 있어야 하는데 이페이지는 없음 없으면 보내면 됨
        MaterialPageRoute(
         builder: (context) => Text('새로운페이지'), // Text('새로운페이지') 요개아니라 스케폴드 부터 쭉 이어 나가면됨
        ),
      );
    }
    //알림 누를때 함수실행하고 싶으면
    //onSelectNotification: 함수명추가
  );
}


//2. 이 함수 원하는 곳에서 실행하면 알림 뜸
showNotification() async {

  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림종류 설명',   // ex 할인 알림
    priority: Priority.high,   // 중요도 설정 부분
    importance: Importance.max,   // 중요도 설정 부분 중요도 낮으면 안보일수 있음
    color: Color.fromARGB(255, 255, 0, 0), // 알림 아이콘 색상
  );

  var iosDetails = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(
      1,
      '제목1',
      '내용1',
      NotificationDetails(android: androidDetails, iOS: iosDetails)
      //payload: '부가정보'
      // 알림에 몰래 정보 심어 놓기 위해 사용했던 방법인데 이거 말고 요즘 몰래 정보 심어놓기 젤 좋은 곳은 shared_preferences 여기다 심자
    // 플러터 payload: 사용시 각종 오류 같은게 발생함

  );
}