class PaymentData {
  final int grossPayBasicSalary;
  final int savings;
  final int payeCut;
  final int nhifCut;
  final int nssfCut;
  final Map<String, int> otherCuts;
  final BankDetails bankDetails;

  PaymentData({
    required this.grossPayBasicSalary,
    required this.savings,
    required this.payeCut,
    required this.nhifCut,
    required this.nssfCut,
    required this.otherCuts,
    required this.bankDetails,
  });

// net salary calculator // todo net salary as property
  int get netPayBasicSalary =>
      grossPayBasicSalary -
      savings -
      payeCut -
      nhifCut -
      nssfCut -
      _otherCuts();

  int _otherCuts() => otherCuts.values.reduce((a, b) => a + b);

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
        'bankDetails': bankDetails.toMap(),
      };
}

class BankDetails {
  final String bankName;
  final int bankCode;
  final int bankAccountNumber;

  BankDetails({
    required this.bankName,
    required this.bankCode,
    required this.bankAccountNumber,
  });

  static BankDetails fromMap(Map<String, dynamic> bankDetails) => BankDetails(
        bankName: bankDetails['bankName'],
        bankCode: bankDetails['bankCode'],
        bankAccountNumber: bankDetails['bankAccountNumber'],
      );

  Map<String, dynamic> toMap() => {
        'bankName': bankName,
        'bankCode': bankCode,
        'bankAccountNumber': bankAccountNumber,
      };
}
