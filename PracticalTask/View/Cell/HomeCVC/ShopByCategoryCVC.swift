//
//  ShopByFabricCVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import UIKit
import SDWebImage

class ShopByCategoryCVC: UICollectionViewCell {
    
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblExplore: UILabel!
    
    @IBOutlet weak var imgCategory: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func categoryImage(imgUrl: String){
        imgCategory.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgCategory.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: ""), options: .waitStoreCache)
        
    }

}
