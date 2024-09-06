class FamilyData {
  final String relationship;
  final DateTime dateOfBirth;
  final int identityNumber;
  final int phoneNumber;

  FamilyData({
    required this.relationship,
    required this.dateOfBirth,
    required this.identityNumber,
    required this.phoneNumber,
  });

  static FamilyData fromMap(Map<String, dynamic> familyData) => FamilyData(
        relationship: familyData['relationship'],
        dateOfBirth: DateTime.parse(familyData['dateOfBirth']),
        identityNumber: familyData['identityNumber'],
        phoneNumber: familyData['phoneNumber'],
      );

  Map<String, dynamic> toMap() => {
        'relationship': relationship,
        'dateOfBirth': dateOfBirth.toIso8601String(),
        'identityNumber': identityNumber,
        'phoneNumber': phoneNumber,
      };
}
