import 'package:flutter/material.dart';
import 'package:my_iot_car_app/services/light_firebase_methods.dart';

class AutoLightButtons extends StatefulWidget {
  const AutoLightButtons({super.key});

  @override
  State<AutoLightButtons> createState() => _AutoLightButtonsState();
}

class _AutoLightButtonsState extends State<AutoLightButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.amber,
      child: ElevatedButton(onPressed: () => LightFirebaseMethods.changeAutoLight(), child: const Text('Auto')),
    );
  }
}

class TurnOnOfftButtons extends StatefulWidget {
  const TurnOnOfftButtons({super.key});

  @override
  State<TurnOnOfftButtons> createState() => _TurnOnOfftButtonsState();
}

class _TurnOnOfftButtonsState extends State<TurnOnOfftButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      color: Colors.amber,
      child: ElevatedButton(onPressed: () => LightFirebaseMethods.turnOnOffLight(true), child: const Text('legar/deslogar')),
    );
  }
}
