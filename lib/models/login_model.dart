
class LoginModelResponse {
  final String? accessToken;

  LoginModelResponse({
    required this.accessToken,
  });

  factory LoginModelResponse.fromJson(Map<String, String> json) => LoginModelResponse(
    accessToken: json["access_token"],
  );

  Map<String, String> toJson() => {
    "access_token": accessToken??'',
  };
}



class LoginModelRequest {
  final String email;
  final String password;

  LoginModelRequest({
    required this.email,
    required this.password,
  });

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) =>
      LoginModelRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "password": password,
      };
}