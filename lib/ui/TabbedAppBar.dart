import 'package:flutter/material.dart';

import './MyDrawer.dart';

class TabAppBar {
  static getTabbedAppBar(String title, List tabs, List tabContent) {
    return new DefaultTabController(
      length: tabs.length,
      child: new Scaffold(
        drawer: new MyDrawer(),
        appBar: AppBar(
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
          ),
          title: new Text(title),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: TabBarView(children: tabContent),
      ),
    );
  }
}
