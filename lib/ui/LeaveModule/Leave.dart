import 'package:flutter/material.dart';
import 'package:hrpayroll/ui/LeaveModule/BusinessTrip.dart';
import 'package:hrpayroll/ui/LeaveModule/LeaveMaster.dart';
import 'package:hrpayroll/ui/LeaveModule/OutOfOffice.dart';

import '../TabbedAppBar.dart';
import 'CompOff.dart';
import 'LeaveApplication.dart';
import 'LeaveApproveList.dart';

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  List<Tab> tabs = List<Tab>();
  List<Widget> tabContent = List<Widget>();

  @override
  Widget build(BuildContext context) {
    tabs.add(new Tab(
      text: "Leave Master",
    ));
    tabs.add(new Tab(
      text: "Leave Application",
    ));
    tabs.add(new Tab(
      text: "Compansatory Off",
    ));
    tabs.add(new Tab(
      text: "Out of Office",
    ));
    tabs.add(new Tab(
      text: "Business Trip",
    ));
    tabs.add(new Tab(
      text: "Approve List",
    ));

    tabContent.add(LeaveMaster());
    tabContent.add(LeaveApplication());
    tabContent.add(CompOff());
    tabContent.add(OutOfOffice());
    tabContent.add(BusinessTrip());
    tabContent.add(LeaveApproveList());

    return TabAppBar.getTabbedAppBar("Leave Request", tabs, tabContent);
  }
}
