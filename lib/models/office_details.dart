enum PositionTitle {
  aDirector,
  bSupervisor,
  cAdministrator,
  dContractGuard,
  eRelieverGuard
}

class OfficeDetails {
  final DateTime dateOfHire;
  final PositionTitle positionTitle;
  final String employeePeriod;
  final String workStation;

  OfficeDetails({
    required this.dateOfHire,
    required this.positionTitle,
    required this.employeePeriod,
    required this.workStation,
  });

  static OfficeDetails fromMap(Map<String, dynamic> officeDetails) =>
      OfficeDetails(
          dateOfHire: officeDetails['dateOfHire'],
          positionTitle: officeDetails['positionTitle'],
          employeePeriod: officeDetails['employeePeriod'],
          workStation: officeDetails['workStation']);

  Map<String, dynamic> toMap() => {
        'dateOfHire': dateOfHire,
        'positionTitle': positionTitle,
        'employeePeriod': employeePeriod,
        'workStation': workStation
      };
}
