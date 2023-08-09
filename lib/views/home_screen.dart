import 'package:flutter/material.dart';
import 'package:my_iot_car_app/components/joystick.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();

  double xValue = 0;
  double yValue = 0;

  void _onJoystickChanged(double x, double y) {
    setState(() {
      xValue = x;
      yValue = y * -1;
    });

    // Atualizar os valores no Firebase Realtime Database
    databaseReference.child("forward").set(y <= 0);
    databaseReference.child("speed").set(y.abs());
    databaseReference.child("steeringAngle").set(x);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'CarIoT Joystick',
            style: TextStyle(
                fontSize: 35, color: Colors.pink, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'X: $xValue | Y: $yValue',
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.8),
              child: JoystickExample(onChanged: _onJoystickChanged),
            ),
          ],
        ),
      ),
    );
  }
}
