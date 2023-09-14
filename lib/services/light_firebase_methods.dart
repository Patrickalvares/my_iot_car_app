import 'package:firebase_database/firebase_database.dart';

abstract class LightFirebaseMethods {
  static final databaseReference = FirebaseDatabase.instance.reference();
  static bool isAuto = false;
  static bool isLightOn = false;

  static Future<String> readLdr() async {
    DataSnapshot snapshot = (await databaseReference.child('status').child("ldr").once()).snapshot;
    return snapshot.value?.toString() ?? 'Error';
  }

  static Future<bool> isAutoGetter() async {
    DataSnapshot snapshot = (await databaseReference.child('config').child("autoLed").once()).snapshot;
    isAuto = (snapshot.value == true) ? true : false;
    return isAuto;
  }

  static Future<bool> isOnGetter() async {
    DataSnapshot snapshot = (await databaseReference.child('status').child("led").once()).snapshot;
    isLightOn = (snapshot.value == true) ? true : false;
    return ((snapshot.value == true) ? true : false);
  }

  static changeAutoLight() {
    isAuto = !isAuto;
    databaseReference.child('config').child("autoLed").set(isAuto);
  }

  static turnOnOffLight(bool isOn) {
    databaseReference.child('status').child("led").set(!isLightOn);
    isLightOn = isOn;
  }
}
