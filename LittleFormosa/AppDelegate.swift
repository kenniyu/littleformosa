//
//  AppDelegate.swift
//  LittleFormosa
//
//  Created by Ken Yu on 7/16/16.
//  Copyright © 2016 ken. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let frame = UIScreen.mainScreen().bounds
        window = UIWindow(frame: frame)
        
        let initialViewController = InitialViewController(nibName: "InitialViewController", bundle: nil)
        window!.rootViewController = initialViewController
        window!.makeKeyAndVisible()
        
        // Additional setup
        setupNavBar()
        
        return true
    }
    
    class func createMainTabBarController() -> MainTabBarController {
        // add feed view controller and settings view controller
        let homeViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let homeNavigationViewController = UINavigationController(rootViewController: homeViewController)
        homeNavigationViewController.tabBarItem.image = UIImage(named: "dashboard-icon-white.png")
        homeNavigationViewController.title = "Home"
        
        let browseViewController = BrowseViewController(nibName: "BrowseViewController", bundle: nil)
        let browseNavigationViewController = UINavigationController(rootViewController: browseViewController)
        browseNavigationViewController.tabBarItem.image = UIImage(named: "dashboard-icon-white.png")
        browseNavigationViewController.title = "Browse"
        
        let tabBarControllers = [homeNavigationViewController, browseNavigationViewController]
        
        let mainTabBarController = MainTabBarController()
        mainTabBarController.viewControllers = tabBarControllers
        
        return mainTabBarController
    }
    
    func setupNavBar() {
        let topBarTextAttributes = [
            NSForegroundColorAttributeName: Styles.Colors.Black,
            NSFontAttributeName: Styles.Fonts.avenirMediumFontWithSize(18)
        ]
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = Styles.Colors.Black
        navigationBarAppearance.barTintColor = Styles.Colors.White
        
        navigationBarAppearance.titleTextAttributes = topBarTextAttributes
        navigationBarAppearance.barStyle = .Default
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        barButtonAppearance.setTitleTextAttributes(topBarTextAttributes, forState: .Normal)
    }
    
    class func launchAppControllers() {
        let mainTabBarController = createMainTabBarController()
        let rootViewController = UIApplication.sharedApplication().keyWindow?.rootViewController
        rootViewController?.presentViewController(mainTabBarController, animated: true, completion: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

