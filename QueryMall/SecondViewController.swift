//
//  SecondViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/22/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func viewWillAppear(animated: Bool) {
        UIUtilities.drawTabBar(self.navigationController!, withTitle: Constants.AnalyticsTabTitle)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

