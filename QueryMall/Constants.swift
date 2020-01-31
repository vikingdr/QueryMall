//
//  Constants.swift
//  QueryMall
//
//  Created by TunaYangSkey on 10/22/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import UIKit


class Constants: NSObject {
    //MARK: - User Defaults Keys
    
    static let UDkeyIsLoggedIn = "UDkeyIsLoggedIn"
    static let UDkeyIsCustomer = "UDkeyIsCustomer"
    
    
    //FIXME:
    
    //TODO:
    
    
    //MARK: - UI Identities
    // All UI idenetity id needs to be recorded here
    
    static let LoginSignupStoryboard = "LoginSignup"
    static let LoginSignupVC = "LoginSignupLandingVC"
    static let loginSignup2ncVC = "LoginSignupSecondVC"
    
    static let SAStoryboard = "SA"
    static let SALandingVC = "SALandingVC"
    
    static let CustomerStoryboard = "Customer"
    static let CustomerLandingVC = "CustomerLandingVC"

    
    enum loginSignupSegueIdentifier: NSString {
        case segueRegister = "segueRegister"
        case segueLogin = "segueLogin"
        case segueSARegister = "segueSARegister"
        case segueEmbedEmailPasswordContainer = "segueEmbedEmailPasswordContainer"
        case segueEmbedSocialMediaContainer = "segueEmbedSocialMediaContainer"
    }

    
    enum SASegueIdentifier: NSString {
        case segueEmbedDealsFilter = "segueEmbedDealsFilter"
    }
    
    static let LoginSignTableCell = "LoginSignTableCell"
    static let DealsTableCell = "DealsTableCell"
    //FIXME: loginSignupSegueIdentifier
    
    
    
    //TODO:
    

    //MARK: - UI
    static let sWidth = UIScreen.mainScreen().bounds.size.width
    static let sHeight = UIScreen.mainScreen().bounds.size.height
   
    static let LoginDataArray = ["Email", "Password"]
    static let RegisterDataArray = ["Email", "Password", "Re-type password"]
    static let SARegisterDataArray = ["First name", "Last name", "Password", "Re-type password", "Company", "Compnay email", "Company phone", "Store zip code"]

    static let TransactionTabTitle = "Transactions"
    static let AnalyticsTabTitle = "Analytics"
    static let NetworksTabTitle = "Networks"
    static let SettingsTabTitle = "Settings"
    
    static let DealsTabTitle = "Current/History"

    
    
    static let ColorOrange = UIColor(
        red: 255/255.0,
        green: 111/255.0,
        blue: 105/255.0,
        alpha: 1.0)


    //MARK: - Communications
    
    //FIXME:
    
    //TODO:

    
    
    //MARK: - Server URL
    static let Server_Post_Signin_FB_URL = "http://54.209.73.140:8000/querymall_auth/signin_with_fb/"
    static let Server_Post_Signin_URL = "http://54.209.73.140:8000/querymall_auth/signin/"
    static let Server_Post_Signup_URL = "http://54.209.73.140:8000/querymall_auth/signup/"
    static let Server_Post_Signup_FB_URL = "http://54.209.73.140:8000/querymall_auth/signup_with_fb/"

    static let Server_Get_Deallist_URL = "http://54.209.73.140:8000/querymall_rest/deal/1/"
    
    //MARK: - Server Communication Key
    ///Login and Signup
    static let Key_Email = "email"
    static let Key_PSWD_Hash = "pswd_hash"
    static let Key_IPV4 = "ipv4"
    static let Key_User_ID_FB = "fbid"
    static let Key_Login_Token = "token"
    static let Key_User_Type = "user_type"
    ///Deals
    static let Key_Price = "price"
    static let Key_Average_Price = "average price"
    static let Key_Sold = "sold"
    static let Key_Inventory = "inventory"
    static let Key_In_Progress = "in progress"
    
    
    
    //MARK: - Dummy Data
    static var DummyMyDealss = [["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"],
        ["Price: ": "375", "Average price sold: ": "325", "Sold/Inventory: ": "12/20", "In progress: ": "2"]]

    static let DummyMyDeals : NSDictionary = ["deal1: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal2: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal3: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal4: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal5: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal6: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal7: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal8: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal9: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal10: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2],
        "deal11: " : ["Price: ": 375, "Average price sold: ": 325, "Sold/Inventory: ": 12/20, "In progress: ": 2]]

    static let DummyImgArray = ["DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4","DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4","DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4","DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4", "DImg5", "DImg6", "DImg7", "DImg8", "DImg1", "DImg2", "DImg3", "DImg4"]

    
    
}
