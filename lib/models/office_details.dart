enum PositionTitle {
  director,
  supervisor,
  administrator,
  contractGuard,
  relieverGuard
}

enum Assignment {
  roseAvenue,
  ruarakaSchool,
}

class OfficeDetails {
  final DateTime dateOfHire;
  final String payrollNumber;
  final PositionTitle positionTitle;
  final String employeePeriod;
  final Assignment workStation;

  OfficeDetails({
    required this.dateOfHire,
    required this.payrollNumber,
    required this.positionTitle,
    required this.employeePeriod,
    required this.workStation,
  });
}
