import 'package:agent_application/Models/Agent_Model.dart';
import 'package:dio/dio.dart';

class AgentDataApi {
  final String baseUrl = 'http://omexpro4it.com';
  List<AgentModel> agentModelList = [];
  Future<List<AgentModel>> getAgents() async {
    try {
      Response response = await Dio().get("$baseUrl/api/Agents");

      if (response.statusCode == 200) {
        for (int i = 0; i < response.data.length; i++) {
          agentModelList.add(AgentModel.fromJson(response.data[i]));
        }

        return agentModelList;
      }
    } catch (e) {
      print('Server Down');
    }

    return agentModelList;
  }

  addAgent(String name, email, address, mobile, tele) async {
    try {
      Response response = await Dio().post("$baseUrl/api/Agents", data: {
        "agentName": name,
        "agentEmail": email,
        "agentAddress": address,
        "agentMobile": mobile,
        "agentTele": tele
      });
      print(response.data.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  deleteAgent(
    int id,
  ) async {
    try {
      Response response = await Dio().delete("$baseUrl/api/Agents/$id");
      print("Delete with Successe");
    } catch (e) {
      print(e.toString());
    }
  }

  updateAgent(int id, String name, email, address, mobile, tele) async {
    try {
      Response response = await Dio().put("$baseUrl/api/Agents/$id", data: {
        "agentId": id,
        "agentName": name,
        "agentEmail": email,
        "agentAddress": address,
        "agentMobile": mobile,
        "agentTele": tele
      });
      print("updated with Successe");
    } catch (e) {
      print(e.toString());
    }
  }
}
