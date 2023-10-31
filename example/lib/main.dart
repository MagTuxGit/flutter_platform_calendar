import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  String _platformVersion = 'Unknown';
  int _platformFirstDay = 0;
  final _platformCalendarPlugin = PlatformCalendar();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    int firstDay = 0;
    try {
      platformVersion =
          await _platformCalendarPlugin.getPlatformVersion() ?? 'Unknown platform version';
      firstDay =
          await _platformCalendarPlugin.getFirstDayOfWeek() ?? 0;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _platformFirstDay = firstDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Running on: $_platformVersion\n'),
                  const SizedBox(height: 32),
                  Text('Platform first day of week: $_platformFirstDay\n'),
                  const SizedBox(height: 32),
                  Text('Locale first day of week: ${MaterialLocalizations.of(context).firstDayOfWeekIndex}\n'),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
