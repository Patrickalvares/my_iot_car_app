import 'package:flutter/material.dart';

class FarolLDR extends StatelessWidget {
  final String ldrValue;

  const FarolLDR({super.key, required this.ldrValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.lightbulb_outlined, size: 60),
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(66, 0, 0, 0), width: 5),
                color: Colors.yellow.withOpacity(1 - double.parse(ldrValue)),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'LDR: $ldrValue',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
