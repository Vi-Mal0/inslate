import 'dart:ffi';

class Proof {
  int? id;
  String? proofName;
  String? proofID;
  String? proofPurpose;
  String? proofFile;
  int? clientID;
  String? createdTime;
  String? modifiedTime;

  Proof(
      {this.id,
      this.proofName,
      this.proofID,
      this.proofPurpose,
      this.proofFile,
      this.clientID});

  Proof.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proofName = json['proofName'];
    proofID = json['proofID'];
    proofPurpose = json['proofPurpose'];
    proofFile = json['proofFile'];
    clientID = json['clientID'];
    createdTime = json['createdTime'];
    modifiedTime = json['modifiedTime'];
  }

  @override
  String toString() {
    return 'Proof{id: $id, proofName: $proofName, proofID: $proofID, proofPurpose: $proofPurpose, proofFile: $proofFile, clientID: $clientID, createdTime: $createdTime, modifiedTime: $modifiedTime}';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['proofName'] = proofName;
    data['proofID'] = proofID;
    data['proofPurpose'] = proofPurpose;
    data['proofFile'] = proofFile;
    data['clientID'] = clientID;
    data['createdTime'] = createdTime;
    data['modifiedTime'] = modifiedTime;
    return data;
  }
}
