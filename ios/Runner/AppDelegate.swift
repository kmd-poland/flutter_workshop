import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var compassService: CompassService!
    var compassChannel: FlutterMethodChannel?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        compassService = CompassService(onReading: onCompassReading)
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        self.compassChannel = FlutterMethodChannel(name: "com.example.flutterworkshops/compass",
                                                   binaryMessenger: controller.binaryMessenger)
        
        self.compassChannel?.setMethodCallHandler({ [unowned self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            switch (call.method){
            case "startCompass":
                self.compassService.startReadings()
                break
            case "stopCompass":
                self.compassService.stopReadings()
                break
            default:
                print("unknown function")
            }
          })
        
        //todo: listen to flutter for start/stop compass events
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    func onCompassReading(azimuth: Double){

        self.compassChannel?.invokeMethod("gotCompassData", arguments: azimuth)
    }
}
