import 'dart:convert';

RejCanResponse RejCanResFromJson(String str) =>
    RejCanResponse.fromJson(json.decode(str));

String RejCanResToJson(RejCanResponse data) => json.encode(data.toJson());

class RejCanResponse {
  bool status;
  String message;
  List<dynamic> data;

  RejCanResponse({
    this.status,
    this.message,
    this.data,
  });

  factory RejCanResponse.fromJson(Map<String, dynamic> json) =>
      new RejCanResponse(
        status: json["status"],
        message: json["message"],
        data: new List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": new List<dynamic>.from(data.map((x) => x)),
      };
}
