//
//  StichedUpperCVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import UIKit
import SDWebImage

class StichedBottomCVC: UICollectionViewCell {

    @IBOutlet weak var stackMiddle: UIStackView!
    @IBOutlet weak var viewMain: UIView!
   
    @IBOutlet weak var imgSticched: UIImageView!
    
    @IBOutlet weak var lblLowerStichedText: UILabel!
    @IBOutlet weak var lblUpperStichedText: UILabel!
    @IBOutlet weak var lblMiddleStichedText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func categoryImage(imgUrl: String){
        imgSticched.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgSticched.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: ""), options: .waitStoreCache)
        
    }
}
