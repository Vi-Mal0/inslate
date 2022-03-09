import 'Quans.dart';

class User {
  User({
      this.id, 
      this.name, 
      this.mobileNumber, 
      this.email, 
      this.dateOfBirth, 
      this.highestQualification, 
      this.proof, 
      this.proofId, 
      this.communication, 
      this.resume, 
      this.availableDateAndTime, 
      this.employee, 
      this.currentStatus, 
      this.quants, 
      this.createdTime, 
      this.modifiedTime,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    highestQualification = json['highestQualification'];
    proof = json['proof'];
    proofId = json['proofId'];
    communication = json['communication'];
    resume = json['resume'];
    availableDateAndTime = json['availableDateAndTime'];
    employee = json['employee'];
    currentStatus = json['currentStatus'];
    quants = json['quants'] != null ? Quans.fromJson(json['quants']) : null;
    createdTime = json['createdTime'];
    modifiedTime = json['modifiedTime'];
  }

  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? dateOfBirth;
  String? highestQualification;
  String? proof;
  String? proofId;
  String? communication;
  dynamic? resume;
  String? availableDateAndTime;
  int? employee;
  String? currentStatus;
  Quans? quants;
  String? createdTime;
  String? modifiedTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;
    map['dateOfBirth'] = dateOfBirth;
    map['highestQualification'] = highestQualification;
    map['proof'] = proof;
    map['proofId'] = proofId;
    map['communication'] = communication;
    map['resume'] = resume;
    map['availableDateAndTime'] = availableDateAndTime;
    map['employee'] = employee;
    map['currentStatus'] = currentStatus;
    if (quants != null) {
      map['quants'] = quants?.toJson();
    }
    map['createdTime'] = createdTime;
    map['modifiedTime'] = modifiedTime;
    return map;
  }

}