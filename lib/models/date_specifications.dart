class DateSpecifications {
  final DateTime jobDescriptionReadAndSignedDate;
  final DateTime staffCodeOfConductReadAndSignedDate;

  DateSpecifications({
    required this.jobDescriptionReadAndSignedDate,
    required this.staffCodeOfConductReadAndSignedDate,
  });

  static  DateSpecifications fromMap(Map<String, dynamic> dateSpecifications) =>
      DateSpecifications(
        jobDescriptionReadAndSignedDate:
            DateTime.parse(dateSpecifications['jobDescriptionReadAndSignedDate']),
        staffCodeOfConductReadAndSignedDate:
            DateTime.parse(dateSpecifications['staffCodeOfConductReadAndSignedDate']),
      );

  Map<String, dynamic> toMap() => {
        'jobDescriptionReadAndSignedDate': jobDescriptionReadAndSignedDate.toIso8601String(),
        'staffCodeOfConductReadAndSignedDate': staffCodeOfConductReadAndSignedDate.toIso8601String(),
      };
}
