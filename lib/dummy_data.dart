import './models/office_details.dart';
import './models/personal_data.dart';
import './models/family_data.dart';
import './models/address_data.dart';
import './models/next_of_kin.dart';
import './models/payment_data.dart';
import './models/date_specifications.dart';
import './models/witness_details.dart';

import './models/employee.dart';

final dummyEmployees = <Employee>[
  Employee(
    officeDetails: OfficeDetails(
        dateOfHire: DateTime(2024, 06, 12),
        employeePeriod: '6 Months',
        payrollNumber: 'HSS001',
        positionTitle: PositionTitle.contractGuard,
        workStation: Assignment.roseAvenue),
    personalData: PersonalData(
      surName: 'Mworia',
      otherNames: 'Vincent Mwenda',
      dateOfBirth: DateTime(2000, 04, 10),
      citizenship: 'Kenyan',
      identityNumber: 37248351,
      phoneNumber: 0726493355,
      kraPin: 'A0120403020Q',
      nhifNumber: 012021034234,
      nssfNumber: 13434234342,
      gender: Gender.male,
    ),
    familyData: FamilyData(
      relationship: 'Brother',
      dateOfBirth: DateTime(2000, 04, 10),
      identityNumber: 37248336,
      phoneNumber: 0737353185,
    ),
    addressData: AddressData(
      houseAndStreetAddress: 'MK42 Thome',
      county: 'Nairobi',
      currentResidence: 'Thome Estate',
    ),
    nextOfKin1: NextOfKin(relationship: 'Brother', mobileNumber: 07123456789),
    nextOfKin2: NextOfKin(relationship: 'Cousin', mobileNumber: 07123456789),
    paymentData: PaymentData(
      grossPayBasicSalary: 20000,
      nhifCut: 700,
      nssfCut: 1200,
      payeCut: 400,
      recoverBootCut: true, // Will recover 700 shillings
      savings: 450,
      bankDetails: BankDetails(
        bankAccountNumber: 01020408511233,
        bankCode: 026,
        bankName: 'Equity Bank',
      ),
    ),
    dateSpecifications: DateSpecifications(
      jobDescriptionReadAndSigned: DateTime(2000, 04, 10),
      staffCodeOfConductReadAndSigned: DateTime(2000, 04, 10),
    ),
    witnessDetails: WitnessDetails(
      witnessName: 'Kelvin Kithinji',
      dateOfWitness: DateTime(2024, 04, 10),
    ),
  ),

  Employee(
    officeDetails: OfficeDetails(
        dateOfHire: DateTime(2024, 06, 12),
        employeePeriod: '6 Months',
        payrollNumber: 'HSS002',
        positionTitle: PositionTitle.contractGuard,
        workStation: Assignment.roseAvenue),
    personalData: PersonalData(
      surName: 'Mworia',
      otherNames: 'Vincent Mwenda',
      dateOfBirth: DateTime(2000, 04, 10),
      citizenship: 'Kenyan',
      identityNumber: 37248351,
      phoneNumber: 0726493355,
      kraPin: 'A0120403020Q',
      nhifNumber: 012021034234,
      nssfNumber: 13434234342,
      gender: Gender.male,
    ),
    familyData: FamilyData(
      relationship: 'Brother',
      dateOfBirth: DateTime(2000, 04, 10),
      identityNumber: 37248336,
      phoneNumber: 0737353185,
    ),
    addressData: AddressData(
      houseAndStreetAddress: 'MK42 Thome',
      county: 'Nairobi',
      currentResidence: 'Thome Estate',
    ),
    nextOfKin1: NextOfKin(relationship: 'Brother', mobileNumber: 07123456789),
    nextOfKin2: NextOfKin(relationship: 'Cousin', mobileNumber: 07123456789),
    paymentData: PaymentData(
      grossPayBasicSalary: 20000,
      nhifCut: 700,
      nssfCut: 1200,
      payeCut: 400,
      recoverBootCut: true, // Will recover 700 shillings
      savings: 450,
      bankDetails: BankDetails(
        bankAccountNumber: 01020408511233,
        bankCode: 026,
        bankName: 'Equity Bank',
      ),
    ),
    dateSpecifications: DateSpecifications(
      jobDescriptionReadAndSigned: DateTime(2000, 04, 10),
      staffCodeOfConductReadAndSigned: DateTime(2000, 04, 10),
    ),
    witnessDetails: WitnessDetails(
      witnessName: 'Kelvin Kithinji',
      dateOfWitness: DateTime(2024, 04, 10),
    ),
  ),

  Employee(
    officeDetails: OfficeDetails(
        dateOfHire: DateTime(2024, 06, 12),
        employeePeriod: '6 Months',
        payrollNumber: 'HSS003',
        positionTitle: PositionTitle.contractGuard,
        workStation: Assignment.roseAvenue),
    personalData: PersonalData(
      surName: 'Mworia',
      otherNames: 'Vincent Mwenda',
      dateOfBirth: DateTime(2000, 04, 10),
      citizenship: 'Kenyan',
      identityNumber: 37248351,
      phoneNumber: 0726493355,
      kraPin: 'A0120403020Q',
      nhifNumber: 012021034234,
      nssfNumber: 13434234342,
      gender: Gender.male,
    ),
    familyData: FamilyData(
      relationship: 'Brother',
      dateOfBirth: DateTime(2000, 04, 10),
      identityNumber: 37248336,
      phoneNumber: 0737353185,
    ),
    addressData: AddressData(
      houseAndStreetAddress: 'MK42 Thome',
      county: 'Nairobi',
      currentResidence: 'Thome Estate',
    ),
    nextOfKin1: NextOfKin(relationship: 'Brother', mobileNumber: 07123456789),
    nextOfKin2: NextOfKin(relationship: 'Cousin', mobileNumber: 07123456789),
    paymentData: PaymentData(
      grossPayBasicSalary: 20000,
      nhifCut: 700,
      nssfCut: 1200,
      payeCut: 400,
      recoverBootCut: true, // Will recover 700 shillings
      savings: 450,
      bankDetails: BankDetails(
        bankAccountNumber: 01020408511233,
        bankCode: 026,
        bankName: 'Equity Bank',
      ),
    ),
    dateSpecifications: DateSpecifications(
      jobDescriptionReadAndSigned: DateTime(2000, 04, 10),
      staffCodeOfConductReadAndSigned: DateTime(2000, 04, 10),
    ),
    witnessDetails: WitnessDetails(
      witnessName: 'Kelvin Kithinji',
      dateOfWitness: DateTime(2024, 04, 10),
    ),
  ),

  Employee(
    officeDetails: OfficeDetails(
        dateOfHire: DateTime(2024, 06, 12),
        employeePeriod: '6 Months',
        payrollNumber: 'HSS004',
        positionTitle: PositionTitle.contractGuard,
        workStation: Assignment.roseAvenue),
    personalData: PersonalData(
      surName: 'Mworia',
      otherNames: 'Vincent Mwenda',
      dateOfBirth: DateTime(2000, 04, 10),
      citizenship: 'Kenyan',
      identityNumber: 37248351,
      phoneNumber: 0726493355,
      kraPin: 'A0120403020Q',
      nhifNumber: 012021034234,
      nssfNumber: 13434234342,
      gender: Gender.male,
    ),
    familyData: FamilyData(
      relationship: 'Brother',
      dateOfBirth: DateTime(2000, 04, 10),
      identityNumber: 37248336,
      phoneNumber: 0737353185,
    ),
    addressData: AddressData(
      houseAndStreetAddress: 'MK42 Thome',
      county: 'Nairobi',
      currentResidence: 'Thome Estate',
    ),
    nextOfKin1: NextOfKin(relationship: 'Brother', mobileNumber: 07123456789),
    nextOfKin2: NextOfKin(relationship: 'Cousin', mobileNumber: 07123456789),
    paymentData: PaymentData(
      grossPayBasicSalary: 20000,
      nhifCut: 700,
      nssfCut: 1200,
      payeCut: 400,
      recoverBootCut: true, // Will recover 700 shillings
      savings: 450,
      bankDetails: BankDetails(
        bankAccountNumber: 01020408511233,
        bankCode: 026,
        bankName: 'Equity Bank',
      ),
    ),
    dateSpecifications: DateSpecifications(
      jobDescriptionReadAndSigned: DateTime(2000, 04, 10),
      staffCodeOfConductReadAndSigned: DateTime(2000, 04, 10),
    ),
    witnessDetails: WitnessDetails(
      witnessName: 'Kelvin Kithinji',
      dateOfWitness: DateTime(2024, 04, 10),
    ),
  ),

];
