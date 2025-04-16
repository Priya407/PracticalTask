//
//  ShopByOcaasionCVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 16/04/25.
//

import UIKit
import SDWebImage

class ShopByOcaasionCVC: UICollectionViewCell {

    @IBOutlet weak var viewMain: UIView!
    
    @IBOutlet weak var imgBoutie: UIImageView!
    
    @IBOutlet weak var lblOcassiontentext1: UILabel!
    @IBOutlet weak var lblOcassiontentext2: UILabel!
    @IBOutlet weak var lblOcassiontentext3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func categoryImage(imgUrl: String){
        imgBoutie.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imgBoutie.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: ""), options: .waitStoreCache)
        
    }
}
