enum Gender {
  male,
  female,
}

String getGenderString(Gender gender) =>
    gender == Gender.male ? 'Male' : 'Female';

Gender getGenderEnum(String gender) =>
    gender == 'Male' ? Gender.male : Gender.female;

class PersonalData {
  String? surName;
  String? otherNames;
  Gender? gender;
  DateTime? dateOfBirth;
  String? citizenship;
  int? identityNumber;
  int? phoneNumber;
  String? kraPin;
  int? nhifNumber;
  int? nssfNumber;

  PersonalData({
    this.surName,
    this.otherNames,
    this.gender,
    this.dateOfBirth,
    this.citizenship,
    this.identityNumber,
    this.phoneNumber,
    this.kraPin,
    this.nhifNumber,
    this.nssfNumber,
  });

  bool get hasNullValue =>
      surName == null ||
      otherNames == null ||
      gender == null ||
      dateOfBirth == null ||
      citizenship == null ||
      identityNumber == null ||
      phoneNumber == null ||
      kraPin == null ||
      nhifNumber == null ||
      nssfNumber == null;

  static PersonalData fromMap(Map<String, dynamic> personalData) =>
      PersonalData(
        surName: personalData['surName'],
        otherNames: personalData['otherNames'],
        gender: getGenderEnum(personalData['gender']),
        dateOfBirth: DateTime.parse(personalData['dateOfBirth']),
        citizenship: personalData['citizenship'],
        identityNumber: personalData['identityNumber'],
        phoneNumber: personalData['phoneNumber'],
        kraPin: personalData['kraPin'],
        nhifNumber: personalData['nhifNumber'],
        nssfNumber: personalData['nssfNumber'],
      );

  Map<String, dynamic> toMap() => {
        'surName': surName!,
        'otherNames': otherNames!,
        'gender': getGenderString(gender!),
        'dateOfBirth': dateOfBirth!.toIso8601String(),
        'citizenship': citizenship!,
        'identityNumber': identityNumber!,
        'phoneNumber': phoneNumber!,
        'kraPin': kraPin,
        'nhifNumber': nhifNumber,
        'nssfNumber': nssfNumber,
      };
}
