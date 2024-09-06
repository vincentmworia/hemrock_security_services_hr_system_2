enum PositionTitle {
  aDirector,
  bSupervisor,
  cAdministrator,
  dContractGuard,
  eRelieverGuard
}

const _directorString = 'Director';
const _supervisorString = 'Supervisor';
const _administratorString = 'Administrator';
const _contractGuardString = 'Contract Guard';
const _relieverGuardString = 'Reliever Guard';

String _getPositionTitleString(PositionTitle pos) {
  switch (pos) {
    case PositionTitle.aDirector:
      return _directorString;
    case PositionTitle.bSupervisor:
      return _supervisorString;
    case PositionTitle.cAdministrator:
      return _administratorString;
    case PositionTitle.dContractGuard:
      return _contractGuardString;
    case PositionTitle.eRelieverGuard:
      return _relieverGuardString;
  }
}

PositionTitle _returnPositonTitle(String pos) {
  switch (pos) {
    case _directorString:
      return PositionTitle.aDirector;
    case _supervisorString:
      return PositionTitle.bSupervisor;
    case _administratorString:
      return PositionTitle.cAdministrator;
    case _contractGuardString:
      return PositionTitle.dContractGuard;
    case _relieverGuardString:
      return PositionTitle.eRelieverGuard;
    default:
      return PositionTitle.aDirector;
  }
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
          dateOfHire: DateTime.parse(officeDetails['dateOfHire']),
          positionTitle: _returnPositonTitle(officeDetails['positionTitle']),
          employeePeriod: officeDetails['employeePeriod'],
          workStation: officeDetails['workStation']);

  Map<String, dynamic> toMap() => {
        'dateOfHire': dateOfHire.toIso8601String(),
        'positionTitle': _getPositionTitleString(positionTitle),
        'employeePeriod': employeePeriod,
        'workStation': workStation
      };
}
