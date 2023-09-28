import 'package:flutter/material.dart';
import '../services/calibration_methods.dart';

class FirsStep extends StatefulWidget {
  const FirsStep({Key? key}) : super(key: key);

  @override
  State<FirsStep> createState() => _FirsStepState();
}

class _FirsStepState extends State<FirsStep> {
  @override
  void initState() {
    SetCalibrationStep.setCalibrationStep(1);
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
          'Calibragem: 1° Passo',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'A roda esquerda está girando?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Sim');
            },
            child: const Text(
              'Sim',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Não');
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
