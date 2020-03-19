class ThreadTypeModel {
  int typeid;
  String name;
  int selected;

  ThreadTypeModel({this.typeid, this.name, this.selected = 0});

  ThreadTypeModel.fromJson(Map<String, dynamic> json) {
    typeid = json['typeid'];
    name = json['name'];
    selected = 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['typeid'] = this.typeid;
    data['name'] = this.name;
    return data;
  }
}
