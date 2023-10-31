import 'package:flutter_test/flutter_test.dart';
import 'package:platform_calendar/platform_calendar.dart';
import 'package:platform_calendar/platform_calendar_platform_interface.dart';
import 'package:platform_calendar/platform_calendar_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPlatformCalendarPlatform
    with MockPlatformInterfaceMixin
    implements PlatformCalendarPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PlatformCalendarPlatform initialPlatform = PlatformCalendarPlatform.instance;

  test('$MethodChannelPlatformCalendar is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPlatformCalendar>());
  });

  test('getPlatformVersion', () async {
    PlatformCalendar platformCalendarPlugin = PlatformCalendar();
    MockPlatformCalendarPlatform fakePlatform = MockPlatformCalendarPlatform();
    PlatformCalendarPlatform.instance = fakePlatform;

    expect(await platformCalendarPlugin.getPlatformVersion(), '42');
  });
}
