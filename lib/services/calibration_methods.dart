import 'package:firebase_database/firebase_database.dart';

// ignore: deprecated_member_use
final databaseReference = FirebaseDatabase.instance.reference();

class SetCalibrationStep {
  static setCalibrationStep(int stepValue) {
    databaseReference.child('status').child("calibrationStep").set(stepValue);
  }

  static invertMotorLeftRightPinValue() {
    databaseReference.child('config').child("motorLeftRightPinInverted").once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        bool currentValue = snapshot.value as bool;
        bool invertedValue = !currentValue;
        databaseReference.child('config').child("motorLeftRightPinInverted").set(invertedValue);
      }
    });
  }

  static invertMotorLeftDirectionPinValue() {
    databaseReference.child('config').child("motorLeftDirectionPinInverted").once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        bool currentValue = snapshot.value as bool;
        bool invertedValue = !currentValue;
        databaseReference.child('config').child("motorLeftDirectionPinInverted").set(invertedValue);
      }
    });
  }

  static invertServoPinValue() {
    databaseReference.child('config').child("servoPinInverted").once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        bool currentValue = snapshot.value as bool;
        bool invertedValue = !currentValue;
        databaseReference.child('config').child("servoPinInverted").set(invertedValue);
      }
    });
  }
}
