//
//  Extensions.swift
//  MyApp
//
//  Created by Wylog iOS Dev on 8/15/16.
//  Copyright © 2016 Wylog iOS Dev. All rights reserved.
//

import UIKit
import CoreData

extension UITabBarController {
    
    func isTabBarHidden() -> Bool {
        let viewFrame = self.view.frame
        let tabBarFrame = self.tabBar.frame
        let isHidden = tabBarFrame.origin.y >= viewFrame.size.height
        
        return isHidden
    }
    
    func hideTheTabBar(hidden: Bool, animated: Bool) {
        let isHidden = self.isTabBarHidden()
        if (hidden == isHidden) {
        
            return
        }
        
        let transitionView = (self.view.subviews as NSArray).reverseObjectEnumerator().allObjects.last as! UIView
        let viewFrame = self.view.frame
        let tabBarFrame = self.tabBar.frame
        let containerFrame = transitionView.frame
        let containerHeight = viewFrame.size.height - (hidden ? 0 : tabBarFrame.size.height)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.tabBar.frame = CGRect(x:0, y:tabBarFrame.origin.y, width: tabBarFrame.width, height: tabBarFrame.height)
            transitionView.frame = CGRect(x: containerFrame.origin.y, y: containerFrame.origin.y, width: containerFrame.width, height: containerHeight)
        })
    }
}
