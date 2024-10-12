class NextOfKin {
  String? relationship;
  int? mobileNumber;

  NextOfKin({
    this.relationship,
    this.mobileNumber,
  });

  bool get hasNullValue => relationship == null || mobileNumber == null;

  static NextOfKin fromMap(Map<String, dynamic> nextOfKin) => NextOfKin(
        relationship: nextOfKin['relationship'],
        mobileNumber: nextOfKin['mobileNumber'],
      );

  Map<String, dynamic> toMap() => {
        'relationship': relationship,
        'mobileNumber': mobileNumber,
      };
}
