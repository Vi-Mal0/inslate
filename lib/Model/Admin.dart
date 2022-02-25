class Admin {
  Admin({
      this.id, 
      this.jobName, 
      this.jobDesc, 
      this.jobLocation, 
      this.experience, 
      this.eligibility, 
      this.annualpackage, 
      this.openingNumber,});

  Admin.fromJson(dynamic json) {
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