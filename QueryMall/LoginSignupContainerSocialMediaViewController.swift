//
//  LoginSignupContainerSocialMediaViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 11/3/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import UIKit

class LoginSignupContainerSocialMediaViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    
    //MARK: - Outlets
    ///Facebook button
    @IBOutlet var fbLoginButton: FBSDKLoginButton!
    ///Google button
    @IBOutlet var ggLoginButton: UIView!
    
    @IBOutlet var textLabelOR: UILabel!
    
    
    //MARK: - Variables and Properties
    /// Login, Register, or SA Register
    var segueIdentifier: NSString!

    

    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Setup Facebook login button
        fbLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
        fbLoginButton.delegate = self
        
        self.view.addSubview(fbLoginButton)
        
        
        
        //TODO: Setup Google login button
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: - UI Constraints
    
    ///Update UI constraints according to different user type
    //TODO: change loggin button text label to register button, Add Google Register button
    //FIXME: Hard coded number
    override func updateViewConstraints() {
        
        switch segueIdentifier {
            
        // Customer register
        case Constants.loginSignupSegueIdentifier.segueRegister.rawValue?:
            
            // Add Facebook Register button
            fbLoginButton.setTitle("Register with Facebook" , forState: UIControlState.Normal)
            fbLoginButton.titleLabel?.text = "Register" //doesn't work
            
            fbLoginButton.readPermissions = ["public_profile", "email", "user_friends"]
            fbLoginButton.delegate = self
            
            self.view.addSubview(fbLoginButton)
            break
            
            
        // Sales associate register
        case Constants.loginSignupSegueIdentifier.segueSARegister.rawValue?:
            
            // Remove Facebook and Google register buttons and text label
            fbLoginButton.removeFromSuperview()
            textLabelOR.removeFromSuperview()
            break
            
        default :
            break /* Optional */
            
        }
        
        super.updateViewConstraints()
    }
    
    
    

    //MARK: - Facebook Delegate Methods
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            
            //Get SA storyboard
            //FIXME : - Need to change back to customer storyboard
            let storyboard:UIStoryboard = UIStoryboard(name: Constants.SAStoryboard, bundle: nil)
            
        
        
        // Direct to the the initial view controller of that storyboard
            let vc:UIViewController = storyboard.instantiateInitialViewController()!
        presentViewController(vc, animated: false, completion: nil)
        
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                //TODO: get user email
                returnUserData()
            }
            
            if result.grantedPermissions.contains("public_profile")
            {
                //TODO: get user public profile
            }
            
            if result.grantedPermissions.contains("user_friends")
            {
                //TODO: get user friends list
                
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    
    
    
    //MARK: - Grab User Information
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                let userID : NSString = result.valueForKey("id") as! NSString
                print("User Name is: \(userName)")
                print("User id is: \(userID)")

                //                let userEmail : NSString = result.valueForKey("email") as! NSString
                //                print("User Email is: \(userEmail)")
                
                if let appId: NSString = NSBundle.mainBundle().infoDictionary?["FacebookAppID"] as? String{
                    print(appId)
                }

                
            }
        })
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
