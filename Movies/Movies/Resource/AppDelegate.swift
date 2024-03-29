//
//  AppDelegate.swift
//  Movies
//
//  Created by Adem Tarhan on 25.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

        var rootViewController: UIViewController? {
            get { window?.rootViewController }
            set {
                window?.rootViewController = newValue
                window?.makeKeyAndVisible()
            }
        }

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            initWindow()
            initRoot()
            
            return true
        }

        /// - Initializing window
        private func initWindow() {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }

        /// - Initializing root
        private func initRoot() {
            let home = Router.shared.home
            let details = Router.shared.details
            let root = UINavigationController(rootViewController: home as! UIViewController)
            rootViewController = root
        }



    
   

}

