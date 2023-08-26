import 'package:firebase_database/firebase_database.dart';

abstract class MovementFirebaseMethods {
  static final databaseReference = FirebaseDatabase.instance.reference();

  static void changeDirection({required double x, required double y}) {
    databaseReference.child('status').child("forward").set(y <= 0);
    databaseReference.child('status').child("speed").set(y.abs());
    databaseReference.child('status').child("steeringAngle").set(x);
  }
}
