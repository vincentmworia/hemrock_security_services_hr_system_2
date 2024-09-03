import './office_details.dart';
import './personal_data.dart';
import './family_data.dart';
import './address_data.dart';
import './next_of_kin.dart';
import './payment_data.dart';
import './date_specifications.dart';
import './witness_details.dart';

class Employee {
  // OfficeDetails
  final OfficeDetails officeDetails;

  // Personal Data
  final PersonalData personalData;

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
}
