class DateSpecifications {
  final DateTime jobDescriptionReadAndSigned;
  final DateTime staffCodeOfConductReadAndSigned;

  DateSpecifications({
    required this.jobDescriptionReadAndSigned,
    required this.staffCodeOfConductReadAndSigned,
  });

  static  DateSpecifications fromMap(Map<String, dynamic> dateSpecifications) =>
      DateSpecifications(
        jobDescriptionReadAndSigned:
            DateTime.parse(dateSpecifications['jobDescriptionReadAndSigned']),
        staffCodeOfConductReadAndSigned:
            DateTime.parse(dateSpecifications['staffCodeOfConductReadAndSigned']),
      );

  Map<String, dynamic> toMap() => {
        'jobDescriptionReadAndSigned': jobDescriptionReadAndSigned.toIso8601String(),
        'staffCodeOfConductReadAndSigned': staffCodeOfConductReadAndSigned.toIso8601String(),
      };
}
