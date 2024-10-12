class WitnessDetails {
  String? witnessName;
  DateTime? dateOfWitness;

  WitnessDetails({
    this.witnessName,
    this.dateOfWitness,
  });

  bool get hasNullValue => witnessName == null || dateOfWitness == null;

  static WitnessDetails fromMap(Map<String, dynamic> witnessDetails) =>
      WitnessDetails(
        witnessName: witnessDetails['witnessName'],
        dateOfWitness: DateTime.parse(witnessDetails['dateOfWitness']),
      );

  Map<String, dynamic> toMap() => {
        'witnessName': witnessName,
        'dateOfWitness': dateOfWitness?.toIso8601String(),
      };
}
