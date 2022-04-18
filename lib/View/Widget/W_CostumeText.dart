import 'package:flutter/material.dart';

class CostumeText extends StatelessWidget {
  const CostumeText({
    required this.data,
    Key? key,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 7.0, left: 2),
      child: Text(
        data,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
