class PaymentData {
  final double grossPayBasicSalary;
  final double savings;
  final double payeCut;
  final double nhifCut;
  final double nssfCut;
  bool recoverBootCut;
  final BankDetails bankDetails;

  PaymentData({
    required this.grossPayBasicSalary,
    required this.savings,
    required this.payeCut,
    required this.nhifCut,
    required this.nssfCut,
    required this.recoverBootCut, // todo 1400 (2@700), not constant
    required this.bankDetails,
  });

  double get netPayBasicSalary =>
      grossPayBasicSalary -
      savings -
      payeCut -
      nhifCut -
      nssfCut -
      (recoverBootCut ? 700.0 : 0.0);
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
}
