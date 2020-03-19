import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/thread_type_model.dart';

class ForumDetailPage extends StatefulWidget {
  ForumDetailPageState createState() => ForumDetailPageState();
}

class ForumDetailPageState extends State<ForumDetailPage>
    with TickerProviderStateMixin {
  List<ThreadTypeModel> _threadTypes = List();
  TabController _tabCtrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('标题'),
            pinned: true,
            floating: false,
            snap: false,
            primary: true,
            expandedHeight: 230.0,
            flexibleSpace: FlexibleSpaceBar(
              title: new Text(""),
              centerTitle: true,
              collapseMode: CollapseMode.pin,
            ),
            bottom: TabBar(
              tabs: _threadTypes.map((value) => Text(value.name)).toList(),
              controller: _tabCtrl,
              isScrollable: true,
              labelColor: Colors.red,
              labelPadding: EdgeInsets.all(10),
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (context, index) => new ListTile(
                title: new Text("Item $index"),
              ),
              childCount: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _buildThreadTypeItem(_threadTypes[index]);
                },
                itemCount: _threadTypes.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThreadTypeItem(ThreadTypeModel model) {
    return Container(
      child: Text(model.name),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(
        length: _threadTypes.length, initialIndex: 0, vsync: this);
    _fetchData();
  }

  void _fetchData() {
    rootBundle.loadString('assets/thread_type.json').then(
      (value) {
        print(value);
        setState(() {
          List list = json.decode(value)['data']['list'];
          _threadTypes = list
              .map(
                (value) => ThreadTypeModel.fromJson(value),
              )
              .toList();
          _tabCtrl =
              new TabController(length: _threadTypes.length, vsync: this);
        });
      },
    );
  }
}

// class _MyTabbar extends StatefulWidget implements PreferredSize {
//   Size pre
// }
