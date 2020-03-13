import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/data_detail.dart';
// import 'con';
import 'dart:convert';
class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class BeautifyHomePage extends StatefulWidget {
  BeautifyHomePageState createState() => BeautifyHomePageState();
}

class BeautifyHomePageState extends State<BeautifyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
               new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 50 //50个列表项
            ),
          )
      ],
    );
  }
}

class HomePageState extends State<HomePage> {
  Autogenerated _auto = null;
  bool showLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("fluuter"),
      ),
      body: buildBody(),
    );
    
  }
  
  @override
  void initState() {
    super.initState();
    _fetchData();
  }
  Widget buildBody() {
    if(_auto == null ||  _auto.data.lists.length == 0) {
      return Center(
        child: Text("loading..."),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return _buildItem(this._auto.data.lists[index]);
        },
        itemCount: this._auto.data.lists.length,
        );
    }
  }

Widget _buildItem(Lists item) {
  return Container(
    child: Row(
      children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(item.avatarUrl),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(item.author, style: TextStyle(fontSize: 14)),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(item.grouptitle, style: TextStyle(fontSize: 13)),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(item.message, style: TextStyle(fontSize: 15)),
              ),
              FlatButton(
                onPressed: (){
                  print(item.message);
                },
                child: Text("回复"),
                color: Colors.transparent,
                ),
               Offstage(
                 offstage: item.signature.length == 0,
                 child: Container(
                   padding: const EdgeInsets.all(10),
                   child: Text(item.signature),
                   decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
                   ),
                 ),
               )
              ],
          ) 
        )
      ],
    ),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))
    ),
  );
}



  void _fetchData()  {
    Future.delayed(Duration(seconds: 5), () {
      rootBundle.loadString("assets/detail.json").then((value) {
      setState(() {
          // showLoading = false;
         _auto = Autogenerated.fromJson(json.decode(value));
          print(_auto.data.lists[0].message);
      });
    });
    });
  } 
}
