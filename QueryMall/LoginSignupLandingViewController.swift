//
//  LoginSignupViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/27/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//
//  Login Signup view controller is the landing page of the app is the user has not
//  Signed up or has logged out previously.
//  It has three actions: Login, Signup(Register) as a Customer, or Register as a Sales Associate
//
//  The main functions of this view controller are:
//      1, Prepare for the segue identifier according to different actions
//      2, Detect the loggin status of the app

import UIKit

class LoginSignupLandingViewController: UIViewController {

    //MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        isLoggedIn()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        // Get the destination view controller
        let vc:LoginSignupDetailViewController = segue.destinationViewController as! LoginSignupDetailViewController
        
        
        // Get segue identifier
        switch segue.identifier{
            
        //Action: Login
        case Constants.loginSignupSegueIdentifier.segueLogin.rawValue?:
            // Get Register view controller
            vc.segueIdentifier = Constants.loginSignupSegueIdentifier.segueLogin.rawValue
            break
            
        //Action: Customer Register
        case Constants.loginSignupSegueIdentifier.segueRegister.rawValue?:
            // Get Register view controller
            vc.segueIdentifier = Constants.loginSignupSegueIdentifier.segueRegister.rawValue
            print("Register button clicked")
            break
            
        //Action: SA Register
        case Constants.loginSignupSegueIdentifier.segueSARegister.rawValue?:
            // Get Register view controller
            vc.segueIdentifier = Constants.loginSignupSegueIdentifier.segueSARegister.rawValue
            print("SA Register button clicked")
            break
          
        default :
            break /* Optional */
            
        }
         
    }
    
    
    
    
    // MARK: - Loggin Status
    
    
    /**
     
     Check if the user is logged in or not, and redirect to the Customer Dashboard, SA Dashboard, or Login Signup page
    
     */
    func isLoggedIn(){
        
        // NSUser defaults of loggin status
        let defaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn: Bool = defaults.boolForKey(Constants.UDkeyIsLoggedIn) as Bool
        
        var storyboard: UIStoryboard
        var vc: UIViewController
        
        
        // User logged with Facebook account indicating the user is a customer
        if FBSDKAccessToken.currentAccessToken() != nil {
            print("user has logged in as a customer, redirect to Customer Dashboard page", "Facebook current access token is: ", FBSDKAccessToken.currentAccessToken())
            
            let fbTK : FBSDKAccessToken = FBSDKAccessToken.currentAccessToken()
            print("appId is", fbTK.valueForKey("appID"))
            print("userId is", fbTK.valueForKey("userID"))
            print("token string is", fbTK.valueForKey("tokenString"))
            
            
            
            //TODO: - Need to move the below verification process to the login/Signup Social Media VC
            //FIXME: - Change it back to completion handler
            /**
            class func post(params : Dictionary<String, String>, url : String, postCompleted: (succeeded: Bool, msg: String) -> ()) {
            */
            
            Server.post_2(["fbid" : String(fbTK.valueForKey("userID")),
                "token": String(fbTK.valueForKey("tokenString"))],
                url: Constants.Server_Post_Signin_FB_URL)
            
            /**
            Server.post(["fbid" : String(fbTK.valueForKey("userID")),
                "token": String(fbTK.valueForKey("tokenString"))],
                url: "http://192.168.0.166:8000/querymall_auth/signin_with_fb/"){ (succeeded: Bool, msg: String) -> ()in
                    if (succeeded) {
                        print("Succeeded in talking with the server!")
                    }else{
                        print("Failed to talk with the server")
                    }
            }
            */
            
            
            //FIXME: - Need to change to Customer storyboard
            //Get customer storyboard and direct to the initial view controller of the storyboard

            storyboard = UIStoryboard(name: Constants.SAStoryboard, bundle: nil)
            vc = storyboard.instantiateInitialViewController()!
            
            presentViewController(vc, animated: true, completion: nil)
            

        }
        
        // User logged with an email address. Needs to detect the type of the user: customer of sales associate
        else if isLoggedIn {
     
            let isCustomer: Bool = defaults.boolForKey(Constants.UDkeyIsCustomer) as Bool
            
            // User is customer
            if isCustomer{
                print("user has logged in as a customer, redirect to Customer Dashboard page")
                
                //Get customer storyboard
                storyboard = UIStoryboard(name: Constants.CustomerStoryboard, bundle: nil)
                
            }
            // User is sales associate
            else{
                print("user has logged in as a sales associate, redirect to SA Dashboard page")
                
                //Get SA storyboard
                storyboard = UIStoryboard(name: Constants.SAStoryboard, bundle: nil)
                
            }
            
            // Direct to the the initial view controller of that storyboard
            vc = storyboard.instantiateInitialViewController()!
            presentViewController(vc, animated: false, completion: nil)

        }
        
    }



}
