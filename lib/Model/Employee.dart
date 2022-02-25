import 'package:insuranceprototype/Model/Candidate.dart';

class Employee {
  Employee({
      this.id, 
      this.employeeId, 
      this.employeeName, 
      this.employeeEmail, 
      this.employeeDesignation, 
      this.password, 
      this.assignedCandidates,});

  Employee.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    employeeEmail = json['employeeEmail'];
    employeeDesignation = json['employeeDesignation'];
    password = json['password'];
    if (json['assignedCandidates'] != null) {
      assignedCandidates = [];
      json['assignedCandidates'].forEach((v) {
        assignedCandidates?.add(Candidate.fromJson(v));
      });
    }
  }
  int? id;
  String? employeeId;
  String? employeeName;
  String? employeeEmail;
  String? employeeDesignation;
  String? password;
  List<Candidate>? assignedCandidates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employeeId'] = employeeId;
    map['employeeName'] = employeeName;
    map['employeeEmail'] = employeeEmail;
    map['employeeDesignation'] = employeeDesignation;
    map['password'] = password;
    if (assignedCandidates != null) {
      map['assignedCandidates'] = assignedCandidates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}