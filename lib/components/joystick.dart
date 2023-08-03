import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class JoystickExample extends StatefulWidget {
  const JoystickExample({Key? key}) : super(key: key);

  @override
  JoystickExampleState createState() => JoystickExampleState();
}

class JoystickExampleState extends State<JoystickExample> {
  double _x = 0;
  double _y = 0;

  @override
  Widget build(BuildContext context) {
    return Joystick(
      mode: JoystickMode.all,
      listener: (details) {
        setState(() {
          _x = details.x;
          _x = (_x * 10).roundToDouble() / 10;
          _y = details.y;
          _y = (_y * 10).roundToDouble() / 10;
          if (kDebugMode) {
            print('X = $_x | Y = $_y');
          }
        });
      },
    );
  }
}
