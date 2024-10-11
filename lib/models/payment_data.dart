class PaymentData {
  int? grossPayBasicSalary;
  int? savings;
  int? payeCut;
  int? nhifCut;
  int? nssfCut;
  int? otherCuts;

  BankDetails? bankDetails;

  // Map<String, dynamic> otherCuts;

  PaymentData({
    this.grossPayBasicSalary,
    this.savings,
    this.payeCut,
    this.nhifCut,
    this.nssfCut,
    this.otherCuts,
    this.bankDetails,
  });

  bool get hasNullValue =>
      grossPayBasicSalary == null ||
      savings == null ||
      payeCut == null ||
      nhifCut == null ||
      nssfCut == null ||
      otherCuts == null;

// net salary calculator // todo net salary as property
  int get netPayBasicSalary =>
      (grossPayBasicSalary ?? 0) -
      (savings ?? 0) -
      (payeCut ?? 0) -
      (nhifCut ?? 0) -
      (nssfCut ?? 0) -
      (otherCuts ?? 0);

  // _otherCuts();

  // int _otherCuts() => otherCuts.values.reduce((a, b) => a + b);

  static PaymentData fromMap(Map<String, dynamic> paymentDetails) =>
      PaymentData(
        grossPayBasicSalary: paymentDetails['grossPayBasicSalary'],
        savings: paymentDetails['savings'],
        payeCut: paymentDetails['payeCut'],
        nhifCut: paymentDetails['nhifCut'],
        nssfCut: paymentDetails['nssfCut'],
        otherCuts: paymentDetails['otherCuts'],
        bankDetails: BankDetails.fromMap(paymentDetails['bankDetails']),
      );

  Map<String, dynamic> toMap() => {
        'grossPayBasicSalary': grossPayBasicSalary,
        'savings': savings,
        'payeCut': payeCut,
        'nhifCut': nhifCut,
        'nssfCut': nssfCut,
        'otherCuts': otherCuts,
        'netPay': netPayBasicSalary,
        'bankDetails': bankDetails?.toMap(),
      };
}

class BankDetails {
  String? bankName;
  int? bankCode;
  int? bankAccountNumber;

  BankDetails({
    this.bankName,
    this.bankCode,
    this.bankAccountNumber,
  });

  static BankDetails fromMap(Map<String, dynamic> bankDetails) => BankDetails(
        bankName: bankDetails['bankName'],
        bankCode: bankDetails['bankCode'],
        bankAccountNumber: bankDetails['bankAccountNumber'],
      );

  bool get hasNullValue =>
      bankName == null || bankCode == null || bankAccountNumber == null;

  Map<String, dynamic> toMap() => {
        'bankName': bankName ?? '',
        'bankCode': bankCode ?? '',
        'bankAccountNumber': bankAccountNumber ?? '',
      };
}
