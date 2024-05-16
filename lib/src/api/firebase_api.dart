import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessanging = FirebaseMessaging.instance;

  Future<String?> initNotifications() async {
    await _firebaseMessanging.requestPermission();
    print(_firebaseMessanging.getToken());
    return _firebaseMessanging.getToken();
  }
}
