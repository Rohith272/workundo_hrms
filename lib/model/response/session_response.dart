class SessionResponse {
  String? message;
  bool? success;

  SessionResponse(
      {
        this.success,
        this.message
      });

  SessionResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    success = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['isActive'] = success;
    return data;
  }
}