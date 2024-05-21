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

  PersonalDetails(
    this.name,
    this.gender,
    this.dob,
    this.mobile,
    this.email
  );
}
