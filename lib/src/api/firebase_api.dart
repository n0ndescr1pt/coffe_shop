import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessanging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessanging.requestPermission();

    final fCMToken = await _firebaseMessanging.getToken();
    print(fCMToken);
  }
}