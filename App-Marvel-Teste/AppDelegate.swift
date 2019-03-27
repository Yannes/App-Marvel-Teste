//
//  AppDelegate.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 23/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: TableMarvelCharacter())
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.8686652959, green: 0, blue: 0, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize:24, weight: .heavy)]
        window?.makeKeyAndVisible()
        
        return true
    }
}

