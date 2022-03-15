class Proof {
  int? id;
  String? proofName;
  String? proofID;
  String? proofPurpose;
  String? proofFile;
  String? createdTime;
  String? modifiedTime;

  Proof(
      {this.id,
        this.proofName,
        this.proofID,
        this.proofPurpose,
        this.proofFile,
        this.createdTime,
        this.modifiedTime});

  Proof.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    proofName = json['proofName'];
    proofID = json['proofID'];
    proofPurpose = json['proofPurpose'];
    proofFile = json['proofFile'];
    createdTime = json['createdTime'];
    modifiedTime = json['modifiedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['proofName'] = proofName;
    data['proofID'] = proofID;
    data['proofPurpose'] = proofPurpose;
    data['proofFile'] = proofFile;
    data['createdTime'] = createdTime;
    data['modifiedTime'] = modifiedTime;
    return data;
  }
}