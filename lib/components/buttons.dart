import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final buttonValues;
  final Color mycolor;
  final VoidCallback onPress;
  Buttons({
    super.key,
    required this.buttonValues,
    this.mycolor = const Color(0xffa5a5a5),
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(shape: BoxShape.circle, color: mycolor),
            child: Center(
              child: Text(
                buttonValues,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
