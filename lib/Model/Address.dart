class Address {
  int? id;
  String? toAddress;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? addressType;
  bool? isPresentAddress;
  int? validFlag;
  String? createdDate;
  String? modifiedDate;

  Address(
      {this.id,
        this.toAddress,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.state,
        this.country,
        this.pincode,
        this.addressType,
        this.isPresentAddress,
        this.validFlag,
        this.createdDate,
        this.modifiedDate});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    toAddress = json['toAddress'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    addressType = json['addressType'];
    isPresentAddress = json['isPresentAddress'];
    validFlag = json['validFlag'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['toAddress'] = toAddress;
    data['addressLine1'] = addressLine1;
    data['addressLine2'] = addressLine2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['pincode'] = pincode;
    data['addressType'] = addressType;
    data['isPresentAddress'] = isPresentAddress;
    data['validFlag'] = validFlag;
    data['createdDate'] = createdDate;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}