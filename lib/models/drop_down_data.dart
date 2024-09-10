class DropDownData {
  static const payrollNumber = 'Payroll Number';
  static const surName = 'Surname';
  static const otherNames = 'Other name(s)';
  static const workStation = 'Work Station';
  static const positionTitle = 'Position Title';

  DropDownData();

  static List<String> get stringList =>
      [payrollNumber, surName, otherNames, workStation, positionTitle];
}
