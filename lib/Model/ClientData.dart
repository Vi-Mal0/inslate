import 'Address.dart';
import 'Bank.dart';
import 'Proof.dart';

class ClientData {
  int? id;
  String? surName;
  String? givenName;
  String? salutation;
  String? gender;
  String? marritalStatus;
  Address? address;
  String? mobileNumber;
  String? postalCode;
  String? country;
  String? nationality;
  String? nameFormat;
  bool? companyDoctor;
  String? birthDate;
  String? birthPlace;
  String? language;
  String? category;
  String? occupation;
  BankAccount? bankAccount;
  int? validFlag;
  List<Proof>? proofList;
  String? createdDate;
  String? modifiedDate;

  ClientData(
      {this.id,
        this.surName,
        this.givenName,
        this.salutation,
        this.gender,
        this.marritalStatus,
        this.address,
        this.mobileNumber,
        this.postalCode,
        this.country,
        this.nationality,
        this.nameFormat,
        this.companyDoctor,
        this.birthDate,
        this.birthPlace,
        this.language,
        this.category,
        this.occupation,
        this.bankAccount,
        this.validFlag,
        this.proofList,
        this.createdDate,
        this.modifiedDate});

  ClientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    surName = json['surName'];
    givenName = json['givenName'];
    salutation = json['salutation'];
    gender = json['gender'];
    marritalStatus = json['marritalStatus'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    mobileNumber = json['mobileNumber'];
    postalCode = json['postalCode'];
    country = json['country'];
    nationality = json['nationality'];
    nameFormat = json['nameFormat'];
    companyDoctor = json['companyDoctor'];
    birthDate = json['birthDate'];
    birthPlace = json['birthPlace'];
    language = json['language'];
    category = json['category'];
    occupation = json['occupation'];
    bankAccount = json['bankAccount'] != null
        ? BankAccount.fromJson(json['bankAccount'])
        : null;
    validFlag = json['validFlag'];
    if (json['proofList'] != null) {
      proofList = [];
      json['proofList'].forEach((v) {
        proofList!.add( Proof.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['surName'] = surName;
    data['givenName'] = givenName;
    data['salutation'] = salutation;
    data['gender'] = gender;
    data['marritalStatus'] = marritalStatus;
    if (address != null) {
      data['address'] = address?.toJson();
    }
    data['mobileNumber'] = mobileNumber;
    data['postalCode'] = postalCode;
    data['country'] = country;
    data['nationality'] = nationality;
    data['nameFormat'] = nameFormat;
    data['companyDoctor'] = companyDoctor;
    data['birthDate'] = birthDate;
    data['birthPlace'] = birthPlace;
    data['language'] = language;
    data['category'] = category;
    data['occupation'] = occupation;
    if (bankAccount != null) {
      data['bankAccount'] = bankAccount?.toJson();
    }
    data['validFlag'] = validFlag;
    if (proofList != null) {
      data['proofList'] = proofList?.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}