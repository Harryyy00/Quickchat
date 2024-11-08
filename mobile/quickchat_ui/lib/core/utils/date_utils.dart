import 'package:injectable/injectable.dart';

abstract class QCDateUtils {
  String getDateTimeAgo(DateTime dateTime);
}

@LazySingleton(as: QCDateUtils)
class QCDateUtilsImpl implements QCDateUtils {
  @override
  String getDateTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} minutes ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inDays < 7) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inDays < 14) {
      return "1 week ago";
    } else if (difference.inDays < 30) {
      return "${difference.inDays ~/ 7} weeks ago";
    } else if (difference.inDays >= 30 && difference.inDays < 365) {
      // Display in format: "Month, Day"
      return "${_getMonthName(dateTime.month)}, ${dateTime.day}";
    } else {
      // If it's more than a year, just return full date
      return "${_getMonthName(dateTime.month)}, ${dateTime.day}, ${dateTime.year}";
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "";
    }
  }
}
