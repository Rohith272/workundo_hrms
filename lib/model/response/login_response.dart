class LoginResponse {
  String? token;
  String? message;
  bool? success;

  LoginResponse(
      {
        this.token,
        this.success,
        this.message
      });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['sessionId'];
    message = json['message'];
    success = json['isSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sessionId'] = token;
    data['message'] = message;
    data['isSuccess'] = success;
    return data;
  }
}