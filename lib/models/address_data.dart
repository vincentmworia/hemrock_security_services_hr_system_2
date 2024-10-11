class AddressData {
  String? houseAndStreetAddress;
  String? county;
  String? currentResidence;

  AddressData({
    this.houseAndStreetAddress,
    this.county,
    this.currentResidence,
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
