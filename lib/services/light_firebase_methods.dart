import 'package:firebase_database/firebase_database.dart';

abstract class LightFirebaseMethods {
  static final databaseReference = FirebaseDatabase.instance.reference();

  static Future<String> readLdr() async {
    DataSnapshot snapshot =
        (await databaseReference.child('status').child("ldr").once()).snapshot;
    return snapshot.value?.toString() ?? '';
  }
}
