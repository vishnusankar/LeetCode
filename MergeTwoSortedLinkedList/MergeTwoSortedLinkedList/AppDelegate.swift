//
//  AppDelegate.swift
//  MergeTwoSortedLinkedList
//
//  Created by vishnusankar on 19/03/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

class ListNode {
    var val : Int
    var next : ListNode?
    init(value: Int) {
        val = value
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let list1 = ListNode(value: 2)
        let list2 = ListNode(value: 1)
        
//        list1.next = ListNode(value: 2)
//        list1.next?.next = ListNode(value: 4)
        
//        list2.next = ListNode(value: 3)
//        list2.next?.next = ListNode(value: 4)
        
        print(mergeTwoLists(list1, list2))
        return true
    }
    
//    Input: 1->2->4, 1->3->4
//    Output: 1->1->2->3->4->4
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var leftNode = l1
        var headNode = l1
        var previousLeftNode : ListNode? = nil
        var rightNode = l2
        
        if leftNode == nil && rightNode != nil {
            return rightNode
        }
        else if leftNode != nil && rightNode == nil {
            return leftNode
        }
        
        while(leftNode != nil) {
            if rightNode == nil {
                return headNode
            }
            if let tempLeftNode = leftNode, let tempRightNode = rightNode {
                if tempLeftNode.val > tempRightNode.val {
                    let tempNode = rightNode?.next
                    rightNode?.next = leftNode
                    rightNode = tempNode
                }else {
                    let tempNode = leftNode?.next
                    leftNode?.next = rightNode
                    leftNode = leftNode?.next
                }
            }
            
            print("previousleftNode - \(previousLeftNode?.val), leftNode - \(leftNode?.val)")
        }
        return headNode
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

