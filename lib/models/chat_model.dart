class ChatModel {
  int topicId;
  String subject;
  int forumType;
  String labelText;
  int replies;

  ChatModel(
      {this.topicId,
      this.subject,
      this.forumType,
      this.labelText,
      this.replies});

  ChatModel.fromJson(Map<String, dynamic> json) {
    topicId = json['topic_id'];
    subject = json['subject'];
    forumType = json['forum_type'];
    labelText = json['label_text'];
    replies = json['replies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic_id'] = this.topicId;
    data['subject'] = this.subject;
    data['forum_type'] = this.forumType;
    data['label_text'] = this.labelText;
    data['replies'] = this.replies;
    return data;
  }
}
