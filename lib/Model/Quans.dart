class Quans {
  Quans({
      this.id, 
      this.numericalAbility, 
      this.numericalAbilityComments, 
      this.logicalReasoning, 
      this.logicalReasoningComments, 
      this.verbalAbility, 
      this.verbalAbilityComments, 
      this.codingAndDecoding, 
      this.codingAndDecodingComments, 
      this.overallRating, 
      this.result,});

  Quans.fromJson(dynamic json) {
    id = json['id'];
    numericalAbility = json['numericalAbility'];
    numericalAbilityComments = json['numericalAbilityComments'];
    logicalReasoning = json['logicalReasoning'];
    logicalReasoningComments = json['logicalReasoningComments'];
    verbalAbility = json['verbalAbility'];
    verbalAbilityComments = json['verbalAbilityComments'];
    codingAndDecoding = json['codingAndDecoding'];
    codingAndDecodingComments = json['codingAndDecodingComments'];
    overallRating = json['overallRating'];
    result = json['result'];
  }

  var id;
  var numericalAbility;
  var numericalAbilityComments;
  var logicalReasoning;
  var logicalReasoningComments;
  var verbalAbility;
  var verbalAbilityComments;
  var codingAndDecoding;
  var codingAndDecodingComments;
  var overallRating;
  var result;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['numericalAbility'] = numericalAbility;
    map['numericalAbilityComments'] = numericalAbilityComments;
    map['logicalReasoning'] = logicalReasoning;
    map['logicalReasoningComments'] = logicalReasoningComments;
    map['verbalAbility'] = verbalAbility;
    map['verbalAbilityComments'] = verbalAbilityComments;
    map['codingAndDecoding'] = codingAndDecoding;
    map['codingAndDecodingComments'] = codingAndDecodingComments;
    map['overallRating'] = overallRating;
    map['result'] = result;
    return map;
  }

  @override
  String toString() {
    return 'Quans{id: $id, numericalAbility: $numericalAbility, numericalAbilityComments: $numericalAbilityComments, logicalReasoning: $logicalReasoning, logicalReasoningComments: $logicalReasoningComments, verbalAbility: $verbalAbility, verbalAbilityComments: $verbalAbilityComments, codingAndDecoding: $codingAndDecoding, codingAndDecodingComments: $codingAndDecodingComments, overallRating: $overallRating, result: $result}';
  }
}