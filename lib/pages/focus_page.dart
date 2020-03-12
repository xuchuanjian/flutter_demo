import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import 'package:flutter/services.dart';

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
            SliverAppBar(
               pinned: true,
               expandedHeight: 200.0,
               title: _buildFavoriteForum(),
             
                ),
                
                SliverGrid(
                  gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                  ///设置item的最大像素宽度  比如 130
                  ///
                  maxCrossAxisExtent: 150,
                  ///沿主轴的每个子节点之间的逻辑像素数。 默认垂直方向的子child间距  这里的是主轴方向 当你改变 scrollDirection: Axis.vertical,就是改变了主轴发方向
                  mainAxisSpacing: 10.0,

                ///沿横轴的每个子节点之间的逻辑像素数。默认水平方向的子child间距
                crossAxisSpacing: 10.0,

                ///每个孩子的横轴与主轴范围的比率。 child的宽高比  常用来处理child的适配
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
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _buildFixedExtentListItem(_modelList[index]);
              },
              childCount: _modelList.length
            ),
  
          )
              ],
        );
  }
  Widget _buildFixedExtentListItem(ItemModel item) {
    // texs
    return GestureDetector(
      onTap: () {
        print(item.toJson());
      },
      child: Container(
      padding: const EdgeInsets.all(10),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(item.avatarUrl),
              ),
            ),
            Text(item.title, style: TextStyle(color: Colors.white)),
            Text(item.content, style: TextStyle(color: Colors.white)),
            Offstage(
              offstage: item.imageList.length == 0,
              child: Container(
                width: 50,
                height: 50,
                child: Image.network(item.imageList.length > 0 ? item.imageList.first.url : ""),
              ),
            ),
            Text("${item.replies}", style: TextStyle(color: Colors.white)),
            // Stack(
            //   children: <Widget>[
            //     Positioned(
            //       child:Text("${item.publishTime}", style: TextStyle(color: Colors.white)),
            //       bottom: 10,
            //       right: 10,
            //     ),
            //     Positioned(
            //       child: Text("${item.source}", style: TextStyle(color: Colors.white)),
            //       top: 10,
            //       right: 10,
            //     )
            //   ],
            // )
          ],
        ),
       
      ),
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

  void _fetchData() {
    rootBundle.loadString("assets/recommend.json").then((value) {
      List<dynamic> list = json.decode(value)["data"]["list"];
      setState(() {
        
        for (var item in list) {
            print(item);
            _modelList.add(ItemModel.fromJson(item));
        }
        });
    
    });
  }
}