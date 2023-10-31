
import 'platform_calendar_platform_interface.dart';

class PlatformCalendar {
  Future<String?> getPlatformVersion() {
    return PlatformCalendarPlatform.instance.getPlatformVersion();
  }
}
