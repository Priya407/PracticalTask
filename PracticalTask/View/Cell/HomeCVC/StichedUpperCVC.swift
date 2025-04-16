//
//  StichedBottomCVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import UIKit
import SDWebImage

class StichedUpperCVC: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgStiched: UIImageView!
    @IBOutlet weak var lblStichhedText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func categoryImage(imgUrl: String){
        imgStiched.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgStiched.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: ""), options: .waitStoreCache)
        
    }
}
