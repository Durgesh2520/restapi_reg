class Registration {
  String mobileNumber;
  String language;

  Registration({this.mobileNumber, this.language});

  Registration.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNumber;
    data['language'] = this.language;
    return data;
  }
}
