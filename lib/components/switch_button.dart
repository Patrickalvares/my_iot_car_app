// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import '../services/light_firebase_methods.dart';

class SwitchButton extends StatefulWidget {
  final Text offText;
  final Text onText;
  final Icon offIcon;
  final Icon onIcon;
  final Function() action;
  final Function() getter;

  const SwitchButton({
    Key? key,
    required this.offText,
    required this.onText,
    required this.offIcon,
    required this.onIcon,
    required this.action,
    required this.getter,
  }) : super(key: key);

  @override
  SwitchButtonState createState() => SwitchButtonState();
}

class SwitchButtonState extends State<SwitchButton> {
  bool _isOn = false;

  @override
  void initState() {
    super.initState();
    _initializeSwitchState();
  }

  Future<void> _initializeSwitchState() async {
    _isOn = await widget.getter();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      current: _isOn,
      first: true,
      second: false,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (b) {
        widget.action();
        setState(() {
          _isOn = b;
        });
      },
      styleBuilder: (b) => ToggleStyle(indicatorColor: b ? Colors.green : Colors.red),
      iconBuilder: (value) => value ? widget.onIcon : widget.offIcon,
      textBuilder: (value) => value ? Center(child: widget.onText) : Center(child: widget.offText),
    );
  }
}
