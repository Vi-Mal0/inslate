import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:insuranceprototype/Model/Employee.dart';
import 'package:insuranceprototype/Model/Quans.dart';

class HttpService {


  // Candidate

  Future<List<Candidate>> getCandidate() async {
    Response res = await get(
        Uri.parse('http://192.168.0.104:8080/candidates/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Candidate> candidates = body.map((dynamic item) =>
          Candidate.fromJson(item))
          .toList();
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<Candidate> getCandidateByID(id) async {
    Response res = await get(
        Uri.parse('http://192.168.0.104:8080/candidates/get/$id'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      Candidate candidates = Candidate.fromJson(body);
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<List<Candidate>> searchCandidate(String keyword) async {
    Response res = await get(
        Uri.parse('http://192.168.0.104:8080/candidates/search/$keyword'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Candidate> candidates = body.map((dynamic item) =>
          Candidate.fromJson(item))
          .toList();
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<Candidate> updateCandidate(id, Candidate candidate) async {
    final response = await http.patch(
      Uri.parse('http://192.168.0.104:8080/candidates/update/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': candidate.id,
        'name': candidate.name,
        'mobileNumber': candidate.mobileNumber,
        'email': candidate.email,
        'dateOfBirth': candidate.dateOfBirth,
        'highestQualification': candidate.highestQualification,
        'proof': candidate.proof,
        'proofId': candidate.proofId,
        'communication': candidate.communication,
        'availableDateAndTime': candidate.availableDateAndTime,
        'employee': candidate.employee,
        'currentStatus': candidate.currentStatus
      }),
    );
    return Candidate.fromJson(jsonDecode(response.body));

  }

  Future<Candidate> createCandidate(Candidate candidate) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/candidates/savedetails'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': candidate.id,
        'name': candidate.name,
        'mobileNumber': candidate.mobileNumber,
        'email': candidate.email,
        'dateOfBirth': candidate.dateOfBirth,
        'highestQualification': candidate.highestQualification,
        'proof': candidate.proof,
        'proofId': candidate.proofId,
        'communication': candidate.communication,
        'availableDateAndTime': candidate.availableDateAndTime,
        'employee': candidate.employee,
        'currentStatus': candidate.currentStatus
      }),
    );
    return Candidate.fromJson(jsonDecode(response.body));
  }


  // Parameter

  Future<List<String>> getParam(String id) async {
    Response res = await get(
        Uri.parse('http://192.168.0.104:8080/param/' + id));
    if (res.statusCode == 200) {
      List<String> body = List<String>.from(jsonDecode(res.body) as List);
      return body;
    }
    throw Exception('Failed to load Param');
  }

  // Employee

  Future<List<Employee>> getEmployee() async {
    Response res = await get(
        Uri.parse('http://192.168.0.104:8080/employee/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Employee> candidates = body.map((dynamic item) =>
          Employee.fromJson(item))
          .toList();
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<Employee> getEmployeeByID(id) async {
    Response res = await get(
        Uri.parse('http://192.168.0.104:8080/employee/$id'));
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      Employee candidates = Employee.fromJson(body);
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<Employee> login(Employee employee) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/employee/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      'employeeEmail' : employee.employeeEmail,
      'password' : employee.password
      }),
    );
    return Employee.fromJson(jsonDecode(response.body));
  }

  // Quantitative Table

  Future<Quans> createQuans(Quans quans) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/quants/save'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      "id" : quans.id,
      "numericalAbility" : quans.numericalAbility,
      "numericalAbilityComments" : quans.numericalAbilityComments,
      "logicalReasoning" : quans.logicalReasoning,
      "logicalReasoningComments" : quans.logicalReasoningComments,
      "verbalAbility" : quans.verbalAbility,
      "verbalAbilityComments" : quans.verbalAbilityComments,
      "codingAndDecoding" : quans.codingAndDecoding,
      "codingAndDecodingComments" : quans.codingAndDecodingComments,
      "overallRating" : quans.overallRating,
      "result" :quans.result,
      }),
    );
    return Quans.fromJson(jsonDecode(response.body));
  }

}