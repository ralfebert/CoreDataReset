import UIKit

@UIApplicationMain
class CoredataresetApp: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ExampleViewController()
        self.window = window
        window.makeKeyAndVisible()

        return true
    }

}
