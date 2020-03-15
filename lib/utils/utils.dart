class Utils {
  static String formatTimestamp(int timestamp) {
    timestamp *= 1000;
    var currentDate = DateTime.now();
    int diff = currentDate.millisecondsSinceEpoch - timestamp;
    // 一分鐘的毫秒數
    int millisecondOfMin = 1 * 60 * 1000;
    // 一小時的毫秒數
    int millisecondOfHour = 60 * millisecondOfMin;
    // 一天的毫秒數
    int millisecondOfDay = 24 * millisecondOfHour;
    if (diff < millisecondOfMin) {
      return '刚刚';
    } else if (diff < millisecondOfHour) {
      return '${_dateTime(timestamp).minute}分钟前';
    } else if (diff < millisecondOfDay) {
      return '${_dateTime(timestamp).hour}小时前';
    } else {
      return format(timestamp);
    }
  }

  static DateTime _dateTime(int timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

  static String format(int shijianchuo) {
    var time = DateTime.fromMillisecondsSinceEpoch(shijianchuo);
    var year = time.year;
    var month = time.month;
    var day = time.day;
    return '$year-$month-$day';
  }
}
