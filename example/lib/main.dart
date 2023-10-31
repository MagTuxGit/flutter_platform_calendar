import 'package:flutter/material.dart';
import 'dart:async';

import 'package:platform_calendar/platform_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int platformFirstDay = 0;
  final platformCalendarPlugin = PlatformCalendar();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    int firstDay = 0;
    try {
      firstDay = await platformCalendarPlugin.getFirstDayOfWeek() ?? 0;
    } catch (_) {}
    setState(() {
      platformFirstDay = firstDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          final localeFirstDay =
              MaterialLocalizations.of(context).firstDayOfWeekIndex;
          return Center(
            child: Text('Platform first day of week: $platformFirstDay\n\n'
                'Locale first day of week: $localeFirstDay'),
          );
        }),
      ),
    );
  }
}
