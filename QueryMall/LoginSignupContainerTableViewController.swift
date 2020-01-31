//
//  LoginSignupContainerTableViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 11/1/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//
//  Login Signup Container Table View Controller renders a table view to handle
//  user's input data of registration or login. And communicate the data with the 
//  server.

import UIKit

class LoginSignupContainerTableViewController: UITableViewController, UITextFieldDelegate {

    
    //MARK: - Variables and Properties
    
    /// Login, Register, or SA Register
    var segueIdentifier: NSString!
    /// Content to be used to populate the table view
    var tableData: NSMutableArray?
    /// If first time touched, moved the table view up 
    var isFirstTouched: Bool = true
    
    
    
    //MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        // Construct the table view corresponding to different segue identifier
        switch segueIdentifier
        {
            
        // Login
        case Constants.loginSignupSegueIdentifier.segueLogin.rawValue?:
            tableData = NSMutableArray(array: Constants.LoginDataArray)
            break
            
        // Customer register
        case Constants.loginSignupSegueIdentifier.segueRegister.rawValue?:
            tableData = NSMutableArray(array: Constants.RegisterDataArray)
            break
            
        // Sales associate register
        case Constants.loginSignupSegueIdentifier.segueSARegister.rawValue?:
            tableData = NSMutableArray(array: Constants.SARegisterDataArray)
            break
            
        default :
            break /* Optional */
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view delegate methods
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("touch on row: ", indexPath.row)

        self.moveUpAnimation()

    }
    
    
    
    // MARK: - Table view data source
    
    /**
    Connect data source to the table and calculate the number of rows required
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (tableData?.count)!
    }

    /**
     Render data to each cell of the table
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        let cell = UITableViewCell(
            style: UITableViewCellStyle.Value1,
            reuseIdentifier: Constants.LoginSignTableCell)
        
        cell.textLabel?.text = (tableData![indexPath.row] as! String)
        
        
        
        //FIXME: Correct textfield constraint
        let txtField: UITextField = UITextField.init(
            frame: CGRectMake(
                cell.frame.origin.x + 200,
                cell.frame.origin.y,
                200,
                cell.frame.size.height
            )
        )
        txtField.placeholder = "type sth"
        txtField.autocorrectionType = UITextAutocorrectionType.No
        txtField.clearButtonMode = UITextFieldViewMode.WhileEditing
        txtField.textAlignment = NSTextAlignment.Right
        txtField.delegate = self
        cell.contentView.addSubview(txtField)
        
     
        cell.addConstraint( NSLayoutConstraint.init(item: txtField, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: cell, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 1))
        
        txtField.textAlignment = NSTextAlignment.Left
        
        
        return cell
    }
    

    // MARK: - Textfield Delegate

    func textFieldDidBeginEditing(textField: UITextField) {
        self.moveUpAnimation()
    }
    
    
    // When user touches outside the keyboard, the keyboard closes
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    // UI
    func moveUpAnimation() {
        //TODO: when touched, remove Facebook and Google button, and move up the table view to the top of the screen
        if isFirstTouched{
            print("First time touched, going to move the table view up")
            
            if segueIdentifier != Constants.loginSignupSegueIdentifier.segueSARegister.rawValue {
                
                let pVC: LoginSignupDetailViewController = self.parentViewController as! LoginSignupDetailViewController
                
                //Update Email&Password container view constraints
                pVC.view.removeConstraint(pVC.containerViewTopSpace)
                let constraint: NSLayoutConstraint = NSLayoutConstraint.init(
                    item: pVC.emailContainerView,
                    attribute: NSLayoutAttribute.Top,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: pVC.view,
                    attribute: NSLayoutAttribute.Top,
                    multiplier: 1.0,
                    constant: pVC.socialMediaContainerView.frame.origin.y)
                pVC.view.addConstraint(constraint)
                
                
                //Update Social Media container view constraints
                pVC.view.removeConstraint(pVC.sMediaContainerViewTopSpace)
                let constraint2: NSLayoutConstraint = NSLayoutConstraint.init(
                    item: pVC.socialMediaContainerView,
                    attribute: NSLayoutAttribute.Top,
                    relatedBy: NSLayoutRelation.Equal,
                    toItem: pVC.view,
                    attribute: NSLayoutAttribute.Top,
                    multiplier: 1.0,
                    constant: pVC.socialMediaContainerView.frame.origin.y - 20)
                pVC.view.addConstraint(constraint2)
                
                
                //Animate the change of constraints
                UIView.animateWithDuration(0.2,
                    animations: {pVC.view.layoutIfNeeded()},
                    completion: {finished in
                        pVC.socialMediaContainerView.removeFromSuperview()})
                

                
                //Create login or Register button
                
                let button: UIButton = UIButton(type: UIButtonType.System) as UIButton
                button.frame = CGRectMake(
                    pVC.emailContainerView.frame.origin.x,
                    pVC.emailContainerView.frame.origin.y + pVC.emailContainerView.frame.size.height + 145,
                    pVC.emailContainerView.frame.size.width,
                    50)
                
                button.backgroundColor = UIColor(
                    red: 255/255.0,
                    green: 111/255.0,
                    blue: 105/255.0,
                    alpha: 1.0)
               
                //Button name
                switch segueIdentifier {
                    
                case Constants.loginSignupSegueIdentifier.segueLogin.rawValue:
                    button.setTitle("Login", forState: UIControlState.Normal)
                    break
                    
                case Constants.loginSignupSegueIdentifier.segueRegister.rawValue:
                    button.setTitle("Register", forState: UIControlState.Normal)
                    break
                    
                default:
                    break
                }
                
                button.tintColor = UIColor.whiteColor()
//                button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
                pVC.view.addSubview(button)
                
                //Move button
                let rect:CGRect = CGRectMake(
                    pVC.emailContainerView.frame.origin.x,
                    pVC.emailContainerView.frame.origin.y + pVC.emailContainerView.frame.size.height + 15,
                    pVC.emailContainerView.frame.size.width,
                    50)

                
                //Animate the change of constraints
                UIView.animateWithDuration(0.2,
                    animations: {
                        button.frame = rect
                       }
                )
                

                isFirstTouched = false
                
            }
            
        }
        
    }
    
    //TODO: - Move down animation
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
