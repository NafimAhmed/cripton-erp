import 'package:flutter/material.dart';

import '../utils/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 40,
  });
  final VoidCallback onPressed;
  final String text;
  final int height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: PRIMARY_COLOR,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: height / 2,
          ),
          textStyle: const TextStyle(fontSize: 16)),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}

class PrimaryRoundButton extends StatelessWidget {
  const PrimaryRoundButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: PRIMARY_COLOR,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 20,
          ),
          textStyle: const TextStyle(fontSize: 16)),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  const PrimaryIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.text,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, right: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Text(text ?? '')
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height = 20,
  });
  final VoidCallback onPressed;
  final String text;
  final int height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: PRIMARY_COLOR,
          padding: EdgeInsets.symmetric(
            horizontal: 50,
            vertical: height / 2,
          ),
          textStyle: const TextStyle(fontSize: 16)),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
