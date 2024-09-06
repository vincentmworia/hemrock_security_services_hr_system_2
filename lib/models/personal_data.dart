enum Gender {
  male,
  female,
}

class PersonalData {
  final String surName;
  final String otherNames;
  final Gender gender;
  final DateTime dateOfBirth;
  final String citizenship;
  final int identityNumber;
  final int phoneNumber;
  final String kraPin;
  final int nhifNumber;
  final int nssfNumber;

  PersonalData({
    required this.surName,
    required this.otherNames,
    required this.gender,
    required this.dateOfBirth,
    required this.citizenship,
    required this.identityNumber,
    required this.phoneNumber,
    required this.kraPin,
    required this.nhifNumber,
    required this.nssfNumber,
  });

  static PersonalData fromMap(Map<String, dynamic> personalData) => PersonalData(
        surName: personalData['surName'],
        otherNames: personalData['otherNames'],
        gender: personalData['gender'],
        dateOfBirth: personalData['dateOfBirth'],
        citizenship: personalData['citizenship'],
        identityNumber: personalData['identityNumber'],
        phoneNumber: personalData['phoneNumber'],
        kraPin: personalData['kraPin'],
        nhifNumber: personalData['nhifNumber'],
        nssfNumber: personalData['nssfNumber'],
      );

  Map<String, dynamic> toMap() => {
        'surName': surName,
        'otherNames': otherNames,
        'gender': gender,
        'dateOfBirth': dateOfBirth,
        'citizenship': citizenship,
        'identityNumber': identityNumber,
        'phoneNumber': phoneNumber,
        'kraPin': kraPin,
        'nhifNumber': nhifNumber,
        'nssfNumber': nssfNumber,
      };
}
