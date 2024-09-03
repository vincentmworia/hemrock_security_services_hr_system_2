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
}