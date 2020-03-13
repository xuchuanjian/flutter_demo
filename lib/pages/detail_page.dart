import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/comment_item_model.dart';
import '../view/comment_item.dart';

class DetailPage extends StatefulWidget {
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  List<CommentItemModel> _commemtModels;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('讨论区'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext ctx, int index) {
                return CommentItem(mode: _commemtModels[index]);
              },
              childCount: _commemtModels.length,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    rootBundle.loadString("assets/comment.json").then((value) {
      List list = json.decode(value)['data']['list'];
      setState(() {
        _commemtModels = list.map((value) {
          return CommentItemModel.fromJson(value);
        }).toList();
      });
    });
  }
}
