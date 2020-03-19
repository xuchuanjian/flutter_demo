import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/models/forum_model.dart';
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
  List<ForumModel> _forumList = List();
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0E1417),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xFF1E1F20),
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "关注的版区",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _buildFavoriteForum(_forumList[index]);
                      },
                      itemCount: _forumList.length,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Color(0xFF1E1F20),
              child: Text(
                "版区动态",
                style: TextStyle(color: Colors.white),
              ),
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
      ),
    );
  }

  Widget _buildFavoriteForum(ForumModel forum) {
    return Stack(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.only(left: 10),
          width: 70,
          child: Column(
            children: <Widget>[
              Image.network(
                forum.forumIcon,
                width: 50,
                height: 50,
              ),
              Text(
                forum.forumName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Text(
              forum.todayposts.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
          right: 0,
          top: 10,
        ),
      ],
    );
  }

  void _pushDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DetailPage();
        },
      ),
    );
  }

  void _fetchData() {
    rootBundle.loadString("assets/recommend.json").then((value) {
      List<dynamic> list = json.decode(value)["data"]["list"];
      setState(() {
        _modelList = list.map((value) => ItemModel.fromJson(value)).toList();
      });
    });
    rootBundle.loadString('assets/favoriteForum.json').then((value) {
      List list = json.decode(value)["data"]["list"];

      setState(() {
        print(value);
        _forumList = list.map((value) => ForumModel.fromJson(value)).toList();
      });
    });
  }
}
