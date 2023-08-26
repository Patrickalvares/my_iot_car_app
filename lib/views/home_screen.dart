import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_iot_car_app/components/joystick.dart';
import 'package:my_iot_car_app/services/light_firebase_methods.dart';
import 'package:my_iot_car_app/services/movement_firebase_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String ldrValue = '';
  double xValue = 0;
  double yValue = 0;

  @override
  void initState() {
    super.initState();
    _updateLdrValue();
  }

  void _updateLdrValue() async {
    ldrValue = await LightFirebaseMethods.readLdr();
    setState(() {});
    Timer.periodic(const Duration(milliseconds: 300), (timer) async {
      ldrValue = await LightFirebaseMethods.readLdr();
      setState(() {});
    });
  }

  void _onJoystickChanged(double x, double y) {
    setState(() {
      xValue = x;
      yValue = y;
      MovementFirebaseMethods.changeDirection(x: x, y: y);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
            Text(
              'LDR: $ldrValue',
              style: const TextStyle(color: Colors.white),
            ),
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
