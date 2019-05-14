//
//  AppDelegate.swift
//  SearchInABinarySearchTree
//
//  Created by vishnusankar on 07/05/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let rootNode = TreeNode(4)
        rootNode.right = TreeNode(7)
        rootNode.left = TreeNode(2)
        rootNode.left?.left = TreeNode(1)
        rootNode.left?.right = TreeNode(3)
        let resultNode = self.searchBST(rootNode, 5)
        print("root value - \(String(describing: resultNode?.val)), left value - \(resultNode?.left?.val)")
        return true
    }

    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        if root == nil {
            return nil
        }
        
        let currentValue = root?.val ?? 0
        if val > currentValue {
            return self.searchBST(root?.right, val)
        }
        else if val < currentValue {
            return self.searchBST(root?.left, val)
        }
        else {
            
            return root
        }
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


}

