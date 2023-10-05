import 'package:flutter/material.dart';
import '../services/calibration_methods.dart';

class FifthStep extends StatefulWidget {
  const FifthStep({Key? key}) : super(key: key);

  @override
  State<FifthStep> createState() => _FirsStepState();
}

class _FirsStepState extends State<FifthStep> {
  @override
  void initState() {
    SetCalibrationStep.setCalibrationStep(5);
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
          'Calibragem: 5° Passo',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'A roda direita está indo para frente?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 100), () {});
            },
            child: const Text(
              'Sim',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 100), () {});
            },
            child: const Text(
              'Não',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              SetCalibrationStep.setCalibrationStep(0);
              Navigator.pop(context, 'Cancelar');
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
