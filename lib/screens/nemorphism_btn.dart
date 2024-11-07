import 'package:flutter/material.dart';

class NeuMorphism_button extends StatefulWidget {
  const NeuMorphism_button({super.key});

  @override
  State<NeuMorphism_button> createState() => _NeuMorphism_buttonState();
}

class _NeuMorphism_buttonState extends State<NeuMorphism_button> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xffe7ecef);
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isPressed = !isPressed),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: blur,
                  offset: -distance,
                  color: Colors.white,
                ),
                BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: const Color(0xffa7a9af),
                ),
              ],
            ),
            child: const SizedBox(height: 200, width: 200),
          ),
        ),
      ),
    );
  }
}
