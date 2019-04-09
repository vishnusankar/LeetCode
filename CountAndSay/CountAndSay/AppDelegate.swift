//
//  AppDelegate.swift
//  CountAndSay
//
//  Created by vishnusankar on 08/04/19.
//  Copyright © 2019 vishnusankar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Var : sequenceCharacterCount = 1
        //Var : nextSeeAndSaySequenceNumberResult = ""
        //Var : currentCharacterIndex
        
        //Iterate input characters (while currentCharIndex < input.length)
            //If first character & next character are same or next character is equal to nil
                //sequenceCharacterCount++
            //else
                //nextSeeAndSaySequenceNumberResult append the sequenceCharacterCount
                //nextSeeAndSaySequenceNumberResult append the currentCharacter
        
        
        print(self.countAndSay(1))
        return true
    }
    
    func countAndSay(_ n: Int) -> String {
     var result = "1"
        for i in 1..<n {
            result = self.getNextSeeAndSaySquenceNumber(previousNumber: String(result))
        }
        return result
    }
    
    func getNextSeeAndSaySquenceNumber(previousNumber: String) -> String {
        guard previousNumber.count != 0 else {
            return ""
        }
        var sequenceCharacterCount = 1
        var nextSeeAndSaySequenceNumberResult = ""
        var currentCharacterIndex = 0

        if previousNumber.count == 1 {
            nextSeeAndSaySequenceNumberResult.append(previousNumber[currentCharacterIndex])
            nextSeeAndSaySequenceNumberResult.append(previousNumber[currentCharacterIndex])
            return nextSeeAndSaySequenceNumberResult
        }
        while currentCharacterIndex < (previousNumber.count-1) {
            if previousNumber[currentCharacterIndex] == previousNumber[currentCharacterIndex+1] {
                sequenceCharacterCount += 1
            }else {
                nextSeeAndSaySequenceNumberResult.append("\(sequenceCharacterCount)")
            nextSeeAndSaySequenceNumberResult.append("\(previousNumber[currentCharacterIndex])")
                sequenceCharacterCount = 1
            }
            currentCharacterIndex += 1
        }
        
//        if sequenceCharacterCount != 1 {
            nextSeeAndSaySequenceNumberResult.append("\(sequenceCharacterCount)")
            nextSeeAndSaySequenceNumberResult.append("\(previousNumber[currentCharacterIndex])")
//        }
        
        return nextSeeAndSaySequenceNumberResult
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

extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}
