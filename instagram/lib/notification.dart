import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;      // 시간 다루는 패키지


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


showNotification2() async {

  tz.initializeTimeZones(); // 시간 관련 기능 사용하기 위해 꼭 한줄 필요

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );
  var iosDetails = const IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  notifications.zonedSchedule( // 저번에는 notifications.show( 하면 바로 알림 뜬다고 함 이렇게 하면 파라미터에 시간 입력 가능
      2,
      '제목2',
      '내용2',
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)), // 이 시간에 알람을 띄어줌
      // tz.TZDateTime.now(tz.local) 현재 폰의 시간 나옴 add(Duration(seconds: 5))  5초를 더해서 5초후에 알람 띄움
      //seconds: 아니라 minutes: 30 하면 30분 뒤에  hours: 1 시간후에 days: 10일 뒤에
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime
  );


}

showNotification3() async {

  tz.initializeTimeZones(); // 시간 관련 기능 사용하기 위해 꼭 한줄 필요

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );
  var iosDetails = const IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  notifications.periodicallyShow( // 주기적으로 알람 띄우기 ex 매일
      2,
      '제목2',
      '내용2',
      RepeatInterval.daily,  // 이렇게 데일리로 해주면 이게 시작 되는 시점으로 부터 매일 알람 띄우게 함
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidAllowWhileIdle: true,

  );


}


showNotification4() async {

  tz.initializeTimeZones(); // 시간 관련 기능 사용하기 위해 꼭 한줄 필요

  var androidDetails = const AndroidNotificationDetails(
    '유니크한 알림 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );
  var iosDetails = const IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  notifications.zonedSchedule( 
      2,
      '제목2',
      '내용2',
      //tz.TZDateTime.now(tz.local), // 현재 7시면
      makeDate(8, 30, 0), // 아래 만든 함수를 쓰면 시작한 시간이 아니라 지정한 시간 매일 8시30분 0초에 알람 띄워주는 거임
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time  // 이렇게 하면 매일 같은 시간에 알림 띄워줌  매일 7시에 알림 띄어줌
      // .time 말고 dayOfweekAndTime 하면 매주 같은 시간에 알림 띄워줌
    // .dayOfMonthAndTime 매달 같은 날짜 시간에 알림 띄워줌
    // .dateAndTime  매년 같은날짜, 시간에 알림 띄워줌
  );



}



makeDate(hour, min, sec){
  var now = tz.TZDateTime.now(tz.local);
  var when = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min, sec);
  if (when.isBefore(now)) {
    return when.add(Duration(days: 1));
  } else {
    return when;
  }
}


/* 메인에서 실행 하면됨
예정된 알림 취소하는 법



await notifications.cancel(0);
0 자리엔 제목이랑 같이 있었던 알림 번호 적으면 됩니다.

이 코드 실행하면 해당 예정된 알림 취소됨





await notifications.cancelAll();
이 코드 실행하면 모든 예정된 알림이 삭제됩니다.



서버가 보내는 Push 알림은



서버가 님 앱으로 직접 알림을 보내고 그러지 않습니다.

앱이 꺼져있으면 어떻게 보낼 것임 방법이 없음

그래서 원래는 Firebase Cloud Messaging 서비스 도움을 받아서 푸시알림을 보냅니다.

      알림                             알림 
서버  =>    Firebase Cloud Message  => 폰 (Google Play)


서버가 Firebase Cloud Message으로 메세지를 보냅니다. 알림좀 띄우고 싶다고요

그러면 그 친구가 님들 폰으로 알림메세지를 전송해줍니다.

그럼 백그라운드에서 항상 실행되고 있던 폰의 Google Play라는 앱이 그걸 수신해서

알림을 띄우는 구조로 동작합니다.





그래서 서버 -> FCM 통신하는 법을 알아야하고

FCM에서 플러터앱으로 알림수신하는 법도 알면 끝입니다.
 */