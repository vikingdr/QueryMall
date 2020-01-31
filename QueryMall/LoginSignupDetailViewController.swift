//
//  LoginSignupDetailViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/31/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//
//  Login Signup Detail view controller manage the registration and login events.
//  It contains two different registration options: customer registration and sales associate registration
//  It also contains login operations
//  
//  For a customer, it provides alternatives of registration/login with Facebook or Google or Email
//  For an sales associate, it provides email only registration
//
//  The Email registration is done in a container view inside this view controller
//  The container view contains a child table view controller which is used to render
//  detail registration required information, which needs to be filled out by the user
//  The container view needs to resize itself in this view controller according to the user type

import UIKit

class LoginSignupDetailViewController: UIViewController {

    //MARK: - Variables and Properties
    
    ///Indicating user operation type: login/registration/SA registration
    var segueIdentifier: NSString!
    var userDefaults: NSUserDefaults?
    
    let tap1 = UITapGestureRecognizer()
    let tap2 = UITapGestureRecognizer()
    var isTapped: Bool = true
    
    
    //MARK: - Outlets
    @IBOutlet var emailContainerView: UIView!
    @IBOutlet var socialMediaContainerView: UIView!
    @IBOutlet var containerViewTopSpace: NSLayoutConstraint!
    @IBOutlet var containerViewHeight: NSLayoutConstraint!
    @IBOutlet var sMediaContainerViewTopSpace: NSLayoutConstraint!
  
    
    
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
        // Login
        case Constants.loginSignupSegueIdentifier.segueLogin.rawValue?:
            
            //Height constraint of the container view when customers register
            containerViewHeight.constant = CGFloat(Constants.LoginDataArray.count) * 45.0
            

//            // Add gesture recognizer to the email container view for tap gesture
//            tap1.addTarget(self, action: "tappedEmailView")
//            emailContainerView.userInteractionEnabled = true
//            emailContainerView.addGestureRecognizer(tap1)
//            
//            //TODO: -  and add a new gesture recognizer to the background to reset the position
//            tap2.addTarget(self, action: "tappedBackgroundView")
//            self.view.userInteractionEnabled = true
//            self.view.addGestureRecognizer(tap2)
            
            break
            
        // Customer register
        case Constants.loginSignupSegueIdentifier.segueRegister.rawValue?:
          
            //Height constraint of the container view when customers register
            containerViewHeight.constant = CGFloat(Constants.RegisterDataArray.count) * 45.0

            
//            // Add gesture recognizer to the email container view for tap gesture
//            tap1.addTarget(self, action: "tappedEmailView")
//            emailContainerView.userInteractionEnabled = true
//            emailContainerView.addGestureRecognizer(tap1)
//            
//            
//            //TODO: -  and add a new gesture recognizer to the background to reset the position
//            tap2.addTarget(self, action: "tappedBackgroundView")
//            self.view.userInteractionEnabled = true
//            self.view.addGestureRecognizer(tap2)
            
            print("resized the container view in registration controller for customer registration")
            break
            
            
        // Sales associate register
        case Constants.loginSignupSegueIdentifier.segueSARegister.rawValue?:
            
            //Size of the container view when SA register
            containerViewHeight.constant = CGFloat(Constants.SARegisterDataArray.count) * 45.0
           
            //Top layout constraint
            let constraint: NSLayoutConstraint = NSLayoutConstraint.init(item: emailContainerView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 150)
            self.view.addConstraint(constraint)

            print("resized the container view in registration controller for SA registration" )
            break
            
        default :
            break /* Optional */
            
        }

        
        super.updateViewConstraints()
    }
   
    
    
    /**
     
     This method perform basic animation of the UI constraint changes
     */
     //TODO: - more robust animation
    func tappedEmailView(){
        print("Email Container view tapped")
        
        //            let rect:CGRect = CGRectMake(emailContainerView.frame.origin.x, 230, emailContainerView.frame.size.width, emailContainerView.frame.size.height)
        
        if self.view.subviews.contains(self.socialMediaContainerView)
        {
            //Update Email&Password container view constraints
            self.view.removeConstraint(self.containerViewTopSpace)
            let constraint: NSLayoutConstraint = NSLayoutConstraint.init(
                item: emailContainerView,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: socialMediaContainerView.frame.origin.y)
            self.view.addConstraint(constraint)

            
            //Update Social Media container view constraints
            self.view.removeConstraint(self.sMediaContainerViewTopSpace)
            let constraint2: NSLayoutConstraint = NSLayoutConstraint.init(
                item: socialMediaContainerView,
                attribute: NSLayoutAttribute.Top,
                relatedBy: NSLayoutRelation.Equal,
                toItem: self.view,
                attribute: NSLayoutAttribute.Top,
                multiplier: 1.0,
                constant: socialMediaContainerView.frame.origin.y - 20)
            self.view.addConstraint(constraint2)
        }
        
        
        
        //Animate the change of constraints
        UIView.animateWithDuration(0.2,
            animations: {self.view.layoutIfNeeded()},
            completion: {finished in
                self.socialMediaContainerView.removeFromSuperview()})
    
    }
    
    
    //TODO: -  and add a new gesture recognizer to the background to reset the position
    func tappedBackgroundView(){
        print("Background tapped")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // Pass segue identifier value to the child container view controller, to be used
    // to dynamically construct the child table view in the container view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
       
        switch segue.identifier{
            
        //Social media login button container view
        case Constants.loginSignupSegueIdentifier.segueEmbedSocialMediaContainer.rawValue?:
            
            let childVC : LoginSignupContainerSocialMediaViewController = segue.destinationViewController as! LoginSignupContainerSocialMediaViewController
            childVC.segueIdentifier = segueIdentifier
            break
            
        //Email & password login container view
        case Constants.loginSignupSegueIdentifier.segueEmbedEmailPasswordContainer.rawValue?:
            
            let childVC : LoginSignupContainerTableViewController = segue.destinationViewController as! LoginSignupContainerTableViewController
            childVC.segueIdentifier = segueIdentifier
            break
            
        default:
            break
            
        }

        
    }


}
