import 'package:insuranceprototype/Model/Candidate.dart';

class Employee {
  Employee({
      this.id, 
      this.employeeId, 
      this.employeeName, 
      this.employeeEmail, 
      this.employeeDesignation,
      this.assignedCandidates,});

  Employee.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    employeeEmail = json['employeeEmail'];
    employeeDesignation = json['employeeDesignation'];
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
  List<Candidate>? assignedCandidates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employeeId'] = employeeId;
    map['employeeName'] = employeeName;
    map['employeeEmail'] = employeeEmail;
    map['employeeDesignation'] = employeeDesignation;
    if (assignedCandidates != null) {
      map['assignedCandidates'] = assignedCandidates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'Employee{id: $id, employeeId: $employeeId, employeeName: $employeeName, employeeEmail: $employeeEmail, employeeDesignation: $employeeDesignation, assignedCandidates: $assignedCandidates}';
  }
}