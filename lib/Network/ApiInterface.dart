import 'dart:async';

import 'package:hrpayroll/Network/Utils.dart';
import 'package:hrpayroll/request_model/AssessmentApprovalRequest.dart';
import 'package:hrpayroll/request_model/BusinessTripRequest.dart';
import 'package:hrpayroll/request_model/CompOffRequest.dart';
import 'package:hrpayroll/request_model/LeaveApplicationRequest.dart';
import 'package:hrpayroll/request_model/LeaveApprovalRequest.dart';
import 'package:hrpayroll/request_model/LeaveApproveListRequest.dart';
import 'package:hrpayroll/request_model/LeaveMasterRequest.dart';
import 'package:hrpayroll/request_model/NavigateRequest.dart';
import 'package:hrpayroll/request_model/OutOfOfficeRequest.dart';
import 'package:hrpayroll/request_model/PassportApprovalRequest.dart';
import 'package:hrpayroll/request_model/TrainingApprovalRequest.dart';
import 'package:hrpayroll/request_model/loginRequest.dart';
import 'package:hrpayroll/response_model/AssessmentApprovalResponse.dart';
import 'package:hrpayroll/response_model/BusinessTripResponse.dart';
import 'package:hrpayroll/response_model/CompOffResponse.dart';
import 'package:hrpayroll/response_model/EmployeeMasterResponse.dart';
import 'package:hrpayroll/response_model/LeaveApplicationResponse.dart';
import 'package:hrpayroll/response_model/LeaveApprovalResponse.dart';
import 'package:hrpayroll/response_model/LeaveApproveListResponse.dart';
import 'package:hrpayroll/response_model/LeaveMasterResponse.dart';
import 'package:hrpayroll/response_model/NavigateResponseCarryFwdInfo.dart';
import 'package:hrpayroll/response_model/NavigateResponseDesigLocHistory.dart';
import 'package:hrpayroll/response_model/NavigateResponseKRA.dart';
import 'package:hrpayroll/response_model/NavigateResponseKins.dart';
import 'package:hrpayroll/response_model/NavigateResponsePayElements.dart';
import 'package:hrpayroll/response_model/NavigateResponseShift.dart';
import 'package:hrpayroll/response_model/OutOfOFficeResponse.dart';
import 'package:hrpayroll/response_model/PassportApprovalResponse.dart';
import 'package:hrpayroll/response_model/RejectionCancellationResponse.dart';
import 'package:hrpayroll/response_model/TrainingApprovalResponse.dart';
import 'package:hrpayroll/response_model/loginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './ApiClient.dart';
import '../request_model/ActionRequest.dart';
import '../response_model/ActionResponse.dart';

class ApiInterface {
  ApiClient apiClient = ApiClient();
  static String EmpNo = "";

  Future<LoginResponse> checkLogin(LoginRequest data) async {
    apiClient.getClientPlain();

    var response = await apiClient.dio.post(
      "loginapi/login",
      data: loginReqToJson(data),
    );
    return loginResFromJson(response.toString());
  }

  Future<EmployeeMasterResponse> getEmpData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.get(
      "employeesapi/getemployees",
    );
    return employeeMasterFromJson(response.toString());
  }

  Future<ActionResponse> AssessmentSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/assessmentsanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> CompOffSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/compsanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> BusinessTripSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/businesssanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> OutofOfficeSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/outofficesanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> LeaveSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/leavesanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> TrainingSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/trainingsanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> EmployeeAssetSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/employeeassetsanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<ActionResponse> PassportSanctionResponseData(
      ActionRequest actionRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/passportsanction",
      data: actionReqToJson(actionRequest),
    );
    return actionResFromJson(response.toString());
  }

  Future<NavigateResponseKins> KinsResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/kins",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponseKinsFromJson(response.toString());
  }

  Future<NavigateResponseShift> ShiftResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/shift",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponseShiftFromJson(response.toString());
  }

  Future<NavigateResponseDesigLocHistory> DesignationResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/designation",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponseDesigLocHistoryFromJson(response.toString());
  }

  Future<NavigateResponseDesigLocHistory> LocationResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/location",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponseDesigLocHistoryFromJson(response.toString());
  }

  Future<NavigateResponseCarryFwdInfo> CarryFwdInfoResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/carryforward",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponseCarryFwdInfoFromJson(response.toString());
  }

  Future<NavigateResponseKRA> KRAResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/kra",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponseKRAFromJson(response.toString());
  }

  Future<NavigateResponsePayElements> PayElementResponseData(
      NavigateRequest navigateRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeesapi/payelements",
      data: navigateReqToJson(navigateRequest),
    );
    return navigateResponsePayElementsFromJson(response.toString());
  }

  Future<LeaveApprovalResponse> LeaveApprovalResponseData(
      LeaveApprovalRequest leaveApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "leavemasterapi/LeaveApprove",
      data: leaveApprovalRequestToJson(leaveApprovalRequest),
    );
    return leaveApprovalResponseFromJson(response.toString());
  }

  Future<RejCanResponse> LeaveRejCanResponseData(
      LeaveApprovalRequest leaveApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "leavemasterapi/leaveRejectCancel",
      data: leaveApprovalRequestToJson(leaveApprovalRequest),
    );
    return RejCanResFromJson(response.toString());
  }

  Future<TrainingApprovalResponse> TrainingApprovalResponseData(
      TrainingApprovalRequest trainingApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "trainingapi/trainingapproval",
      data: trainingApprovalRequestToJson(trainingApprovalRequest),
    );
    return trainingApprovalResponseFromJson(response.toString());
  }

  Future<RejCanResponse> TrainingRejCanResponseData(
      TrainingApprovalRequest trainingApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "trainingapi/TrainingRejectCancel",
      data: trainingApprovalRequestToJson(trainingApprovalRequest),
    );
    return RejCanResFromJson(response.toString());
  }

  Future<AssessmentApprovalResponse> AssessmentApprovalResponseData(
      AssessmentApprovalRequest assessmentApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeeassetapi/assetapproval",
      data: assessmentApprovalRequestToJson(assessmentApprovalRequest),
    );
    return assessmentApprovalResponseFromJson(response.toString());
  }

  Future<RejCanResponse> AssessmentRejCanResponseData(
      AssessmentApprovalRequest assessmentApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "employeeassetapi/AssetRejectCancel",
      data: assessmentApprovalRequestToJson(assessmentApprovalRequest),
    );
    return RejCanResFromJson(response.toString());
  }

  Future<PassportApprovalResponse> PassportApprovalResponseData(
      PassportApprovalRequest passportApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "passportapi/PassportApproval",
      data: passportApprovalRequestToJson(passportApprovalRequest),
    );
    return passportApprovalResponseFromJson(response.toString());
  }

  Future<RejCanResponse> PassportRejCanResponseData(
      PassportApprovalRequest passportApprovalRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "passportapi/PassportRejectCancel",
      data: passportApprovalRequestToJson(passportApprovalRequest),
    );
    return RejCanResFromJson(response.toString());
  }

  Future<LeaveMasterResponse> LeaveMasterResponseData(
      LeaveMasterRequest leaveMasterRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "LeaveMasterApi/Master",
      data: leaveMasterRequestToJson(leaveMasterRequest),
    );
    return leaveMasterResponseFromJson(response.toString());
  }

  Future<LeaveApplicationResponse> LeaveApplicationResponseData(
      LeaveApplicationRequest leaveApplicationRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "LeaveMasterApi/Application",
      data: leaveApplicationRequestToJson(leaveApplicationRequest),
    );
    return leaveApplicationResponseFromJson(response.toString());
  }

  Future<CompOffResponse> CompOffResponseData(
      CompOffRequest compOffRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "LeaveMasterApi/Compensatory",
      data: compOffRequestToJson(compOffRequest),
    );
    return compOffResponseFromJson(response.toString());
  }

  Future<OutOfOfficeResponse> OutOfOfficeResponseData(
      OutOfOfficeRequest outOfOfficeRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "LeaveMasterApi/OutOffice",
      data: outOfOfficeRequestToJson(outOfOfficeRequest),
    );
    return outOfOfficeResponseFromJson(response.toString());
  }

  Future<BusinessTripResponse> BusinessTripResponseData(
      BusinessTripRequest businessTripRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "LeaveMasterApi/Business",
      data: businessTripRequestToJson(businessTripRequest),
    );
    return businessTripResponseFromJson(response.toString());
  }

  Future<LeaveApproveListResponse> LeaveApproveListResponseData(
      LeaveApproveListRequest leaveApproveListRequest) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    apiClient.getClient(sharedPreferences.get(Util.sessionId));

    var response = await apiClient.dio.post(
      "leavemasterapi/GetApprovalList",
      data: leaveApproveListRequestToJson(leaveApproveListRequest),
    );
    return leaveApproveListResponseFromJson(response.toString());
  }
}
