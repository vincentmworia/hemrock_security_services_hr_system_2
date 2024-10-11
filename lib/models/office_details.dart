enum PositionTitle {
  aDirector,
  bSupervisor,
  cAdministrator,
  dContractGuard,
  eRelieverGuard
}

const directorString = 'Director';
const supervisorString = 'Supervisor';
const administratorString = 'Administrator';
const contractGuardString = 'Contract Guard';
const relieverGuardString = 'Reliever Guard';

List<String> officePositions = [
  directorString,
  supervisorString,
  administratorString,
  contractGuardString,
  relieverGuardString
];

String getPositionTitleString(PositionTitle pos) {
  switch (pos) {
    case PositionTitle.aDirector:
      return directorString;
    case PositionTitle.bSupervisor:
      return supervisorString;
    case PositionTitle.cAdministrator:
      return administratorString;
    case PositionTitle.dContractGuard:
      return contractGuardString;
    case PositionTitle.eRelieverGuard:
      return relieverGuardString;
  }
}

PositionTitle getPositionTitleEnum(String pos) {
  switch (pos) {
    case directorString:
      return PositionTitle.aDirector;
    case supervisorString:
      return PositionTitle.bSupervisor;
    case administratorString:
      return PositionTitle.cAdministrator;
    case contractGuardString:
      return PositionTitle.dContractGuard;
    case relieverGuardString:
      return PositionTitle.eRelieverGuard;
    default:
      return PositionTitle.aDirector;
  }
}

class OfficeDetails {
  DateTime? dateOfHire;
  PositionTitle? positionTitle;
  int? employeePeriod;
  String? workStation;

  OfficeDetails({
    this.dateOfHire,
    this.positionTitle,
    this.employeePeriod,
    this.workStation,
  });

  bool get hasNullValue =>
      dateOfHire == null || positionTitle == null || employeePeriod == null;

  static OfficeDetails fromMap(Map<String, dynamic> officeDetails) =>
      OfficeDetails(
          dateOfHire: DateTime.parse(officeDetails['dateOfHire']),
          positionTitle: getPositionTitleEnum(officeDetails['positionTitle']),
          employeePeriod: officeDetails['employeePeriod'],
          workStation: officeDetails['workStation']);

  Map<String, dynamic> toMap() => {
        'dateOfHire': dateOfHire?.toIso8601String(),
        'positionTitle': getPositionTitleString(positionTitle!),
        'employeePeriod': employeePeriod,
        'workStation': workStation
      };
}
