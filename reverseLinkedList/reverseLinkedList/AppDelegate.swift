//
//  AppDelegate.swift
//  ReverseStrng
//
//  Created by vishnusankar on 10/03/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

class LinkList {
    var val : Int
    var next : LinkList?
    
    init(value : Int) {
        val = value
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var curNode : LinkList?
        var headNode : LinkList?
        for index in 0..<10 {
            if headNode == nil {
                headNode = LinkList(value: index)
                curNode = headNode
            }else {
                curNode?.next = LinkList(value: index)
                curNode = curNode?.next
            }
        }
        
        print(headNode)
        print(self.reverseRecursiveTwoLinkedList(node:&headNode))
        return true
    }
    
    func reverseRecursiveTwoLinkedList(node : inout LinkList?) {
        
        guard node?.next != nil else {
            return
        }
        var nextNode = node?.next

        reverseRecursiveTwoLinkedList(node: &nextNode)
        node?.next?.next = node
        node?.next = nil
        node = nextNode
    }
    
//    func reverseRecursiveLinkedList(head : inout LinkList?) {
//        var first : LinkList?
//        var rest : LinkList?
//
//
//        first = head
//        rest = head?.next
//
//        guard ((rest) != nil) else {
//            return
//        }
//
//
//        reverseRecursiveLinkedList(head:&rest)
//        first?.next?.next = first
//        first?.next = nil
//        head = rest
//
//    }
//    func reverseLinkedList(head : LinkList?) -> LinkList? {
//        var curNode = head
//        var prevNode : LinkList? = nil
//        var nextNode : LinkList? = nil
//
//        while curNode != nil {
//            nextNode = curNode?.next
//            curNode?.next = prevNode
//            prevNode = curNode
//            curNode = nextNode
//        }
//
//        return prevNode
//    }

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

