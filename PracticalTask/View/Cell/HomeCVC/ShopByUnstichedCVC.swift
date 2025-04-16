//
//  ShopByUnstichedCVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import UIKit
import SDWebImage

class ShopByUnstichedCVC: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblUnstchedName: UILabel!
    @IBOutlet weak var imgUnstiched: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewMain.layer.shadowColor = UIColor.black.cgColor
        viewMain.layer.shadowOpacity = 0.2
        viewMain.layer.shadowOffset = CGSize(width: 0, height: 2)
        viewMain.layer.shadowRadius = 4
        viewMain.layer.masksToBounds = false
    }
    func categoryImage(imgUrl: String){
        imgUnstiched.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgUnstiched.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: ""), options: .waitStoreCache)
        
    }
}
