
import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        changeRootViewController(with: GlobalStoryBoard().profileVC)
        return true
    }


    func changeRootViewController(with viewController : UIViewController){
        
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let nav = UINavigationController(rootViewController: viewController)

        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        

        
    }
}

