import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'platform_calendar_method_channel.dart';

abstract class PlatformCalendarPlatform extends PlatformInterface {
  /// Constructs a PlatformCalendarPlatform.
  PlatformCalendarPlatform() : super(token: _token);

  static final Object _token = Object();

  static PlatformCalendarPlatform _instance = MethodChannelPlatformCalendar();

  /// The default instance of [PlatformCalendarPlatform] to use.
  ///
  /// Defaults to [MethodChannelPlatformCalendar].
  static PlatformCalendarPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PlatformCalendarPlatform] when
  /// they register themselves.
  static set instance(PlatformCalendarPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
