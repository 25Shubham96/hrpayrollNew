import 'dart:convert';

LeaveApproveListRequest leaveApproveListRequestFromJson(String str) =>
    LeaveApproveListRequest.fromJson(json.decode(str));

String leaveApproveListRequestToJson(LeaveApproveListRequest data) =>
    json.encode(data.toJson());

class LeaveApproveListRequest {
  int action;
  String senderId;
  int status;

  LeaveApproveListRequest({
    this.action,
    this.senderId,
    this.status,
  });

  factory LeaveApproveListRequest.fromJson(Map<String, dynamic> json) =>
      LeaveApproveListRequest(
        action: json["action"],
        senderId: json["senderId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "senderId": senderId,
        "status": status,
      };
}
