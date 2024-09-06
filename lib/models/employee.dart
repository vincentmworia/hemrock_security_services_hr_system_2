import './office_details.dart';
import './personal_data.dart';
import './family_data.dart';
import './address_data.dart';
import './next_of_kin.dart';
import './payment_data.dart';
import './date_specifications.dart';
import './witness_details.dart';

class Employee {
  // Payroll Number Key
  final String payrollNumber;

  // Personal Data
  final PersonalData personalData;

  // OfficeDetails
  final OfficeDetails officeDetails;

  // Family Data
  final FamilyData familyData;

  // Address
  final AddressData addressData;

  // Next Of Kin
  final NextOfKin nextOfKin1;
  final NextOfKin? nextOfKin2;

  // Basic Pay
  final PaymentData paymentData;

  // DateSpecifications
  final DateSpecifications dateSpecifications;

  // WitnessDetails
  final WitnessDetails witnessDetails;

  Employee({
    required this.payrollNumber,
    required this.officeDetails,
    required this.personalData,
    required this.familyData,
    required this.addressData,
    required this.nextOfKin1,
    required this.nextOfKin2,
    required this.paymentData,
    required this.dateSpecifications,
    required this.witnessDetails,
  });

  static fromMap(Map<String, dynamic> employee) => Employee(
        payrollNumber: employee.keys.first,
        personalData:
            PersonalData.fromMap(employee[employee.keys.first]['personalData']),
        officeDetails: OfficeDetails.fromMap(
            employee[employee.keys.first]['officeDetails']),
        familyData:
            FamilyData.fromMap(employee[employee.keys.first]['familyData']),
        addressData:
            AddressData.fromMap(employee[employee.keys.first]['addressData']),
        nextOfKin1:
            NextOfKin.fromMap(employee[employee.keys.first]['nextOfKin1']),
        nextOfKin2:
            NextOfKin.fromMap(employee[employee.keys.first]['nextOfKin2']),
        paymentData:
            PaymentData.fromMap(employee[employee.keys.first]['paymentData']),
        dateSpecifications: DateSpecifications.fromMap(
            employee[employee.keys.first]['dateSpecifications']),
        witnessDetails: WitnessDetails.fromMap(
            employee[employee.keys.first]['witnessDetails']),
      );

  Map<String, dynamic> toMap() => {
        payrollNumber: {
          'personalData': personalData.toMap(),
          'officeDetails': officeDetails.toMap(),
          'familyData': familyData.toMap(),
          'addressData': addressData.toMap(),
          'nextOfKin1': nextOfKin1.toMap(),
          'nextOfKin2': nextOfKin2?.toMap(),
          'paymentData': paymentData.toMap(),
          'dateSpecifications': dateSpecifications.toMap(),
          'witnessDetails': witnessDetails.toMap(),
        }
      };
}
