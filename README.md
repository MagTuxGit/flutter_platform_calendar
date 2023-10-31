# platform_calendar

A Flutter plugin package to get platform calendar info.

## Usage

```dart
class _MyAppState extends State<MyApp> {
  int _platformFirstDay = 0;
  final _platformCalendarPlugin = PlatformCalendar();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    int firstDay = await _platformCalendarPlugin.getFirstDayOfWeek() ?? 0;
    setState(() {
      _platformFirstDay = firstDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          final localeFirstDay = MaterialLocalizations.of(context).firstDayOfWeekIndex;
          return Center(
            child: Text('Platform first day of week: $platformFirstDay\n\n'
                'Locale first day of week: $localeFirstDay'),
          );
        }),
      ),
    );
  }
}
```