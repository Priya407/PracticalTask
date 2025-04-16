//
//  CategoryTVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import UIKit

class CategoryTVC: UITableViewCell {
    
    @IBOutlet weak var lblCategoryName: UILabel!
    
    @IBOutlet weak var imgCategory: UIImageView!
    
    @IBOutlet weak var viewMian: RightCurveView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
