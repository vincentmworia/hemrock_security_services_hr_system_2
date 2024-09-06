import './models/office_details.dart';
import './models/personal_data.dart';
import './models/family_data.dart';
import './models/address_data.dart';
import './models/next_of_kin.dart';
import './models/payment_data.dart';
import './models/date_specifications.dart';
import './models/witness_details.dart';

import './models/employee.dart';

final employee1 = Employee(
    payrollNumber: 'HSS001',
    officeDetails: OfficeDetails(
        dateOfHire: DateTime(2024, 06, 12),
        employeePeriod: '6 Months',
        positionTitle: PositionTitle.dContractGuard,
        workStation: 'Rose Avenue'),
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
      savings: 450,
      bankDetails: BankDetails(
        bankAccountNumber: 01020408511233,
        bankCode: 026,
        bankName: 'Equity Bank',
      ),
      otherCuts: {'Boots': 700.0},
    ),
    dateSpecifications: DateSpecifications(
      jobDescriptionReadAndSigned: DateTime(2000, 04, 10),
      staffCodeOfConductReadAndSigned: DateTime(2000, 04, 10),
    ),
    witnessDetails: WitnessDetails(
      witnessName: 'Kelvin Kithinji',
      dateOfWitness: DateTime(2024, 04, 10),
    ));

final employee2 = Employee(
  payrollNumber: 'HSS002',
  officeDetails: OfficeDetails(
      dateOfHire: DateTime(2023, 06, 12),
      employeePeriod: '4 Months',
      positionTitle: PositionTitle.dContractGuard,
      workStation: 'Rose Avenue'),
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
    savings: 450,
    bankDetails: BankDetails(
      bankAccountNumber: 01020408511233,
      bankCode: 026,
      bankName: 'Equity Bank',
    ),
    otherCuts: {'Boots': 700.0},
  ),
  dateSpecifications: DateSpecifications(
    jobDescriptionReadAndSigned: DateTime(2000, 04, 10),
    staffCodeOfConductReadAndSigned: DateTime(2000, 04, 10),
  ),
  witnessDetails: WitnessDetails(
    witnessName: 'Kelvin Kithinji',
    dateOfWitness: DateTime(2024, 04, 10),
  ),
);

final dummyEmployees = <Map<String, dynamic>>[
  employee1.toMap(),
  employee2.toMap(),
];
/*

void main() {
  // All Employees API
  // print(dummyEmployees);

  // Employee to API
  // print(employee1.toMap());

  // API to Employee
  final employee = Employee.fromMap(employee2.toMap()) as Employee;
  print(employee.payrollNumber);
}
*/

