//import UIKit
//import Flutter
//import Firebase
//import FirebaseMessaging
//
//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//  override func application(
//    _ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions:
// [UIApplication.LaunchOptionsKey: Any]?
//  ) -> Bool {
//    FirebaseApp.configure()
//    GeneratedPluginRegistrant.register(with: self)
//    return super.application(application, didFinishLaunchingWithOptions:
//  launchOptions)
//  }
//  override func application(_ application: UIApplication,
//  didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//
//   Messaging.messaging().apnsToken = deviceToken
//   super.application(application,
//   didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
// }
//}





import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure()
      if #available(iOS 10.0, *) {
       UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
     }
      GeneratedPluginRegistrant.register(with: self)
//    GeneratedPluginRegistrant.register(with: self)}
      if(!UserDefaults.standard.bool(forKey: "Notification")) {
          UIApplication.shared.cancelAllLocalNotifications()
          UserDefaults.standard.set(true, forKey: "Notification")
      }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

       Messaging.messaging().apnsToken = deviceToken
       super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
     }
}
