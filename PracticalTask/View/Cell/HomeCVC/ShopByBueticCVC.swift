//
//  ShopByBueticCVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import UIKit
import SDWebImage

class ShopByBueticCVC: UICollectionViewCell {

    @IBOutlet weak var imgBuetic: UIImageView!
    @IBOutlet weak var lblBueticName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func categoryImage(imgUrl: String){
        imgBuetic.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgBuetic.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: ""), options: .waitStoreCache)
        
    }
}
