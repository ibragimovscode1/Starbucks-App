//
//  AppDelegate.swift
//  Starbucks App
//
//  Created by Rahmetullah on 7.07.2022.
//

import UIKit

class StarBucksVC: UIViewController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func commonInit() {
        
    }
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
    
}
class ScanVC: StarBucksVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Scan"
        }
    override func commonInit() {
        setTabBarImage(imageName: "qrcode", title: "Scan")
    }
}

class OrderVC: StarBucksVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        title = "Order"
    }
    override func commonInit() {
        setTabBarImage(imageName: "arrow.up.bin.fill", title: "Order")
    }
    }
class GiftVC: StarBucksVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Gift"
        
    }
    override func commonInit() {
        setTabBarImage(imageName: "gift.fill", title: "Gift")
    }

}

class StoresVC: StarBucksVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Stores"
        
    }
    override func commonInit() {
        setTabBarImage(imageName: "location.fill", title: "Strores")
    }
}
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let homeVC = HomeVC()
        let scanVC = ScanVC()
        let orderVC = OrderVC()
        let giftVC = GiftVC()
        let storeVC = StoresVC()
        
        let homeNC = UINavigationController(rootViewController: homeVC)
        let scanNC = UINavigationController(rootViewController: scanVC)
        let orderNC = UINavigationController(rootViewController: orderVC)
        let giftNC = UINavigationController(rootViewController: giftVC)
        let storeNC = UINavigationController(rootViewController: storeVC)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeNC,scanNC,orderNC,giftNC,storeNC]
        
        window?.rootViewController = tabBarController
        
       
        return true
    }
    func makeNavigation(rootViewController: UIViewController) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.navigationBar.prefersLargeTitles = true
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
            ]
        navigation.navigationBar.largeTitleTextAttributes = attrs
        return navigation
    }
  
}

