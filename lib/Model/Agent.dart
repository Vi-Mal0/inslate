import 'package:insuranceprototype/Model/ClientData.dart';

class Agent {
  int? id;
  ClientData? client;
  String? dateAppointed;
  String? exclusive;
  bool? previousAgent;
  String? prevDateOfTermination;
  String? distributionChannel;
  String? branch;
  String? areaCode;
  String? agentType;
  String? reportingTo;
  String? payMethod;
  String? payFrequency;
  String? currencyType;
  String? minimumAmount;
  String? bonusAllocation;
  String? basicCommission;
  String? renewalCommission;
  int? clientId;
  String? servicingCommission;
  String? commissionClass;
  int? validFlag;
  String? createdDate;
  String? modifiedDate;

  Agent(
      {this.id,
        this.client,
        this.dateAppointed,
        this.exclusive,
        this.previousAgent,
        this.prevDateOfTermination,
        this.distributionChannel,
        this.branch,
        this.areaCode,
        this.clientId,
        this.agentType,
        this.reportingTo,
        this.payMethod,
        this.payFrequency,
        this.currencyType,
        this.minimumAmount,
        this.bonusAllocation,
        this.basicCommission,
        this.renewalCommission,
        this.servicingCommission,
        this.commissionClass,
        this.validFlag,
        this.createdDate,
        this.modifiedDate});

  Agent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client = json['client'] != null ? ClientData.fromJson(json['client']) : null;
    dateAppointed = json['dateAppointed'];
    exclusive = json['exclusive'];
    previousAgent = json['previousAgent'];
    clientId = json['clientId'];
    prevDateOfTermination = json['prevDateOfTermination'];
    distributionChannel = json['distributionChannel'];
    branch = json['branch'];
    areaCode = json['areaCode'];
    agentType = json['agentType'];
    reportingTo = json['reportingTo'];
    payMethod = json['payMethod'];
    payFrequency = json['payFrequency'];
    currencyType = json['currencyType'];
    minimumAmount = json['minimumAmount'];
    bonusAllocation = json['bonusAllocation'];
    basicCommission = json['basicCommission'];
    renewalCommission = json['renewalCommission'];
    servicingCommission = json['servicingCommission'];
    commissionClass = json['commissionClass'];
    validFlag = json['validFlag'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
  }

  @override
  String toString() {
    return 'Agent{id: $id, client: $client, dateAppointed: $dateAppointed, exclusive: $exclusive, previousAgent: $previousAgent, prevDateOfTermination: $prevDateOfTermination, distributionChannel: $distributionChannel, branch: $branch, areaCode: $areaCode, agentType: $agentType, reportingTo: $reportingTo, payMethod: $payMethod, payFrequency: $payFrequency, currencyType: $currencyType, minimumAmount: $minimumAmount, bonusAllocation: $bonusAllocation, basicCommission: $basicCommission, renewalCommission: $renewalCommission, clientId: $clientId, servicingCommission: $servicingCommission, commissionClass: $commissionClass, validFlag: $validFlag, createdDate: $createdDate, modifiedDate: $modifiedDate}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (client != null) {
      data['client'] = client?.toJson();
    }
    data['dateAppointed'] = dateAppointed;
    data['exclusive'] = exclusive;
    data['previousAgent'] = previousAgent;
    data['prevDateOfTermination'] = prevDateOfTermination;
    data['distributionChannel'] = distributionChannel;
    data['branch'] = branch;
    data['areaCode'] = areaCode;
    data['agentType'] = agentType;
    data['reportingTo'] = reportingTo;
    data['payMethod'] = payMethod;
    data['payFrequency'] = payFrequency;
    data['currencyType'] = currencyType;
    data['minimumAmount'] = minimumAmount;
    data['bonusAllocation'] = bonusAllocation;
    data['basicCommission'] = basicCommission;
    data['clientId'] = clientId;
    data['renewalCommission'] = renewalCommission;
    data['servicingCommission'] = servicingCommission;
    data['commissionClass'] = commissionClass;
    data['validFlag'] = validFlag;
    data['createdDate'] = createdDate;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}



