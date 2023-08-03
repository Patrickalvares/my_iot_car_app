import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:my_iot_car_app/components/joystick.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'CarioT Joystick',
            style: TextStyle(
                fontSize: 35, color: Colors.pink, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            const Align(
              alignment: Alignment(0, 0.8),
              child: JoystickExample(),
            ),
          ],
        ),
      ),
    );
  }
}
