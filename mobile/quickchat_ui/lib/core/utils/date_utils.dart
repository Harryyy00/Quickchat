import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

abstract class QCDateUtils {
  String getDateTimeAgo(String dateString);
  String formatTime(String dateString, {String format = 'HH:mm'});
}

@LazySingleton(as: QCDateUtils)
class QCDateUtilsImpl implements QCDateUtils {
  @override
  String getDateTimeAgo(String dateString) {
    print('params $dateString');
    print('date time now ${DateTime.now().toUtc().toString()}');
    try {
      final units = [
        {'label': 'year', 'seconds': 31536000},
        {'label': 'month', 'seconds': 2592000},
        {'label': 'week', 'seconds': 604800},
        {'label': 'day', 'seconds': 86400},
        {'label': 'hour', 'seconds': 3600},
        {'label': 'minute', 'seconds': 60},
        {'label': 'second', 'seconds': 1},
      ];

      // Helper function to calculate the time difference
      Map<String, dynamic> calculateTimeDifference(int timeInSeconds) {
        for (var unit in units) {
          final int seconds = unit['seconds'] as int;
          final interval = timeInSeconds ~/ seconds;
          if (interval >= 1) {
            return {'interval': interval, 'unit': unit['label']};
          }
        }
        return {'interval': 0, 'unit': 'second'};
      }

      // Ensure dateString is parsed as UTC
      final utcDate = DateTime.parse('${dateString}Z').toUtc();
      final currentTime = DateTime.now().toUtc();
      final timeDifferenceInSeconds = currentTime.difference(utcDate).inSeconds;

      // Calculate the interval and unit
      final result = calculateTimeDifference(timeDifferenceInSeconds);
      final int interval = result['interval'] as int;
      final String unit = result['unit'] as String;

      // Add singular/plural suffix
      final suffix = interval == 1 ? '' : 's';

      print('$interval $unit$suffix ago');

      return '$interval $unit$suffix ago';
    } catch (e) {
      print('Error: $e');
      return 'Invalid date';
    }
  }

  @override
  String formatTime(String dateString, {String format = 'HH:mm'}) {
    try {
      final date = DateTime.parse(dateString);
      final formatter = DateFormat(format);
      return formatter.format(date);
    } catch (e) {
      return 'Invalid time';
    }
  }
}
