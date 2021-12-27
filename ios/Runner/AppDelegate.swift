import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    private var initialUrl : String?

    private var methodChannel: FlutterMethodChannel?
    private var eventChannel: FlutterEventChannel?
    private var pushTokenChannel: FlutterEventChannel?

    private let linkStreamHandler = LinkStreamHandler()
    private let pushTokenStreamHandler = PushTokenStreamHandler()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller = window.rootViewController as! FlutterViewController
        methodChannel = FlutterMethodChannel(name: "yellowclass.com/channel", binaryMessenger: controller.binaryMessenger)
        eventChannel = FlutterEventChannel(name: "yellowclass.com/events", binaryMessenger: controller.binaryMessenger)
        pushTokenChannel = FlutterEventChannel(name: "yellowclass.com/push", binaryMessenger: controller.binaryMessenger)

        methodChannel?.setMethodCallHandler({[weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            guard call.method == "initialLink" else {
                result(FlutterMethodNotImplemented)
                return
            }
            self?.receiveInitialLink(result: result)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        eventChannel?.setStreamHandler(linkStreamHandler)
        pushTokenChannel?.setStreamHandler(pushTokenStreamHandler)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func receiveInitialLink(result: FlutterResult){
        result(self.initialUrl)
    }

    // Universal Links
    override func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
          
            eventChannel?.setStreamHandler(linkStreamHandler)
            
        switch userActivity.activityType {
        case NSUserActivityTypeBrowsingWeb:
            guard let url = userActivity.webpageURL else {
                return false
            }
            if(initialUrl == nil){
                initialUrl = url.absoluteString
                return true
            }
            return linkStreamHandler.handleLink(url.absoluteString)
        default: return false
        }
    }

    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
         NSLog("AppsFlyer [deep link]: Open URI-scheme options")
            return true
        }

    override func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        NSLog("AppsFlyer [deep link]: Open URI-scheme for iOS 9 and above")
        return true
       }

    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()

        pushTokenChannel?.setStreamHandler(pushTokenStreamHandler)
        pushTokenStreamHandler.handlePushToken(token)

    }

    override func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

        pushTokenChannel?.setStreamHandler(pushTokenStreamHandler)
        pushTokenStreamHandler.handlePushToken(error.localizedDescription)
    }

}


class LinkStreamHandler:NSObject, FlutterStreamHandler {

    var eventSink: FlutterEventSink?

    // links will be added to this queue until the sink is ready to process them
    var queuedLinks = [String]()

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        queuedLinks.forEach({ events($0) })
        queuedLinks.removeAll()
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }

    func handleLink(_ link: String) -> Bool {
        guard let eventSink = eventSink else {
            queuedLinks.append(link)
            return false
        }
        eventSink(link)
        return true
    }
}

class PushTokenStreamHandler:NSObject, FlutterStreamHandler {

    var eventSink: FlutterEventSink?

    // links will be added to this queue until the sink is ready to process them
    var queuedLinks = [String]()

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events
        queuedLinks.forEach({ events($0) })
        queuedLinks.removeAll()
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        self.eventSink = nil
        return nil
    }

    func handlePushToken(_ token: String) {
        guard let eventSink = eventSink else {
            queuedLinks.append(token)
            return
        }
        eventSink(token)
    }
}
