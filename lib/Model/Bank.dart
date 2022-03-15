class BankAccount {
  int? id;
  String? accountNumber;
  String? accountHolderName;
  String? ifscCode;
  String? bankName;
  String? bankBranch;
  int? isActive;
  String? createdDate;
  String? modifiedDate;

  BankAccount(
      {this.id,
        this.accountNumber,
        this.accountHolderName,
        this.ifscCode,
        this.bankName,
        this.bankBranch,
        this.isActive,
        this.createdDate,
        this.modifiedDate});

  BankAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountNumber = json['accountNumber'];
    accountHolderName = json['accountHolderName'];
    ifscCode = json['ifscCode'];
    bankName = json['bankName'];
    bankBranch = json['bankBranch'];
    isActive = json['isActive'];
    createdDate = json['createdDate'];
    modifiedDate = json['modifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accountNumber'] = accountNumber;
    data['accountHolderName'] = accountHolderName;
    data['ifscCode'] = ifscCode;
    data['bankName'] = bankName;
    data['bankBranch'] = bankBranch;
    data['isActive'] = isActive;
    data['createdDate'] = createdDate;
    data['modifiedDate'] = modifiedDate;
    return data;
  }
}