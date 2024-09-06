class AddressData {
  final String houseAndStreetAddress;
  final String county;
  final String currentResidence;

  AddressData({
    required this.houseAndStreetAddress,
    required this.county,
    required this.currentResidence,
  });

  static AddressData fromMap(Map<String, dynamic> addressData) => AddressData(
      houseAndStreetAddress: addressData['houseAndStreetAddress'],
      county: addressData['county'],
      currentResidence: addressData['currentResidence']);

  Map<String, dynamic> toMap() => {
        'houseAndStreetAddress': houseAndStreetAddress,
        'county': county,
        'currentResidence': currentResidence,
      };
}
