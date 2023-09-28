import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class SetCalibrationStep {
  static setCalibrationStep(int stepValue) {
    databaseReference.child('status').child("calibrationStep").set(stepValue);
  }
}
