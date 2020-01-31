//
//  FirstViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/22/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.navigationController?.navigationBar.topItem!.title = Constants.TransactionTabTitle
//        self.navigationController?.navigationBar.topItem!.titleView?.tintColor = UIColor.whiteColor()
//        self.navigationController?.navigationBar.barTintColor = Constants.ColorOrange


    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        DataManager.sharedInstance.loadDeals()

        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewWillAppear(animated: Bool) {
        UIUtilities.drawTabBar(self.navigationController!, withTitle: Constants.TransactionTabTitle)

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

