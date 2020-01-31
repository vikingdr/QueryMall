//
//  UIUtilities.swift
//  QueryMall
//
//  Created by TunaYangSkey on 11/7/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import Foundation

class UIUtilities: NSObject {
    
    class func drawTabBar(uiNaviController: UINavigationController, withTitle title: String) {
        
        //Navigation Bar title
        let shadow: NSShadow = NSShadow.init()
        shadow.shadowColor = UIColor(red:0.0, green:0.0, blue:0.0, alpha:0.8)
        shadow.shadowOffset = CGSizeMake(0, 1)
        
        uiNaviController.navigationBar.topItem!.title = title
        uiNaviController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),
                                                            NSFontAttributeName: UIFont(name: "HelveticaNeue-Bold", size: 25)!]
//                                                            ,NSShadowAttributeName: shadow]
        
        
        //Navigation Bar color
        uiNaviController.navigationBar.barTintColor = Constants.ColorOrange
        
        
        //Navigation Bar item color
        uiNaviController.navigationBar.tintColor = UIColor.whiteColor()

        
    }
    
    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}