class WitnessDetails {
  final String witnessName;
  final DateTime dateOfWitness;

  WitnessDetails({
    required this.witnessName,
    required this.dateOfWitness,
  });

  static WitnessDetails fromMap(Map<String, dynamic> witnessDetails) => WitnessDetails(
        witnessName: witnessDetails['witnessName'],
        dateOfWitness: witnessDetails['dateOfWitness'],
      );

  Map<String, dynamic> toMap() => {
        'witnessName': witnessName,
        'dateOfWitness': dateOfWitness,
      };
}
