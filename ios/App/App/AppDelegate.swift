import UIKit
import Capacitor

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        //############################################################## AppSealing Code-Part BEGIN: DO NOT MODIFY THIS LINE !!!
        #if true  //--------------------------------------- APPSEALING-GetDeviceID [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
        let _instAppSealing_auto_generated1: AppSealingInterface = AppSealingInterface();
        let _appSealingDeviceID_auto_generated = String.init( cString: _instAppSealing_auto_generated1._GetAppSealingDeviceID() );
        let _appsealing_msg1 = "\n\n* AppSealing Device ID : ";
        print( _appsealing_msg1 + _appSealingDeviceID_auto_generated + "\n\n" );
        #endif    //--------------------------------------- APPSEALING-GetDeviceID [END] : DO NOT REMOVE THIS COMMENT !!!

        #if true  //--------------------------------------- APPSEALING-SecurityThreadCheck [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
        let _instAppSealing_auto_generated2: AppSealingInterface = AppSealingInterface();
        let _appsealing_tamper_auto_generated: Int32 = _instAppSealing_auto_generated2._IsAbnormalEnvironmentDetected();
        if ( _appsealing_tamper_auto_generated > 0 )
        {
            var _appsealing_msg2 = "Abnormal Environment Detected !!";
            if ( _appsealing_tamper_auto_generated & DETECTED_JAILBROKEN ) > 0
                { _appsealing_msg2 += "\n - Jailbroken"; }
            if ( _appsealing_tamper_auto_generated & DETECTED_DRM_DECRYPTED ) > 0
                { _appsealing_msg2 += "\n - Executable is not encrypted"; }
            if ( _appsealing_tamper_auto_generated & DETECTED_DEBUG_ATTACHED ) > 0
                { _appsealing_msg2 += "\n - App is debugged"; }
            if ( _appsealing_tamper_auto_generated & ( DETECTED_HASH_INFO_CORRUPTED | DETECTED_HASH_MODIFIED )) > 0
                { _appsealing_msg2 += "\n - App integrity corrupted"; }
            if ( _appsealing_tamper_auto_generated & ( DETECTED_CODESIGN_CORRUPTED | DETECTED_EXECUTABLE_CORRUPTED )) > 0
                { _appsealing_msg2 += "\n - App executable has corrupted"; }
            #if DETECTED_CERTIFICATE_CHANGED
            if (( _appsealing_tamper_auto_generated & DETECTED_CERTIFICATE_CHANGED ) > 0 )
                { _appsealing_msg2 += "\n - App has re-signed"; }
            #endif
            #if DETECTED_BLACKLIST_CORRUPTED
            if (( _appsealing_tamper_auto_generated & DETECTED_BLACKLIST_CORRUPTED ) > 0 )
                { _appsealing_msg2 += "\n - Blacklist/Whitelist has corrupted or missing"; }
            #endif
            #if DETECTED_CHEAT_TOOL
            if (( _appsealing_tamper_auto_generated & DETECTED_CHEAT_TOOL ) > 0 )
                { _appsealing_msg2 += "\n - Cheat tool has detected"; }
            #endif
            let _alertController_auto_generated = UIAlertController(title: "AppSealing Security", message: _appsealing_msg2, preferredStyle: .alert );
            _alertController_auto_generated.addAction(UIAlertAction(title: "Confirm", style: .default,
                                    handler: { (action:UIAlertAction!) -> Void in
            #if !DEBUG   // Debug mode does not kill app even if security threat has found
                                                exit(0);
            #endif
                                                } ));
            #if ALERT_IN_VIEW_CONTROLLER
            self.present( _alertController_auto_generated, animated: true, completion: nil );
            #else
            DispatchQueue.main.async {
                self.window?.rootViewController?.present( _alertController_auto_generated, animated: true, completion: nil )
            }
            #endif
        }
        #endif    //--------------------------------------- APPSEALING-SecurityThreadCheck [END] : DO NOT REMOVE THIS COMMENT !!!

        #if true  //--------------------------------------- APPSEALING-GetCredential [BEGIN] : DO NOT REMOVE THIS COMMENT !!!
        let _instAppSealing_auto_generated3: AppSealingInterface = AppSealingInterface();
        let _appSealingCredential_auto_generated = String.init( cString: _instAppSealing_auto_generated3._GetEncryptedCredential() );
        let _appsealing_msg3 = "\n\n* AppSealing Credential : ";
        print( _appsealing_msg3 + _appSealingCredential_auto_generated + "\n\n" );
        // use thie credential value in your authentication function
        #endif    //--------------------------------------- APPSEALING-GetCredential [END] : DO NOT REMOVE THIS COMMENT !!!
        //############################################################## AppSealing Code-Part END: DO NOT MODIFY THIS LINE !!!

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        // Called when the app was launched with a url. Feel free to add additional processing here,
        // but if you want the App API to support tracking app url opens, make sure to keep this call
        return ApplicationDelegateProxy.shared.application(app, open: url, options: options)
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // Called when the app was launched with an activity, including Universal Links.
        // Feel free to add additional processing here, but if you want the App API to support
        // tracking app url opens, make sure to keep this call
        return ApplicationDelegateProxy.shared.application(application, continue: userActivity, restorationHandler: restorationHandler)
    }

}

