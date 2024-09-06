import './models/employee.dart';

var dataInDatabase = {
  "HSS001": {
    "addressData": {
      "county": "Nairobi",
      "currentResidence": "Thome Estate",
      "houseAndStreetAddress": "MK42 Thome"
    },
    "dateSpecifications": {
      "jobDescriptionReadAndSigned": "2000-04-10T00:00:00.000",
      "staffCodeOfConductReadAndSigned": "2000-04-10T00:00:00.000"
    },
    "familyData": {
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "identityNumber": 37248336,
      "phoneNumber": 737353185,
      "relationship": "Brother"
    },
    "nextOfKin1": {"mobileNumber": 7123456789, "relationship": "Brother"},
    "nextOfKin2": {"mobileNumber": 7123456789, "relationship": "Cousin"},
    "officeDetails": {
      "dateOfHire": "2024-06-12T00:00:00.000",
      "employeePeriod": "6 Months",
      "positionTitle": "Contract Guard",
      "workStation": "Rose Avenue"
    },
    "paymentData": {
      "bankDetails": {
        "bankAccountNumber": 1020408511233,
        "bankCode": 26,
        "bankName": "Equity Bank"
      },
      "grossPayBasicSalary": 20000,
      "nhifCut": 700,
      "nssfCut": 1200,
      "otherCuts": {"Boots": 700, "Deni": 300},
      "payeCut": 400,
      "savings": 450
    },
    "personalData": {
      "citizenship": "Kenyan",
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "gender": "male",
      "identityNumber": 37248351,
      "kraPin": "A0120403020Q",
      "nhifNumber": 12021034234,
      "nssfNumber": 13434234342,
      "otherNames": "Vincent Mwenda",
      "phoneNumber": 726493355,
      "surName": "Mworia"
    },
    "witnessDetails": {
      "dateOfWitness": "2024-04-10T00:00:00.000",
      "witnessName": "Kelvin Kithinji"
    }
  },
  "HSS002": {
    "addressData": {
      "county": "Nairobi",
      "currentResidence": "Thome Estate",
      "houseAndStreetAddress": "MK42 Thome"
    },
    "dateSpecifications": {
      "jobDescriptionReadAndSigned": "2000-04-10T00:00:00.000",
      "staffCodeOfConductReadAndSigned": "2000-04-10T00:00:00.000"
    },
    "familyData": {
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "identityNumber": 37248336,
      "phoneNumber": 737353185,
      "relationship": "Brother"
    },
    "nextOfKin1": {"mobileNumber": 7123456789, "relationship": "Brother"},
    "nextOfKin2": {"mobileNumber": 7123456789, "relationship": "Cousin"},
    "officeDetails": {
      "dateOfHire": "2024-06-12T00:00:00.000",
      "employeePeriod": "6 Months",
      "positionTitle": "Contract Guard",
      "workStation": "Rose Avenue"
    },
    "paymentData": {
      "bankDetails": {
        "bankAccountNumber": 1020408511233,
        "bankCode": 26,
        "bankName": "Equity Bank"
      },
      "grossPayBasicSalary": 20000,
      "nhifCut": 700,
      "nssfCut": 1200,
      "otherCuts": {"Boots": 700, "Deni": 300},
      "payeCut": 400,
      "savings": 450
    },
    "personalData": {
      "citizenship": "Kenyan",
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "gender": "male",
      "identityNumber": 37248351,
      "kraPin": "A0120403020Q",
      "nhifNumber": 12021034234,
      "nssfNumber": 13434234342,
      "otherNames": "Vincent Mwenda",
      "phoneNumber": 726493355,
      "surName": "Mworia"
    },
    "witnessDetails": {
      "dateOfWitness": "2024-04-10T00:00:00.000",
      "witnessName": "Kelvin Kithinji"
    }
  },
  "HSS003": {
    "addressData": {
      "county": "Nairobi",
      "currentResidence": "Thome Estate",
      "houseAndStreetAddress": "MK42 Thome"
    },
    "dateSpecifications": {
      "jobDescriptionReadAndSigned": "2000-04-10T00:00:00.000",
      "staffCodeOfConductReadAndSigned": "2000-04-10T00:00:00.000"
    },
    "familyData": {
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "identityNumber": 37248336,
      "phoneNumber": 737353185,
      "relationship": "Brother"
    },
    "nextOfKin1": {"mobileNumber": 7123456789, "relationship": "Brother"},
    "nextOfKin2": {"mobileNumber": 7123456789, "relationship": "Cousin"},
    "officeDetails": {
      "dateOfHire": "2024-06-12T00:00:00.000",
      "employeePeriod": "6 Months",
      "positionTitle": "Contract Guard",
      "workStation": "Rose Avenue"
    },
    "paymentData": {
      "bankDetails": {
        "bankAccountNumber": 1020408511233,
        "bankCode": 26,
        "bankName": "Equity Bank"
      },
      "grossPayBasicSalary": 20000,
      "nhifCut": 700,
      "nssfCut": 1200,
      "otherCuts": {"Boots": 700, "Deni": 300},
      "payeCut": 400,
      "savings": 450
    },
    "personalData": {
      "citizenship": "Kenyan",
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "gender": "male",
      "identityNumber": 37248351,
      "kraPin": "A0120403020Q",
      "nhifNumber": 12021034234,
      "nssfNumber": 13434234342,
      "otherNames": "Vincent Mwenda",
      "phoneNumber": 726493355,
      "surName": "Mworia"
    },
    "witnessDetails": {
      "dateOfWitness": "2024-04-10T00:00:00.000",
      "witnessName": "Kelvin Kithinji"
    }
  },
  "HSS004": {
    "addressData": {
      "county": "Nairobi",
      "currentResidence": "Thome Estate",
      "houseAndStreetAddress": "MK42 Thome"
    },
    "dateSpecifications": {
      "jobDescriptionReadAndSigned": "2000-04-10T00:00:00.000",
      "staffCodeOfConductReadAndSigned": "2000-04-10T00:00:00.000"
    },
    "familyData": {
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "identityNumber": 37248336,
      "phoneNumber": 737353185,
      "relationship": "Brother"
    },
    "nextOfKin1": {"mobileNumber": 7123456789, "relationship": "Brother"},
    "nextOfKin2": {"mobileNumber": 7123456789, "relationship": "Cousin"},
    "officeDetails": {
      "dateOfHire": "2024-06-12T00:00:00.000",
      "employeePeriod": "6 Months",
      "positionTitle": "Contract Guard",
      "workStation": "Rose Avenue"
    },
    "paymentData": {
      "bankDetails": {
        "bankAccountNumber": 1020408511233,
        "bankCode": 26,
        "bankName": "Equity Bank"
      },
      "grossPayBasicSalary": 20000,
      "nhifCut": 700,
      "nssfCut": 1200,
      "otherCuts": {"Boots": 700, "Deni": 300},
      "payeCut": 400,
      "savings": 450
    },
    "personalData": {
      "citizenship": "Kenyan",
      "dateOfBirth": "2000-04-10T00:00:00.000",
      "gender": "male",
      "identityNumber": 37248351,
      "kraPin": "A0120403020Q",
      "nhifNumber": 12021034234,
      "nssfNumber": 13434234342,
      "otherNames": "Vincent Mwenda",
      "phoneNumber": 726493355,
      "surName": "Mworia"
    },
    "witnessDetails": {
      "dateOfWitness": "2024-04-10T00:00:00.000",
      "witnessName": "Kelvin Kithinji"
    }
  }
};

void main() {
  final dat =Employee.fromMap(dataInDatabase) as Employee;
  print(dat.paymentData.netPayBasicSalary);
}
