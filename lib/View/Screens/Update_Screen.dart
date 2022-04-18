import 'package:agent_application/Controllers/Agent_Api.dart';
import 'package:agent_application/Models/Agent_Model.dart';
import 'package:agent_application/Provider/Agent_Provider.dart';
import 'package:agent_application/View/Widget/W_CostumeText.dart';
import 'package:agent_application/View/Widget/W_CostumeTextField.dart';
import 'package:agent_application/View/Widget/W_ScafoldMessag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateScreen extends ConsumerWidget {
  UpdateScreen(
      this.id, this.name, this.email, this.address, this.mobile, this.tele,
      {Key? key})
      : super(key: key);
  final int id;
  final String name, email, address, mobile, tele;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController teleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<AgentModel>> agent = ref.watch(AgentDataWithRiverpod);
    nameController.text = name;
    emailController.text = email;
    addressController.text = address;
    mobileController.text = mobile;
    teleController.text = tele;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Update Agent'),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CostumeText(data: 'Name'),
                CostumeTextField(
                  controller: nameController,
                  hintText: 'Enter your Name',
                  textInputType: TextInputType.text,
                ),
                const CostumeText(data: 'Email'),
                CostumeTextField(
                  controller: emailController,
                  hintText: 'Enter your Email',
                  textInputType: TextInputType.emailAddress,
                ),
                const CostumeText(data: 'Address'),
                CostumeTextField(
                  controller: addressController,
                  hintText: 'Enter your Address',
                  textInputType: TextInputType.streetAddress,
                ),
                const CostumeText(data: 'Mobile'),
                CostumeTextField(
                  controller: mobileController,
                  hintText: 'Enter your Mobile number',
                  textInputType: TextInputType.phone,
                ),
                const CostumeText(data: 'Telephone'),
                CostumeTextField(
                  controller: teleController,
                  hintText: 'Enter your Telephone number',
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        addressController.text.isEmpty ||
                        mobileController.text.isEmpty ||
                        teleController.text.isEmpty) {
                      onError(context, ' Please Enter All your Information ');
                    } else {
                      AgentDataApi().updateAgent(
                          id,
                          nameController.text,
                          emailController.text,
                          addressController.text,
                          mobileController.text,
                          teleController.text);

                      ref.refresh(AgentDataWithRiverpod);
                      onSuccesse(
                          context, 'Your Information Updeted with Success');
                    }

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
                  height: 70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
