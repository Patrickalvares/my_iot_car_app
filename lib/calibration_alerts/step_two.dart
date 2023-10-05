import 'package:flutter/material.dart';
import 'package:my_iot_car_app/calibration_alerts/step_three.dart';
import '../services/calibration_methods.dart';

class SecondStep extends StatefulWidget {
  const SecondStep({Key? key}) : super(key: key);

  @override
  State<SecondStep> createState() => _FirsStepState();
}

class _FirsStepState extends State<SecondStep> {
  @override
  void initState() {
    SetCalibrationStep.setCalibrationStep(2);
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
          'Calibragem: 2° Passo',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'A roda direita está girando?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 100), () {
                showDialog(
                  context: context,
                  builder: (context) => const ThirdStep(),
                );
              });
            },
            child: const Text(
              'Sim',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 100), () {
                const snackBar = SnackBar(
                  content: Text(
                    'O carrinho está com problemas! Leve-o na Sevencar.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                SetCalibrationStep.setCalibrationStep(0);
              });
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
