//
//  AppDelegate.swift
//  RangeSumOfBST
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
        let binaryTree = TreeNode(10)
        binaryTree.left = TreeNode(5)
        binaryTree.right = TreeNode(15)
        binaryTree.left?.left = TreeNode(3)
        binaryTree.left?.right = TreeNode(7)
        binaryTree.right?.right = TreeNode(18)
        print(self.rangeSumBST(binaryTree, 7, 15))
        return true
    }

//        Steps:-
//        variables -> result
//        1. BaseCase :
//             1.1. If node == nil
//             1.2. node.value < L -> Call same function with node.right
//             1.3. node.value > R -> Call same function with node.left
//        2. If above condition get failed then add node.val into result
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var result : Int = 0

        
        return result
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

