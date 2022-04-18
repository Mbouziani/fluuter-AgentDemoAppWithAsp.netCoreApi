import 'package:flutter/material.dart';

class CostumeSubText extends StatelessWidget {
  const CostumeSubText({
    required this.data,
    Key? key,
  }) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        data,
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
