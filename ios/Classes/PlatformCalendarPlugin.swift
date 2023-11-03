import Flutter
import UIKit

public class PlatformCalendarPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "platform_calendar", binaryMessenger: registrar.messenger())
    let instance = PlatformCalendarPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getFirstDayOfWeek":
      result(Calendar.current.firstWeekday)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
