//
//  LoginSignup.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/27/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import Foundation
import UIKit


class LoginSignupUtil: NSObject {
    
    /** Check if the user is logged in or not, and redirect to the Customer Dashboard, SA Dashboard, or Login Signup page  **/
    class func isLoggedIn(window: UIWindow){
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn: Bool = defaults.boolForKey(Constants.UDkeyIsLoggedIn) as Bool
        
        
        // User can logged in with email, Facebook account or Google account, need to check all these status
        if (isLoggedIn || FBSDKAccessToken.currentAccessToken() != nil){
            
            let isCustomer: Bool = defaults.boolForKey(Constants.UDkeyIsCustomer) as Bool
            // Check if the user is a Customer or a SA
            if isCustomer{
                print("user has logged in as a customer, redirect to Customer Dashboard page")
                
                //Prepare for the segue to redirect to customer Dashboard
                
            }else{
                print("user has logged in as a sales associate, redirect to SA Dashboard page")
                
                //Prepare for the segue to redirect to sales associate Dashboard
                
            }
           
            
        }
        
        // If not logged in, then direct the user to the login and signup page
        else{
            print("user has not logged in, redirect to Login Signup page")
            
            //Prepare for the segue to redirect to Login Signup page
            
            // Get the LoginSignup storyboard from the main bundle:
            let loginSignupStoryboard: UIStoryboard = UIStoryboard(name: Constants.LoginSignupStoryboard, bundle: nil)
            let vc : UIViewController = loginSignupStoryboard.instantiateViewControllerWithIdentifier(Constants.LoginSignupVC) as UIViewController
            
            // Set the root view controller and make it visible
            window.rootViewController = vc
            window.makeKeyAndVisible()
            
        }

    }
   
    
    /**
     Log out the user. If the user was previously loged in via Facebook or Google, needs to check corresponding token and log out from that.
     */
    class func logout(){
       
        //User logged in via facebook
        if(FBSDKAccessToken.currentAccessToken() != nil){
            let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager.init()
            fbLoginManager.logOut()
            
            
        }else if(false){
            //TODO
            //User logged in via Google
        }else {
            
            //Change the user login status to false
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setBool(false, forKey: Constants.UDkeyIsLoggedIn)
            
        }
        

    }
    
   
}