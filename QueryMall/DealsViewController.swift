//
//  DealsViewController.swift
//  QueryMall
//
//  Created by TunaYangSkey on 11/7/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//
//  The Deals View Controller provides a table view of the Sales Associate's current as well as
//  past deals. Each table cell contains an image of the deal and some brief information including
//  Price, Average price sold, Sold/Inventory, In progress and so on....
//
//  It communicates with the server every time this view controller is rendered. It gets the updated
//  list of deals with brief information. The view controller has several actions:
//      * Sharing the deals with customers
//      * Getting notifications directing to the sepecific deal
//      * Open a deal and see and edit it
//      * Add a new deal
//  
//  It uses a customized table cell: DealsTableViewCell to render the information of each deal



import UIKit
//import Alamofire

class DealsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    //---------------------------------
    //MARK: - Properties
    //---------------------------------
    var dataManager : DataManager!
    var refreshControl: UIRefreshControl!
    
    
    //---------------------------------
    //MARK: - Outlets
    //---------------------------------
    @IBOutlet var tableView: UITableView!

    //---------------------------------
    //TODO: - Hooking FILTERS button with methods, Hooking page layout buttons with methods, Replace dummy data with real communication with the server
    //---------------------------------
    
    
    
    //---------------------------------
    //MARK: - VC Lifecycle
    //---------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // Datamanager singleton object
        dataManager = DataManager.sharedInstance
        
        // Add pull down refresh control
        refreshControl = UIRefreshControl()
        refreshControl.backgroundColor = UIColor.redColor()
        refreshControl.tintColor = UIColor.yellowColor()
        refreshControl.addTarget(self, action: Selector("reloadData"), forControlEvents: UIControlEvents.ValueChanged)
            
        tableView.addSubview(refreshControl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    //---------------------------------
    // MARK: - Table view delegate methods
    //---------------------------------
    /**
    Tells the delegate that the specified row is now selected.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("touch on row: ", indexPath.row)
    }
    
    /**
    Asks the data source to return the number of sections in the table view.
     */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
         return 1
    }

    
    
    //---------------------------------
    // MARK: - Table view data source
    //---------------------------------
    /**
    Connect data source to the table and calculate the number of rows required
    Tells the data source to return the number of rows in a given section of a table view.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.sharedInstance.dealList.count
    }
    
    /**
     Render data to each cell of the table
     Asks the data source for a cell to insert in a particular location of the table view.
     */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //Use the customized table cell class to create the cell : DealsTableViewCell
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.DealsTableCell, forIndexPath: indexPath) as! DealsTableViewCell
       
        //Deal image and button view
        cell.dealsImageView.image = UIImage(named: Constants.DummyImgArray[indexPath.row])
        cell.dealsShareBtn.setImage(UIImage(named: "Share"), forState: .Normal)
        cell.dealsNotificationBtn.setImage(UIImage(named: "Bell"), forState: .Normal)
        
        
        //FIXME: - Change to real data
        //Deal brief description in the Label
        //Set number of lines of the label to 0 to allow for any number of lines
        cell.dealsDescLabel.numberOfLines = 0
        var txt:String = ""
        
        
        //Get the deal information
        let deal =  dataManager.dealList[indexPath.row]
        for (key, val) in deal.info {
            print(String(key))
            print(String(val))
            txt = txt + String(key) + String(val) + "\n"
        }
        
        cell.dealsDescLabel.text = txt
        cell.dealsDescLabel.font = UIFont(name: "Helvetica Neue", size: 13)
       
        //TODO: - More UI polish here
        
        
        return cell
    }
    

    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    //---------------------------------
    // MARK: - Refresh Functions
    //---------------------------------
    /**
     Scroll view delegate methods
     When scroll down to the bottom of the table view, load more deals from the server
     */
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height)
        {
            dataManager.loadDealsMore()
            self.tableView.reloadData()

        }
    }

    
    /**
     Pull down refresh call back function. When called, reload deal data from the server
     */
    func reloadData(){
        dataManager.loadDeals()
        
        tableView.reloadData()
        refreshControl?.endRefreshing()
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
