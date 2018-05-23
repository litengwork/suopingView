//
//  AppDelegate.swift
//  BulletProof
//
//  Created by sideyu on 2018/5/8.
//  Copyright © 2018年 sddl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var bulletProofScreen1:BulletProofScreenViewController?
    var bulletProofScreen2:BulletProofScreenViewController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        bulletProofScreen1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BulletProofScreenViewController") as? BulletProofScreenViewController
        bulletProofScreen2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BulletProofScreenViewController") as? BulletProofScreenViewController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
         if !(self.topViewController().isKind(of: BulletProofScreenViewController.self)) {
            self.topViewController().present(self.bulletProofScreen1!, animated: false, completion: {
            })
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.bulletProofScreen1!.dismiss(animated: false) {
            self.showScreen2(showCompletion: {
                print("showScreen2")
            })
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.bulletProofScreen1!.dismiss(animated: false, completion: {
        })
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func showScreen2(showCompletion: (() -> Void)? = nil) {
        if !self.topViewController().isKind(of: BulletProofScreenViewController.self)
        {
            self.topViewController().present(self.bulletProofScreen2!, animated: false, completion: {
                showCompletion?()
            })
        }
    }

}

extension AppDelegate {
    fileprivate func deepestPresentedViewControllerOf(viewController:UIViewController) -> UIViewController {
        if let presentedVC = viewController.presentedViewController {
            return self.deepestPresentedViewControllerOf(viewController: presentedVC)
        }else{
            return viewController
        }
    }
    
    func topViewController() -> UIViewController {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        let deepestPresentedViewController = self.deepestPresentedViewControllerOf(viewController: rootViewController!)
        
        if deepestPresentedViewController.isKind(of: UINavigationController.self) {
            let nvc = deepestPresentedViewController as! UINavigationController
            return nvc.topViewController!
        }else{
            return deepestPresentedViewController
        }
    }
    
}

