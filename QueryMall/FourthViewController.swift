//
//  FourthViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/22/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func logout(sender: AnyObject) {
        
        //Log out the user
        LoginSignupUtil.logout()
        
        //Direct to Login/Signup landing view
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.LoginSignupStoryboard, bundle: nil)
        let vc: UIViewController = storyboard.instantiateInitialViewController()!
        self.presentViewController(vc, animated: false, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }

    
    override func viewWillAppear(animated: Bool) {
        UIUtilities.drawTabBar(self.navigationController!, withTitle: Constants.SettingsTabTitle)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
