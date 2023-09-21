import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_iot_car_app/components/joystick.dart';
import 'package:my_iot_car_app/services/light_firebase_methods.dart';
import 'package:my_iot_car_app/services/movement_firebase_methods.dart';

import '../components/ldr_display.dart';
import '../components/switch_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
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
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {});
    });
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 92, 60, 12),
              Color.fromARGB(255, 255, 211, 153),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'CarIoT Joystick',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Faróis Automáticos:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SwitchButton(
                    action: LightFirebaseMethods.changeAutoLight,
                    getter: LightFirebaseMethods.isAutoGetter,
                    offText: Text('Manual'),
                    onText: Text('Auto'),
                    onIcon: Icon(Icons.auto_fix_high_outlined),
                    offIcon: Icon(Icons.back_hand_outlined),
                  ),
                ],
              ),
              const Spacer(),
              FutureBuilder<bool>(
                future: LightFirebaseMethods.isAutoGetter(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Ligar/Desligar Faróis:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SwitchButton(
                        isActive: !(snapshot.data ?? false),
                        action: () async {
                          bool isOn = await LightFirebaseMethods.isOnGetter();
                          LightFirebaseMethods.turnOnOffLight(isOn);
                        },
                        getter: LightFirebaseMethods.isOnGetter,
                        offText: const Text('Desligado'),
                        onText: const Text('Ligado'),
                        onIcon: const Icon(Icons.flashlight_on_outlined),
                        offIcon: const Icon(Icons.flashlight_off_outlined),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              FarolLDR(ldrValue: ldrValue),
              const Spacer(),
              const Spacer(),
              Align(
                alignment: const Alignment(0, 0.8),
                child: JoystickExample(onChanged: _onJoystickChanged),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
