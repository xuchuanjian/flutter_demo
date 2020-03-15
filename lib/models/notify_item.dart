class NotifyItemModel {
  String createTime;
  String isRead;
  String msgId;
  String remark;
  String source;
  String title;
  String content;
  String url;

  NotifyItemModel(
      {this.createTime,
      this.isRead,
      this.msgId,
      this.remark,
      this.source,
      this.title,
      this.content,
      this.url});

  NotifyItemModel.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    isRead = json['isRead'];
    msgId = json['msgId'];
    remark = json['remark'];
    source = json['source'];
    title = json['title'];
    content = json['content'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createTime'] = this.createTime;
    data['isRead'] = this.isRead;
    data['msgId'] = this.msgId;
    data['remark'] = this.remark;
    data['source'] = this.source;
    data['title'] = this.title;
    data['content'] = this.content;
    data['url'] = this.url;
    return data;
  }
}
