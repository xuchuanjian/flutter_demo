import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/item_model.dart';
import '../view/list_item.dart';

class RecommendPage extends StatefulWidget {
  RecommendPageState createState() => RecommendPageState();
}

class RecommendPageState extends State<RecommendPage> {
  List<ItemModel> _models = List();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return GestureDetector(
              child: ListItem(item: _models[index]),
              onTap: () {
                print(_models[index].author);
              },
            );
          }, childCount: _models.length),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    rootBundle.loadString('assets/recommend.json').then((value) {
      List list = json.decode(value)["data"]["list"];
      print(list.first);
      setState(() {
        _models = list.map((value) {
          return ItemModel.fromJson(value);
        }).toList();
      });
    });
  }
}
