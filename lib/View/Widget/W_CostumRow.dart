import 'package:agent_application/View/Screens/Information_Screen.dart';
import 'package:flutter/material.dart';

class CostumeRow extends StatelessWidget {
  const CostumeRow({
    Key? key,
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.mobile,
    required this.tele,
  }) : super(key: key);

  final int id;
  final String name;
  final String email;
  final String address;
  final String mobile;
  final String tele;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    InformationScreen(id, name, email, address, mobile, tele)));
      }),
      leading: const Icon(
        Icons.person,
        size: 29,
        color: Colors.black,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 15,
        color: Colors.black.withOpacity(0.7),
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        email,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
