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
            dateSpecifications['jobDescriptionReadAndSigned'],
        staffCodeOfConductReadAndSigned:
            dateSpecifications['staffCodeOfConductReadAndSigned'],
      );

  Map<String, dynamic> toMap() => {
        'jobDescriptionReadAndSigned': jobDescriptionReadAndSigned,
        'staffCodeOfConductReadAndSigned': staffCodeOfConductReadAndSigned,
      };
}
