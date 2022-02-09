class Candidate {
  Candidate({
      this.id, 
      this.name, 
      this.mobileNumber, 
      this.email, 
      this.dateOfBirth, 
      this.highestQualification, 
      this.proof, 
      this.proofId, 
      this.communication, 
      this.availableDateAndTime, 
      this.employee, 
      this.currentStatus,});

  Candidate.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    highestQualification = json['highestQualification'];
    proof = json['proof'];
    proofId = json['proofId'];
    communication = json['communication'];
    availableDateAndTime = json['availableDateAndTime'];
    employee = json['employee'];
    currentStatus = json['currentStatus'];
  }
  var id;
  var name;
  var mobileNumber;
  var email;
  var dateOfBirth;
  var highestQualification;
  var proof;
  var proofId;
  var communication;
  var availableDateAndTime;
  var employee;
  var currentStatus;

  get qualification => null;

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
    map['availableDateAndTime'] = availableDateAndTime;
    map['employee'] = employee;
    map['currentStatus'] = currentStatus;
    return map;
  }

  @override
  String toString() {
    return 'Candidate{id: $id, name: $name, mobileNumber: $mobileNumber, email: $email, dateOfBirth: $dateOfBirth, highestQualification: $highestQualification, proof: $proof, proofId: $proofId, communication: $communication, availableDateAndTime: $availableDateAndTime, employee: $employee, currentStatus: $currentStatus}';
  }
}