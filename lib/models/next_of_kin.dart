class NextOfKin {
  final String relationship;
  final int mobileNumber;

  NextOfKin({
    required this.relationship,
    required this.mobileNumber,
  });

  static NextOfKin fromMap(Map<String, dynamic> nextOfKin) => NextOfKin(
        relationship: nextOfKin['relationship'],
        mobileNumber: nextOfKin['mobileNumber'],
      );

  Map<String, dynamic> toMap() => {
        'relationship': relationship,
        'mobileNumber': mobileNumber,
      };
}
