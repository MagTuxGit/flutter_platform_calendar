import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'platform_calendar_platform_interface.dart';

/// An implementation of [PlatformCalendarPlatform] that uses method channels.
class MethodChannelPlatformCalendar extends PlatformCalendarPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('platform_calendar');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
