import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'package:flutter/services.dart';
import './detail_page.dart';
import '../view/list_item.dart';

class FocusPage extends StatefulWidget {
  FocusPageState createState() => FocusPageState();
}

class FocusPageState extends State<FocusPage> {
  List<String> _list = new List();
  List<Color> myColors = new List();
  List<ItemModel> _modelList = List();

  @override
  void initState() {
    super.initState();
    _list.add("政府");
    _list.add("部门11");
    _list.add("部门22");
    myColors.add(Colors.red);
    myColors.add(Colors.lightBlue);
    myColors.add(Colors.lightBlue);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                //设置child居中显示
                alignment: Alignment.center,
                child: Text(
                  _list[index],
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      //去掉黄色下划线
                      decoration: TextDecoration.none),
                ),
                decoration: new BoxDecoration(
                  color: myColors[index],
                ),
              );
            },
            childCount: _list.length,
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return GestureDetector(
              child: ListItem(item: _modelList[index]),
              onTap: () {
                _pushDetail();
              },
            );
          }, childCount: _modelList.length),
        )
      ],
    );
  }

  Widget _buildFavoriteForum() {
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Text("关注的版区"),
          Text("关注的版区"),
        ],
      ),
    );
  }

  void _pushDetail() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailPage();
    }));
  }
  void _fetchData() {
    rootBundle.loadString("assets/recommend.json").then((value) {
      List<dynamic> list = json.decode(value)["data"]["list"];
      setState(() {
        _modelList = list.map((value) => ItemModel.fromJson(value)).toList();
      });
    });
  }
}
