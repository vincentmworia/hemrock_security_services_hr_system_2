class DateSpecifications {
  DateTime? jobDescriptionReadAndSignedDate;
  DateTime? staffCodeOfConductReadAndSignedDate;

  DateSpecifications({
    this.jobDescriptionReadAndSignedDate,
    this.staffCodeOfConductReadAndSignedDate,
  });

  static DateSpecifications fromMap(Map<String, dynamic> dateSpecifications) =>
      DateSpecifications(
        jobDescriptionReadAndSignedDate:
            DateTime.parse(dateSpecifications['jobDescriptionReadAndSigned']),
        staffCodeOfConductReadAndSignedDate: DateTime.parse(
            dateSpecifications['staffCodeOfConductReadAndSigned']),
      );

  bool get hasNullValue =>
      jobDescriptionReadAndSignedDate == null ||
      staffCodeOfConductReadAndSignedDate == null;

  Map<String, dynamic> toMap() => {
        'jobDescriptionReadAndSignedDate':
            jobDescriptionReadAndSignedDate?.toIso8601String(),
        'staffCodeOfConductReadAndSignedDate':
            staffCodeOfConductReadAndSignedDate?.toIso8601String(),
      };
}
