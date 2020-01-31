//
//  DealsTableViewCell.swift
//  QueryMall
//
//  Created by TunaYangSkey on 11/7/15.
//  Copyright © 2015 QueryMall. All rights reserved.
//

import UIKit

class DealsTableViewCell: UITableViewCell {

    //MARK: - Outlets and Properties
    @IBOutlet var dealsImageView: UIImageView!
    @IBOutlet var dealsNotificationBtn: UIButton!
    @IBOutlet var dealsShareBtn: UIButton!
    @IBOutlet var dealsDescLabel: UILabel!
    
    
    
    //MARK: - Actions
    /**
    
    */
    @IBAction func openNotifications(sender: AnyObject) {
    }
    
    @IBAction func shareDeals(sender: AnyObject) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
