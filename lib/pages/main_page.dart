
import 'package:flutter/material.dart';
import './home_page.dart';
import './focus_page.dart';

class MainPage extends StatefulWidget {
MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>    with SingleTickerProviderStateMixin  {
  TabController _tabCtrl;

FocusPage focusPage = FocusPage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabCtrl = TabController(length: 3, initialIndex: 0, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabCtrl,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
           Tab(text: "关注"),
           Tab(text: "推荐"),
           Tab(text: "版区"),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabCtrl,
        children: <Widget>[
          FocusPage(),
          HomePage(),
          HomePage()
        ]
      ),
    );
  }
}
