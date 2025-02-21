class NotificationModel {
  int? notificationId;
  int? notificationUserid;
  String? notificationTitle;
  String? notificationBody;
  String? notificationDatetime;

  NotificationModel(
      {this.notificationId,
      this.notificationUserid,
      this.notificationTitle,
      this.notificationBody,
      this.notificationDatetime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    notificationUserid = json['notification_userid'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationDatetime = json['notification_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_id'] = notificationId;
    data['notification_userid'] = notificationUserid;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['notification_datetime'] = notificationDatetime;
    return data;
  }
}
