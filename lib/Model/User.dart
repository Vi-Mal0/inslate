class User {
  User({
      this.id, 
      this.name, 
      this.mobileNumber, 
      this.email, 
      this.dateOfBirth, 
      this.highestQualification, 
      this.applications,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    dateOfBirth = json['dateOfBirth'];
    highestQualification = json['highestQualification'];
    if (json['applications'] != null) {
      applications = [];
      json['applications'].forEach((v) {
        applications?.add(Applications.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? mobileNumber;
  String? email;
  String? dateOfBirth;
  String? highestQualification;
  List<Applications>? applications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['mobileNumber'] = mobileNumber;
    map['email'] = email;
    map['dateOfBirth'] = dateOfBirth;
    map['highestQualification'] = highestQualification;
    if (applications != null) {
      map['applications'] = applications?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Applications {
  Applications({
      this.id, 
      this.proof, 
      this.proofId, 
      this.communication, 
      this.interviewdateandtime, 
      this.employee, 
      this.currentStatus, 
      this.userid, 
      this.jobvacancy,});

  Applications.fromJson(dynamic json) {
    id = json['id'];
    proof = json['proof'];
    proofId = json['proofId'];
    communication = json['communication'];
    interviewdateandtime = json['interviewdateandtime'];
    employee = json['employee'];
    currentStatus = json['currentStatus'];
    userid = json['userid'];
    if (json['jobvacancy'] != null) {
      jobvacancy = [];
      json['jobvacancy'].forEach((v) {
        jobvacancy?.add(Jobvacancy.fromJson(v));
      });
    }
  }
  int? id;
  String? proof;
  String? proofId;
  String? communication;
  String? interviewdateandtime;
  dynamic employee;
  String? currentStatus;
  int? userid;
  List<Jobvacancy>? jobvacancy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['proof'] = proof;
    map['proofId'] = proofId;
    map['communication'] = communication;
    map['interviewdateandtime'] = interviewdateandtime;
    map['employee'] = employee;
    map['currentStatus'] = currentStatus;
    map['userid'] = userid;
    if (jobvacancy != null) {
      map['jobvacancy'] = jobvacancy?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Jobvacancy {
  Jobvacancy({
      this.id, 
      this.jobName, 
      this.jobDesc, 
      this.jobLocation, 
      this.experience, 
      this.eligibility, 
      this.annualpackage, 
      this.openingNumber,});

  Jobvacancy.fromJson(dynamic json) {
    id = json['id'];
    jobName = json['jobName'];
    jobDesc = json['jobDesc'];
    jobLocation = json['jobLocation'];
    experience = json['experience'];
    eligibility = json['eligibility'];
    annualpackage = json['annualpackage'];
    openingNumber = json['openingNumber'];
  }
  int? id;
  String? jobName;
  String? jobDesc;
  String? jobLocation;
  String? experience;
  String? eligibility;
  String? annualpackage;
  String? openingNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['jobName'] = jobName;
    map['jobDesc'] = jobDesc;
    map['jobLocation'] = jobLocation;
    map['experience'] = experience;
    map['eligibility'] = eligibility;
    map['annualpackage'] = annualpackage;
    map['openingNumber'] = openingNumber;
    return map;
  }

}