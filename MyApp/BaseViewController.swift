//
//  BaseViewController.swift
//  MyApp
//
//  Created by Wylog iOS Dev on 8/15/16.
//  Copyright © 2016 Wylog iOS Dev. All rights reserved.
//

import UIKit

protocol ModalPresenter {
    func modalDidFinishPresenting(viewController: BaseViewController)
}


class BaseViewController: UIViewController {
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?

    var controllerData : NSMutableDictionary?
    var screenRect : CGRect?
    var objectClient : AnyObject?
    var statusBarRect : CGRect?

    override func viewDidLoad() {
        screenRect = UIScreen.mainScreen().bounds

        super.viewDidLoad()
        
        statusBarRect = UIApplication.sharedApplication().statusBarFrame
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target: nil, action: nil)
        self.tabBarController?.tabBar.translucent = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "statusBarFrameChanged:", name: "kStatusBarFrameChanged", object: nil)
       
        // Do any additional setup after loading the view.
    }
    
    func clipNavigationBar() {
        self.navigationController?.navigationBar.clipsToBounds = true
    }
    
    func darkGreenViewBackgroundColor() {
        self.view.backgroundColor = UIColor(red:0, green:0.35, blue:0.4, alpha:1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func hideTabBar() {
        let screenRect = UIScreen.mainScreen().bounds
        self.view.layoutIfNeeded()
        self.tabBarController?.hideTheTabbar()
    }
    
    
    

}
