class Event {
  int? id;
  String? notificationType;
  String? notificationPriority;
  int? employeeId;
  int? candidateId;
  String? notificationText;
  String? creationDate;
  String? modifiedTime;

  Event(
      {this.id,
        this.notificationType,
        this.notificationPriority,
        this.employeeId,
        this.candidateId,
        this.notificationText,
        this.creationDate,
        this.modifiedTime});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationType = json['notificationType'];
    notificationPriority = json['notificationPriority'];
    employeeId = json['employeeId'];
    candidateId = json['candidateId'];
    notificationText = json['notificationText'];
    creationDate = json['creationDate'];
    modifiedTime = json['modifiedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['notificationType'] = notificationType;
    data['notificationPriority'] = notificationPriority;
    data['employeeId'] = employeeId;
    data['candidateId'] = candidateId;
    data['notificationText'] = notificationText;
    data['creationDate'] = creationDate;
    data['modifiedTime'] = modifiedTime;
    return data;
  }
}