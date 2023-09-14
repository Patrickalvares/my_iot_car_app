import 'dart:async';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:my_iot_car_app/components/joystick.dart';
import 'package:my_iot_car_app/components/light_buttons.dart';
import 'package:my_iot_car_app/services/light_firebase_methods.dart';
import 'package:my_iot_car_app/services/movement_firebase_methods.dart';

import '../components/switch_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool positive = true;
  String ldrValue = '';
  double xValue = 0;
  double yValue = 0;

  @override
  void initState() {
    super.initState();
    _updateLdrValue();
    LightFirebaseMethods.isAutoGetter();
    LightFirebaseMethods.isOnGetter();
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color.fromARGB(255, 157, 97, 6), Color.fromARGB(255, 235, 189, 129)],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'CarIoT Joystick',
                style: TextStyle(fontSize: 35, color: Colors.yellow, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              const SwitchButton(
                action: LightFirebaseMethods.changeAutoLight,
                getter: LightFirebaseMethods.isAutoGetter,
                offText: Text('Manual'),
                onText: Text('Auto'),
                onIcon: Icon(Icons.auto_fix_high_outlined),
                offIcon: Icon(Icons.back_hand_outlined),
              ),
              const TurnOnOfftButtons(),
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
      ),
    );
  }
}
