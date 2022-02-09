import 'Candidate.dart';

class Employee {
  Employee({
      this.id, 
      this.employeeId, 
      this.employeeName, 
      this.employeeDesignation, 
      this.assignedCandidates,});

  Employee.fromJson(dynamic json) {
    id = json['id'];
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    employeeDesignation = json['employeeDesignation'];
    if (json['assignedCandidates'] != null) {
      assignedCandidates = [];
      json['assignedCandidates'].forEach((v) {
        assignedCandidates.add(Candidate.fromJson(v));
      });
    }
  }

  var id;
  var employeeId;
  var employeeName;
  var employeeDesignation;
  var assignedCandidates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employeeId'] = employeeId;
    map['employeeName'] = employeeName;
    map['employeeDesignation'] = employeeDesignation;
    if (assignedCandidates != null) {
      map['assignedCandidates'] = assignedCandidates.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'Employee{id: $id, employeeId: $employeeId, employeeName: $employeeName, employeeDesignation: $employeeDesignation, assignedCandidates: $assignedCandidates}';
  }
}