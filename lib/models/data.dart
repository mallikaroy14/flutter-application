class Data {
  String text;
  String image;

  Data(this.text, this.image);
}

class ProfileAddress {
  String addressType;
  String addressValue;

  ProfileAddress(this.addressType, this.addressValue);
}

class PersonalDetail {
  Map<String, String> details;

  PersonalDetail({required this.details});
}

class PersonalDetails {
  String name;
  String gender;
  String dob;
  String mobile;
  String email;

  PersonalDetails(this.name, this.gender, this.dob, this.mobile, this.email);
}

class ServiceRequestData {
  ServiceRequestData(this.lanNo, this.serviceType, this.amount,
      this.requestedDate, this.status, this.subTitle);

  String lanNo;
  String serviceType;
  String amount;
  String requestedDate;
  String status;
  String subTitle;
}

class RejectedLoanSummary{

  RejectedLoanSummary(this.appliedAmount, this.borrowersName, this.source, this.rmName, this.contactNo, this.date);
  String appliedAmount;
  String borrowersName;
  String source;
  String rmName;
  String contactNo;
  String date;

}
