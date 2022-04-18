class AgentModel {
  int? agentId;
  String? agentName;
  String? agentEmail;
  String? agentAddress;
  String? agentMobile;
  String? agentTele;

  AgentModel(
      {this.agentId,
      this.agentName,
      this.agentEmail,
      this.agentAddress,
      this.agentMobile,
      this.agentTele});

  AgentModel.fromJson(Map<String, dynamic> json) {
    agentId = json['agentId'];
    agentName = json['agentName'];
    agentEmail = json['agentEmail'];
    agentAddress = json['agentAddress'];
    agentMobile = json['agentMobile'];
    agentTele = json['agentTele'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['agentId'] = agentId;
    data['agentName'] = agentName;
    data['agentEmail'] = agentEmail;
    data['agentAddress'] = agentAddress;
    data['agentMobile'] = agentMobile;
    data['agentTele'] = agentTele;
    return data;
  }
}
