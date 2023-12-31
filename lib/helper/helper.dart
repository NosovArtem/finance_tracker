import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

TimeOfDay parseTimeOfDay(String timeString) {
  try {
    final List<String> parts = timeString.split(':');
    if (parts.length == 2) {
      final int hour = int.parse(parts[0]);
      final int minute = int.parse(parts[1]);

      if (hour >= 0 && hour < 24 && minute >= 0 && minute < 60) {
        return TimeOfDay(hour: hour, minute: minute);
      }
    }
  } catch (e) {
  }
  return throw Exception('Ошибка при разборе строки времени.');
}

String formatTimeOfDay24Hours(TimeOfDay timeOfDay) {
  final int hour = timeOfDay.hour;
  final int minute = timeOfDay.minute;

  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}



Future<void> sendEmail(String title, String body) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'tatatansv@gmail.com',
    queryParameters: {'subject': title, 'body': body},
  );

  if (await canLaunch(emailUri.toString())) {
    await launch(emailUri.toString());
  } else {
    print('Не удалось отправить электронное письмо');
  }
}
