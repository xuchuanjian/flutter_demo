class DarenSpeakModel {
  int tid;
  String subject;
  int authorid;
  String author;
  int isDaren;
  String avatarUrl;
  String darenIntro;
  String targetUrl;
  int fid;
  String forumName;

  DarenSpeakModel(
      {this.tid,
      this.subject,
      this.authorid,
      this.author,
      this.isDaren,
      this.avatarUrl,
      this.darenIntro,
      this.targetUrl,
      this.fid,
      this.forumName});

  DarenSpeakModel.fromJson(Map<String, dynamic> json) {
    tid = json['tid'];
    subject = json['subject'];
    authorid = json['authorid'];
    author = json['author'];
    isDaren = json['is_daren'];
    avatarUrl = json['avatar_url'];
    darenIntro = json['daren_intro'];
    targetUrl = json['target_url'];
    fid = json['fid'];
    forumName = json['forum_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tid'] = this.tid;
    data['subject'] = this.subject;
    data['authorid'] = this.authorid;
    data['author'] = this.author;
    data['is_daren'] = this.isDaren;
    data['avatar_url'] = this.avatarUrl;
    data['daren_intro'] = this.darenIntro;
    data['target_url'] = this.targetUrl;
    data['fid'] = this.fid;
    data['forum_name'] = this.forumName;
    return data;
  }
}
