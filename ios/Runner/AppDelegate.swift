import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var compassService: CompassService!
    
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        compassService = CompassService(onReading: onCompassReading)
        
        //todo: listen to flutter for start/stop compass events
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    
    func onCompassReading(azimuth: Double){
        print(azimuth)
        //TODO: call flutter from here
    }
}
