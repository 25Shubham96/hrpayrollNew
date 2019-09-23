import 'package:flutter/material.dart';
import 'package:hrpayroll/Network/ApiInterface.dart';
import 'package:hrpayroll/request_model/LeaveMasterRequest.dart';
import 'package:hrpayroll/response_model/EmployeeMasterResponse.dart';
import 'package:hrpayroll/response_model/LeaveMasterResponse.dart';
import 'package:hrpayroll/response_model/LookupResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './MyAppBar.dart';
import './MyDrawer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  void enterEmpDetailsToSharedPref(List<String> empNo, List<String> empName,
      List<String> empDesignation, List<String> empDepartment) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("empNo", empNo);
    sharedPreferences.setStringList("empName", empName);
    sharedPreferences.setStringList("empDesignation", empDesignation);
    sharedPreferences.setStringList("empDepartment", empDepartment);
  }

  void enterLeaveDetailsToSharedPref(
      List<String> leaveCode, List<String> leaveDescription) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("leaveCode", leaveCode);
    sharedPreferences.setStringList("leaveDescription", leaveDescription);
  }

  void enterLookupToSharedPref(String lookupNo, List<String> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    switch(lookupNo){
      case "13":{
        sharedPreferences.setStringList("assetType", data);
        break;
      }
      case "14":{
        sharedPreferences.setStringList("transactionType", data);
        break;
      }
      case "17":{
        sharedPreferences.setStringList("location", data);
        break;
      }
    }
  }

  ApiInterface _apiInterface1 = ApiInterface();
  ApiInterface _apiInterface2 = ApiInterface();
  ApiInterface _apiInterface3 = ApiInterface();
  ApiInterface _apiInterface4 = ApiInterface();
  ApiInterface _apiInterface5 = ApiInterface();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: MyAppBar.getAppBar("Welcome"),
      drawer: new MyDrawer(),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: _apiInterface3.LookupResponseData("13"),
            builder: (BuildContext context,
                AsyncSnapshot<LookupResponse> snapshot) {
              if (snapshot.hasData) {
                LookupResponse lookupResponse = snapshot.data;
                if (lookupResponse.status) {
                  List<String> data = List();

                  for (int i = 0; i < lookupResponse.data.length; i++) {
                    data.add(lookupResponse.data[i].lookupName);
                  }
                  enterLookupToSharedPref("13",data);
                }
                return Container();
              } else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: _apiInterface4.LookupResponseData("14"),
            builder: (BuildContext context,
                AsyncSnapshot<LookupResponse> snapshot) {
              if (snapshot.hasData) {
                LookupResponse lookupResponse = snapshot.data;
                if (lookupResponse.status) {
                  List<String> data = List();

                  for (int i = 0; i < lookupResponse.data.length; i++) {
                    data.add(lookupResponse.data[i].lookupName);
                  }
                  enterLookupToSharedPref("14",data);
                }
                return Container();
              } else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: _apiInterface5.LookupResponseData("17"),
            builder: (BuildContext context,
                AsyncSnapshot<LookupResponse> snapshot) {
              if (snapshot.hasData) {
                LookupResponse lookupResponse = snapshot.data;
                if (lookupResponse.status) {
                  List<String> data = List();

                  for (int i = 0; i < lookupResponse.data.length; i++) {
                    data.add(lookupResponse.data[i].lookupName);
                  }
                  enterLookupToSharedPref("17",data);
                }
                return Container();
              } else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: _apiInterface1.getEmpData(),
            builder: (BuildContext context,
                AsyncSnapshot<EmployeeMasterResponse> snapshot) {
              if (snapshot.hasData) {
                EmployeeMasterResponse employeeMasterResponse = snapshot.data;
                if (employeeMasterResponse.status) {
                  List<String> empNo = List();
                  List<String> empName = List();
                  List<String> empDesignation = List();
                  List<String> empDepartment = List();

                  for (int i = 0; i < employeeMasterResponse.data.length; i++) {
                    empNo.add(employeeMasterResponse.data[i].no);
                    empName.add(employeeMasterResponse.data[i].firstName +
                        " " +
                        employeeMasterResponse.data[i].lastName);
                    empDesignation
                        .add(employeeMasterResponse.data[i].designation);
                    empDepartment
                        .add(employeeMasterResponse.data[i].departmentCode);
                  }
                  enterEmpDetailsToSharedPref(
                      empNo, empName, empDesignation, empDepartment);
                }
                return Container();
              } else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          FutureBuilder(
            future: _apiInterface2.LeaveMasterResponseData(LeaveMasterRequest(
              action: 1,
            )),
            builder: (BuildContext context,
                AsyncSnapshot<LeaveMasterResponse> snapshot) {
              if (snapshot.hasData) {
                LeaveMasterResponse _myResponseData = snapshot.data;
                if (_myResponseData.status) {
                  List<String> leaveCode = List();
                  List<String> leaveDescription = List();

                  for (int i = 0; i < _myResponseData.data.length; i++) {
                    leaveCode.add(_myResponseData.data[i].leaveCode);
                    leaveDescription.add(_myResponseData.data[i].description);
                  }
                  enterLeaveDetailsToSharedPref(leaveCode, leaveDescription);
                }
                return Center(
                  child: Text("Welcome to Dashboard"),
                );
              } else {
                return Column(
                  children: <Widget>[
                    Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
                          ),
                          CircularProgressIndicator(),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text("Loading please wait...")
                        ],
                      ),
                    ),
                    Center(
                      child: Text("Welcome to Dashboard"),
                    ),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
