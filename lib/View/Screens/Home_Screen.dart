import 'package:agent_application/Models/Agent_Model.dart';
import 'package:agent_application/Provider/Agent_Provider.dart';
import 'package:agent_application/View/Screens/Add_Screen.dart';
import 'package:agent_application/View/Widget/W_CostumRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<AgentModel>> agent = ref.watch(AgentDataWithRiverpod);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Agent'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () => ref.refresh(AgentDataWithRiverpod),
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: agent.when(
          data: (agent) => SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: agent.length,
                itemBuilder: (context, index) {
                  return CostumeRow(
                    id: agent[index].agentId!,
                    name: agent[index].agentName!,
                    email: agent[index].agentEmail!,
                    address: agent[index].agentAddress!,
                    mobile: agent[index].agentMobile!,
                    tele: agent[index].agentTele!,
                  );
                },
                separatorBuilder: (context, index) => Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: Colors.black12,
                ),
              )),
          error: (err, stack) => Center(
                child: Column(
                  children: const [
                    Text(
                      '404',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'No Data Loading',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => AddScreen()));
            },
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            )),
      ),
    );
  }
}
