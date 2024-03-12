class GoogleSignInResponse {
  String? email;
  String? mob;
  String? url;
  String? name;
  String? lastLogInTime;

  GoogleSignInResponse(
      {this.email, this.mob, this.url, this.name, this.lastLogInTime});

  GoogleSignInResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    mob = json['mob'];
    url = json['url'];
    name = json['name'];
    lastLogInTime = json['lastLogInTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['mob'] = this.mob;
    data['url'] = this.url;
    data['name'] = this.name;
    data['lastLogInTime'] = this.lastLogInTime;
    return data;
  }
}
