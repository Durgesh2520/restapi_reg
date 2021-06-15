class ProModel {
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String profilePic;

  ProModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.profilePic});

  ProModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobileNumber'] = this.mobileNumber;
    data['profilePic'] = this.profilePic;
    return data;
  }
}
