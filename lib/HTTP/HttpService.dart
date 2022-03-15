import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:insuranceprototype/Model/Address.dart';
import 'package:insuranceprototype/Model/Agent.dart';
import 'package:insuranceprototype/Model/Bank.dart';
import 'package:insuranceprototype/Model/Candidate.dart';
import 'package:insuranceprototype/Model/ClientData.dart';
import 'package:insuranceprototype/Model/Employee.dart';
import 'package:insuranceprototype/Model/Proof.dart';
import 'package:insuranceprototype/Model/Quans.dart';

class HttpService {

  // Candidate

  Future<List<Candidate>> getCandidate() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/candidates/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Candidate> candidates =
          body.map((dynamic item) => Candidate.fromJson(item)).toList();
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<Candidate> getCandidateByID(id) async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/candidates/get/$id'));

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
      List<Candidate> candidates =
          body.map((dynamic item) => Candidate.fromJson(item)).toList();
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
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/param/' + id));
    if (res.statusCode == 200) {
      List<String> body = List<String>.from(jsonDecode(res.body) as List);
      return body;
    }
    throw Exception('Failed to load Param');
  }

  // Employee

  Future<List<Employee>> getEmployee() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/employee/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Employee> candidates =
          body.map((dynamic item) => Employee.fromJson(item)).toList();
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<Employee> getEmployeeByID(id) async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/employee/$id'));
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
        'employeeEmail': employee.employeeEmail,
        'password': employee.password
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
        "id": quans.id,
        "numericalAbility": quans.numericalAbility,
        "numericalAbilityComments": quans.numericalAbilityComments,
        "logicalReasoning": quans.logicalReasoning,
        "logicalReasoningComments": quans.logicalReasoningComments,
        "verbalAbility": quans.verbalAbility,
        "verbalAbilityComments": quans.verbalAbilityComments,
        "codingAndDecoding": quans.codingAndDecoding,
        "codingAndDecodingComments": quans.codingAndDecodingComments,
        "overallRating": quans.overallRating,
        "result": quans.result,
      }),
    );
    return Quans.fromJson(jsonDecode(response.body));
  }

  // Client

  Future<List<ClientData>> getClient() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/client/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ClientData> client =
          body.map((item) => ClientData.fromJson(item)).toList();
      return client;
    }
    throw Exception('Failed to load client');
  }

  Future<ClientData> createClient(ClientData client) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/client/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      'id' : client.id,
      'surName' : client.surName,
      'givenName' : client.givenName,
      'salutation' : client.salutation,
      'gender' : client.gender,
      'marritalStatus' : client.marritalStatus,
      'address' : client.address,
      'mobileNumber' : client.mobileNumber,
      'postalCode' : client.postalCode,
      'country' : client.country,
      'nationality' : client.nationality,
      'nameFormat' : client.nameFormat,
      'companyDoctor' :client.companyDoctor,
      'birthDate' : client.birthDate,
      'birthPlace' : client.birthPlace,
      'language' : client.language,
      'category' : client.category,
      'occupation' : client.occupation,
      'bankAccount' : client.bankAccount,
      'validFlag' : client.validFlag,
      'proofList' : client.proofList,
      'createdDate' : client.createdDate,
      'modifiedDate' : client.modifiedDate,

      }),
    );
    return ClientData.fromJson(jsonDecode(response.body));
  }

  Future<ClientData> updateClient(id,ClientData client) async {
    final response = await http.patch(
      Uri.parse('http://192.168.0.104:8080/client/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id' : client.id,
        'surName' : client.surName,
        'givenName' : client.givenName,
        'salutation' : client.salutation,
        'gender' : client.gender,
        'marritalStatus' : client.marritalStatus,
        'address' : client.address,
        'mobileNumber' : client.mobileNumber,
        'postalCode' : client.postalCode,
        'country' : client.country,
        'nationality' : client.nationality,
        'nameFormat' : client.nameFormat,
        'companyDoctor' :client.companyDoctor,
        'birthDate' : client.birthDate,
        'birthPlace' : client.birthPlace,
        'language' : client.language,
        'category' : client.category,
        'occupation' : client.occupation,
        'bankAccount' : client.bankAccount,
        'validFlag' : client.validFlag,
        'proofList' : client.proofList,
        'createdDate' : client.createdDate,
        'modifiedDate' : client.modifiedDate,

      }),
    );
    return ClientData.fromJson(jsonDecode(response.body));
  }

  // Agent

  Future<List<Agent>> getAgent() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/agent/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Agent> candidates =
          body.map((dynamic item) => Agent.fromJson(item)).toList();
      return candidates;
    }
    throw Exception('Failed to load agent');
  }

  Future<Agent> createAgent(Agent agent) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/agent/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id' : agent.id,
        'client' : agent.client,
        'dateAppointed': agent.dateAppointed,
        'exclusive' : agent.exclusive,
        'previousAgent' : agent.previousAgent,
        'prevDateOfTermination' : agent.prevDateOfTermination,
        'distributionChannel' : agent.distributionChannel,
        'branch' : agent.branch,
        'areaCode' : agent.areaCode,
        'agentType' : agent.agentType,
        'reportingTo' : agent.reportingTo,
        'payMethod' : agent.payMethod,
        'payFrequency' : agent.payFrequency,
        'currencyType' : agent.currencyType,
        'minimumAmount' : agent.minimumAmount,
        'bonusAllocation' : agent.bonusAllocation,
        'basicCommission' : agent.basicCommission,
        'renewalCommission' : agent.renewalCommission,
        'servicingCommission' : agent.servicingCommission,
        'commissionClass' : agent.commissionClass,
        'validFlag' : agent.validFlag,
        'createdDate' : agent.createdDate,
        'modifiedDate' : agent.modifiedDate,
      }),
    );
    return Agent.fromJson(jsonDecode(response.body));
  }

  Future<Agent> updateAgent(id ,Agent agent) async {
    final response = await http.patch(
      Uri.parse('http://192.168.0.104:8080/agent/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id' : agent.id,
        'client' : agent.client,
        'dateAppointed': agent.dateAppointed,
        'exclusive' : agent.exclusive,
        'previousAgent' : agent.previousAgent,
        'prevDateOfTermination' : agent.prevDateOfTermination,
        'distributionChannel' : agent.distributionChannel,
        'branch' : agent.branch,
        'areaCode' : agent.areaCode,
        'agentType' : agent.agentType,
        'reportingTo' : agent.reportingTo,
        'payMethod' : agent.payMethod,
        'payFrequency' : agent.payFrequency,
        'currencyType' : agent.currencyType,
        'minimumAmount' : agent.minimumAmount,
        'bonusAllocation' : agent.bonusAllocation,
        'basicCommission' : agent.basicCommission,
        'renewalCommission' : agent.renewalCommission,
        'servicingCommission' : agent.servicingCommission,
        'commissionClass' : agent.commissionClass,
        'validFlag' : agent.validFlag,
        'createdDate' : agent.createdDate,
        'modifiedDate' : agent.modifiedDate,
      }),
    );
    return Agent.fromJson(jsonDecode(response.body));
  }

  // Proof

  Future<List<Proof>> getProof() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/proof/getActive'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Proof> candidates =
          body.map((dynamic item) => Proof.fromJson(item)).toList();
      return candidates;
    }
    throw Exception('Failed to load proof');
  }

  Future<Proof> createProof(Proof proof) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/proof/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      'id' : proof.id,
      'proofName' : proof.proofName,
      'proofID' : proof.proofID,
      'proofPurpose' : proof.proofPurpose,
      'proofFile' : proof.proofFile,
      'createdTime' : proof.createdTime,
      'modifiedTime': proof.modifiedTime,
      }),
    );
    return Proof.fromJson(jsonDecode(response.body));
  }

  Future<Proof> updateProof(id,Proof proof) async {
    final response = await http.patch(
      Uri.parse('http://192.168.0.104:8080/proof/update/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id' : proof.id,
        'proofName' : proof.proofName,
        'proofID' : proof.proofID,
        'proofPurpose' : proof.proofPurpose,
        'proofFile' : proof.proofFile,
        'createdTime' : proof.createdTime,
        'modifiedTime': proof.modifiedTime,
      }),
    );
    return Proof.fromJson(jsonDecode(response.body));
  }

  // Address

  Future<List<Address>> getAddress() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/address/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Address> candidates =
          body.map((dynamic item) => Address.fromJson(item)).toList();
      return candidates;
    }
    throw Exception('Failed to load address');
  }

  Future<Address> createAddress(Address address) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/address/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
     'id': address.id,
     'toAddress' : address.toAddress,
     'addressLine1' : address.addressLine1,
      'addressLine2' : address.addressLine2,
      'city' : address.city,
      'state' : address.state,
      'country' : address.country,
      'pincode' : address.pincode,
      'addressType' : address.addressType,
      'isPresentAddress' : address.isPresentAddress,
      'validFlag' : address.validFlag,
      'createdDate' : address.createdDate,
      'modifiedDate' : address.modifiedDate,
      }),
    );
    return Address.fromJson(jsonDecode(response.body));
  }

  Future<Address> updateAddress(id,Address address) async {
    final response = await http.patch(
      Uri.parse('http://192.168.0.104:8080/address/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': address.id,
        'toAddress' : address.toAddress,
        'addressLine1' : address.addressLine1,
        'addressLine2' : address.addressLine2,
        'city' : address.city,
        'state' : address.state,
        'country' : address.country,
        'pincode' : address.pincode,
        'addressType' : address.addressType,
        'isPresentAddress' : address.isPresentAddress,
        'validFlag' : address.validFlag,
        'createdDate' : address.createdDate,
        'modifiedDate' : address.modifiedDate,
      }),
    );
    return Address.fromJson(jsonDecode(response.body));
  }


  //  Bank

  Future<List<Candidate>> getBank() async {
    Response res =
        await get(Uri.parse('http://192.168.0.104:8080/bank/getall'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Candidate> candidates =
          body.map((dynamic item) => Candidate.fromJson(item)).toList();
      return candidates;
    }
    throw Exception('Failed to load candidate');
  }

  Future<BankAccount> createBank(BankAccount bankAccount) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.104:8080/bank/add'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      'id' : bankAccount.id,
      'accountNumber' : bankAccount.accountNumber,
      'accountHolderName' : bankAccount.accountHolderName,
      'ifscCode' : bankAccount.ifscCode,
      'bankName' : bankAccount.bankName,
      'bankBranch' : bankAccount.bankBranch,
      'isActive' : bankAccount.isActive,
      'createdDate' : bankAccount.createdDate,
      'modifiedDate' : bankAccount.modifiedDate,
      }),
    );
    return BankAccount.fromJson(jsonDecode(response.body));
  }

  Future<BankAccount> updateBank(id,BankAccount bankAccount) async {
    final response = await http.patch(
      Uri.parse('http://192.168.0.104:8080/bank/$id'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
      'id' : bankAccount.id,
      'accountNumber' : bankAccount.accountNumber,
      'accountHolderName' : bankAccount.accountHolderName,
      'ifscCode' : bankAccount.ifscCode,
      'bankName' : bankAccount.bankName,
      'bankBranch' : bankAccount.bankBranch,
      'isActive' : bankAccount.isActive,
      'createdDate' : bankAccount.createdDate,
      'modifiedDate' : bankAccount.modifiedDate,
      }),
    );
    return BankAccount.fromJson(jsonDecode(response.body));
  }

}
