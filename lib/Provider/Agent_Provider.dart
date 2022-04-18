import 'package:agent_application/Controllers/Agent_Api.dart';
import 'package:agent_application/Models/Agent_Model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AgentDataWithRiverpod = FutureProvider<List<AgentModel>>((ref) async {
  return await AgentDataApi().getAgents();
});
