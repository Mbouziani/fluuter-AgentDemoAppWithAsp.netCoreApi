import 'package:agent_application/Controllers/Agent_Api.dart';
import 'package:agent_application/Models/Agent_Model.dart';
import 'package:agent_application/Provider/Agent_Provider.dart';
import 'package:agent_application/View/Screens/Home_Screen.dart';
import 'package:agent_application/View/Screens/Update_Screen.dart';
import 'package:agent_application/View/Widget/W_CostumeSubText.dart';
import 'package:agent_application/View/Widget/W_CostumeText.dart';
import 'package:agent_application/View/Widget/W_ScafoldMessag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformationScreen extends ConsumerWidget {
  const InformationScreen(
      this.id, this.name, this.email, this.address, this.mobile, this.tele,
      {Key? key})
      : super(key: key);
  final int id;
  final String name, email, address, mobile, tele;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<AgentModel>> agent = ref.watch(AgentDataWithRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Agent Information'),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CostumeText(data: 'Name'),
              CostumeSubText(data: name),
              const CostumeText(data: 'Email'),
              CostumeSubText(data: email),
              const CostumeText(data: 'Address'),
              CostumeSubText(data: address),
              const CostumeText(data: 'Mobile'),
              CostumeSubText(data: mobile),
              const CostumeText(data: 'Telephone'),
              CostumeSubText(data: tele),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => UpdateScreen(
                              id, name, email, address, mobile, tele)));
                  ref.refresh(AgentDataWithRiverpod);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(7)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  showAlert(context, id, ref);
                  ref.refresh(AgentDataWithRiverpod);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(7)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlert(BuildContext context, int id, WidgetRef ref) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 50,
                color: Colors.red,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Are you sure you want to delete this Agent ?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AgentDataApi().deleteAgent(id);
                        Navigator.pop(context);
                        ref.refresh(AgentDataWithRiverpod);
                        onSuccesse(
                            context, 'Your Agent has been deleted Successfuly');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    HomeScreen()));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(7)),
                        alignment: Alignment.center,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
