//
//  Data.swift
//  QueryMall
//
//  Created by Sudikoff Lab iMac on 11/18/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import Foundation

class DataManager{
    
    //Singleton object
    static let sharedInstance = DataManager()
    
    //All objects come with a default public initializer in Swift
    //This prevents others from using the default '()' initializer for this class.
    private init(){
        
    }
    
    
    //MARK: - Properties
    var dealList: [Deal] = []
    /*
    var customerList: [Customer] = []
    var orderList: [Order] = []
    */
    
    
    //---------------------------------
    // MARK: - Communication with Server
    // TODO: - Requesting data from the server
    //---------------------------------
    /**
    Retrieve deals data from the server and reload it to the table view
    */
    func loadDeals() {
        
        //        Alamofire.request(.GET, Constants.Server_Get_Deallist_URL, parameters: nil)
        //            .responseJSON { response in
        //                print("Alamofire request: \(response.request)")  // original URL request
        //                print("Alamofire response: \(response.response)") // URL response
        //                print("Alamofire data: \(response.data)")     // server data
        //                print("Alamofire result: \(response.result)")   // result of response serialization
        //
        //                if let JSON = response.result.value {
        //                    print("JSON: \(JSON)")
        //                }
        //        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            
            Server.get(Constants.Server_Get_Deallist_URL, completionHandler: {
                (data) in
                print(data)
                self.dealList = data
                
//                //Reload table view data in the main thread
//                dispatch_async(dispatch_get_main_queue()) {
//                    self.tableView.reloadData()
//                }
            })
        }
        
    }
    
    func loadDealsMore() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)){
            
            Server.get(Constants.Server_Get_Deallist_URL, completionHandler: {
                (data) in
                print(data)
                
                
                for var i=0; i<2; i++ {
                    self.dealList.append(data[i])
                }
                
                //                self.deals.addObjectsFromArray(data as NSArray as [AnyObject])
                
//                //Reload table view data in the main thread
//                dispatch_async(dispatch_get_main_queue()) {
//                    self.tableView.reloadData()
//                }
            })
        }
        
    }
    
    

    
    
}