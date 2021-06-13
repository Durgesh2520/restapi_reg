class LoginDetails {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;
  String accountId;
  String userName;
  List<String> topics;
  String customerId;
  String name;
  String acceptLanguage;
  bool guestUser;
  int ttl;
  String deviceId;
  String email;
  String jti;

  LoginDetails(
      {this.accessToken,
      this.tokenType,
      this.refreshToken,
      this.expiresIn,
      this.scope,
      this.accountId,
      this.userName,
      this.topics,
      this.customerId,
      this.name,
      this.acceptLanguage,
      this.guestUser,
      this.ttl,
      this.deviceId,
      this.email,
      this.jti});

  LoginDetails.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
    accountId = json['accountId'];
    userName = json['user_name'];
    topics = json['topics'].cast<String>();
    customerId = json['customerId'];
    name = json['name'];
    acceptLanguage = json['Accept-Language'];
    guestUser = json['guestUser'];
    ttl = json['ttl'];
    deviceId = json['deviceId'];
    email = json['email'];
    jti = json['jti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['expires_in'] = this.expiresIn;
    data['scope'] = this.scope;
    data['accountId'] = this.accountId;
    data['user_name'] = this.userName;
    data['topics'] = this.topics;
    data['customerId'] = this.customerId;
    data['name'] = this.name;
    data['Accept-Language'] = this.acceptLanguage;
    data['guestUser'] = this.guestUser;
    data['ttl'] = this.ttl;
    data['deviceId'] = this.deviceId;
    data['email'] = this.email;
    data['jti'] = this.jti;
    return data;
  }
}
