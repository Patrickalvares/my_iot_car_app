import 'package:flutter/material.dart';
import '../services/calibration_methods.dart';

class Conclusion extends StatefulWidget {
  const Conclusion({Key? key}) : super(key: key);

  @override
  State<Conclusion> createState() => _ConclusionState();
}

class _ConclusionState extends State<Conclusion> {
  @override
  void initState() {
    SetCalibrationStep.setCalibrationStep(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SetCalibrationStep.setCalibrationStep(0);
        return true;
      },
      child: AlertDialog(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color.fromARGB(255, 147, 59, 247), width: 2),
        ),
        title: const Text(
          'Calibragem Concluída com Sucesso!!',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Future.delayed(const Duration(milliseconds: 100), () {});
              },
              child: const Text(
                'Que legal!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
