//
//  HomeVC.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var colletionCategory: UICollectionView!
    @IBOutlet weak var collectionStichedTop: UICollectionView!
    @IBOutlet weak var collectionStichedBottom: UICollectionView!
    @IBOutlet weak var colletionFabric: UICollectionView!
    @IBOutlet weak var colletionUnstiched: UICollectionView!
    @IBOutlet weak var colletionBeutic: UICollectionView!
    @IBOutlet weak var colletionRangeofPattern: UICollectionView!
    @IBOutlet weak var colletionDesignOccasion: UICollectionView!
    @IBOutlet weak var collectionBeuticHeight: NSLayoutConstraint!
    @IBOutlet weak var colletionOccasionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var pageControlboutie: UIPageControl!
    
    @IBOutlet weak var lblShopCategory: UILabel!
    @IBOutlet weak var lblShopFabric: UILabel!
    @IBOutlet weak var lblShopUnstiched: UILabel!
    @IBOutlet weak var lblBoutiec: UILabel!
    @IBOutlet weak var lblRagePattern: UILabel!
    @IBOutlet weak var lblOcassion: UILabel!
    
    @IBOutlet weak var collectionRangeHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionCategoryHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionFabricHeight: NSLayoutConstraint!
    
    var upperDataModel: HomeUpperDataModel?
    var middleDataModel: HomeMiddleDataModel?
    var bottomDataModel: HomeBottomDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        colletionBeutic.register(UINib(nibName: "ShopByBueticCVC", bundle: nil), forCellWithReuseIdentifier: "ShopByBueticCVC")
        colletionCategory.register(UINib(nibName: "ShopByCategoryCVC", bundle: nil), forCellWithReuseIdentifier: "ShopByCategoryCVC")
        colletionFabric.register(UINib(nibName: "ShopByFabric", bundle: nil), forCellWithReuseIdentifier: "ShopByFabric")
        colletionDesignOccasion.register(UINib(nibName: "ShopByOcaasionCVC", bundle: nil), forCellWithReuseIdentifier: "ShopByOcaasionCVC")
        colletionUnstiched.register(UINib(nibName: "ShopByUnstichedCVC", bundle: nil), forCellWithReuseIdentifier: "ShopByUnstichedCVC")
        collectionStichedBottom.register(UINib(nibName: "StichedBottomCVC", bundle: nil), forCellWithReuseIdentifier: "StichedBottomCVC")
        collectionStichedTop.register(UINib(nibName: "StichedUpperCVC", bundle: nil), forCellWithReuseIdentifier: "StichedUpperCVC")
        colletionRangeofPattern.register(UINib(nibName: "ShopByFabric", bundle: nil), forCellWithReuseIdentifier: "ShopByFabric")
        HomeTopApiCall()
        HomeMiddleApiCall()
        HomeBottomApiCall()
        pageControlboutie.currentPage = 0
        collectionStichedBottom.decelerationRate = .fast
        collectionStichedBottom.showsHorizontalScrollIndicator = false
        colletionUnstiched.decelerationRate = .fast
        colletionUnstiched.showsHorizontalScrollIndicator = false
        let floawLayout = UPCarouselFlowLayout()
        floawLayout.scrollDirection = .horizontal
        floawLayout.sideItemScale = 1
        floawLayout.sideItemAlpha = 1.0
        floawLayout.spacingMode = .fixed(spacing: 5.0)
        collectionStichedBottom.collectionViewLayout = floawLayout
        let floawLayoutforunstched = UPCarouselFlowLayout()
        floawLayoutforunstched.scrollDirection = .horizontal
        floawLayoutforunstched.sideItemScale = 1
        floawLayoutforunstched.sideItemAlpha = 1.2
        floawLayoutforunstched.spacingMode = .fixed(spacing: 10.0)
        colletionUnstiched.collectionViewLayout = floawLayoutforunstched
    }
    
    func HomeTopApiCall(){
        APIManager.shared.api_request(
            task: Constant.API.homeTopApi.rawValue,
            headers: nil,
            param: nil
        ) { (success: SuccessReponse<HomeUpperDataModel>?, failure) in
            if let uppdedatamodel = success?.data {
                DispatchQueue.main.async {
                    self.upperDataModel = uppdedatamodel
                    self.collectionStichedTop.reloadData()
                    self.collectionStichedBottom.reloadData()
                }
            } else if let error = failure {
                print("API Error: \(error.message ?? "Data is not getting")")
            }
        }
    }
    func HomeMiddleApiCall(){
        APIManager.shared.api_request(
            task: Constant.API.homeMiddleApi.rawValue,
            headers: nil,
            param: nil
        ) { (success: SuccessReponse<HomeMiddleDataModel>?, failure) in
            if let middleData = success?.data {
                DispatchQueue.main.async {
                    self.middleDataModel = middleData
                    self.pageControlboutie.numberOfPages = middleData.boutique_collection?.count ?? 0
                    self.colletionCategory.reloadData()
                    self.colletionFabric.reloadData()
                    self.colletionUnstiched.reloadData()
                    self.colletionBeutic.reloadData()
                    
                }
            } else if let error = failure {
                print("API Error: \(error.message ?? "Data is not getting")")
                
            }
        }
    }
    func HomeBottomApiCall(){
        APIManager.shared.api_request(
            task: Constant.API.homemBottomApi.rawValue,
            headers: nil,
            param: nil
        ) { (success: SuccessReponse<HomeBottomDataModel>?, failure) in
            if let bottomModel = success?.data {
                DispatchQueue.main.async {
                    self.bottomDataModel = bottomModel
                    self.colletionRangeofPattern.reloadData()
                    self.colletionDesignOccasion.reloadData()
                }
            } else if let error = failure {
                print("API Error: \(error.message ?? "Data is not getting")")
                
            }
        }
    }
    func setupCarouselLayout() {
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 60, height: collectionStichedBottom.frame.height)
        layout.sideItemScale = 0.8
        layout.sideItemAlpha = 0.8
        layout.spacingMode = .fixed(spacing: 10)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

        collectionStichedBottom.clipsToBounds = false
        collectionStichedBottom.setCollectionViewLayout(layout, animated: false)
        collectionStichedBottom.decelerationRate = .fast
        collectionStichedBottom.reloadData()
    }
}
extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case collectionStichedTop:
            return upperDataModel?.main_sticky_menu?.count ?? 0
        case collectionStichedBottom:
            return upperDataModel?.main_sticky_menu?[0].slider_images?.count ?? 0
        case colletionCategory:
            return middleDataModel?.shop_by_category?.count ?? 0
        case colletionFabric:
            return middleDataModel?.shop_by_fabric?.count ?? 0
        case colletionUnstiched:
            return middleDataModel?.unstitched?.count ?? 0
        case colletionBeutic:
            return middleDataModel?.boutique_collection?.count ?? 0
        case colletionRangeofPattern:
            return bottomDataModel?.range_of_pattern?.count ?? 0
        case colletionDesignOccasion:
            return  bottomDataModel?.design_occasion?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionStichedTop{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StichedUpperCVC", for: indexPath) as? StichedUpperCVC else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                cell.viewMain.layer.cornerRadius = 8
            }
            cell.lblStichhedText.text = upperDataModel?.main_sticky_menu?[indexPath.item].title
            if let url = upperDataModel?.main_sticky_menu?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
            
        }else if collectionView == collectionStichedBottom{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StichedBottomCVC", for: indexPath) as? StichedBottomCVC else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                cell.viewMain.layer.cornerRadius = 8
                cell.stackMiddle.layer.cornerRadius = 8
            }
            cell.lblUpperStichedText.text = upperDataModel?.main_sticky_menu?[0].slider_images?[indexPath.item].title
            cell.lblMiddleStichedText.text = upperDataModel?.main_sticky_menu?[0].slider_images?[indexPath.item].sort_order
            cell.lblLowerStichedText.text = "Explore"
            if let url = upperDataModel?.main_sticky_menu?[0].slider_images?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }else if collectionView == colletionCategory{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByCategoryCVC", for: indexPath) as? ShopByCategoryCVC else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                self.collectionCategoryHeight.constant = collectionView.contentSize.height
                cell.viewMain.layer.cornerRadius = 8
            }
            cell.viewMain.backgroundColor = UIColor(hex: middleDataModel?.shop_by_category?[indexPath.item].tint_color ?? "")
            cell.lblCategory.text = middleDataModel?.shop_by_category?[indexPath.item].name
            cell.lblExplore.text = "Explore"
            if let url = middleDataModel?.shop_by_category?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }else if collectionView == colletionFabric{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByFabric", for: indexPath) as? ShopByFabric else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                self.collectionFabricHeight.constant = collectionView.contentSize.height
            }
            DispatchQueue.main.async {
                cell.viewMain.layer.cornerRadius = cell.viewMain.layer.frame.height / 2
            }
            cell.lblCategory.text = middleDataModel?.shop_by_fabric?[indexPath.item].name
            if let url = middleDataModel?.shop_by_fabric?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }else if collectionView == colletionUnstiched{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByUnstichedCVC", for: indexPath) as? ShopByUnstichedCVC else { return UICollectionViewCell() }
            cell.lblSubtitle.text = middleDataModel?.unstitched?[indexPath.item].description
            cell.lblUnstchedName.text = middleDataModel?.unstitched?[indexPath.item].name
            if let url = middleDataModel?.unstitched?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }else if collectionView == colletionBeutic{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByBueticCVC", for: indexPath) as? ShopByBueticCVC else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                self.collectionBeuticHeight.constant = collectionView.contentSize.height
            }
            cell.lblBueticName.text = middleDataModel?.boutique_collection?[indexPath.item].name
            if let url = middleDataModel?.boutique_collection?[indexPath.item].banner_image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }else if collectionView == colletionRangeofPattern{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByFabric", for: indexPath) as? ShopByFabric else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                cell.viewMain.layer.cornerRadius = cell.viewMain.layer.frame.height / 2
            }
            cell.lblCategory.text = bottomDataModel?.range_of_pattern?[indexPath.item].name
            if let url = bottomDataModel?.range_of_pattern?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }else if collectionView == colletionDesignOccasion{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByOcaasionCVC", for: indexPath) as? ShopByOcaasionCVC else { return UICollectionViewCell() }
            DispatchQueue.main.async {
                self.colletionOccasionHeight.constant = collectionView.contentSize.height
                cell.viewMain.layer.cornerRadius = 8
                }
            cell.lblOcassiontentext1.text = bottomDataModel?.design_occasion?[indexPath.item].name
            cell.lblOcassiontentext2.text = bottomDataModel?.design_occasion?[indexPath.item].sub_name
            cell.lblOcassiontentext3.text = bottomDataModel?.design_occasion?[indexPath.item].cta
            if let url = bottomDataModel?.design_occasion?[indexPath.item].image{
                cell.categoryImage(imgUrl: url)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == colletionFabric || collectionView == colletionRangeofPattern {
            let verticalSpacing: CGFloat = 10
            let numberOfRows: CGFloat = 2
            let totalVerticalSpacing = verticalSpacing * (numberOfRows - 1)
            let availableHeight = collectionView.bounds.height - totalVerticalSpacing
            let itemHeight = availableHeight / numberOfRows
            let itemWidth = itemHeight
            return CGSize(width: itemWidth, height: itemHeight)
        } else if collectionView == colletionBeutic {
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width + 100)
            
        } else if collectionView == colletionCategory || collectionView == colletionDesignOccasion {
            let verticalSpacing: CGFloat = 10
            let numberOfRows: CGFloat = 2
            let totalVerticalSpacing = verticalSpacing * (numberOfRows - 1)
            let availableHeight = collectionView.bounds.height - totalVerticalSpacing
            let itemHeight = availableHeight / numberOfRows
            let itemWidth = itemHeight
            if collectionView == colletionDesignOccasion{
                return CGSize(width: itemWidth - 10, height: itemHeight - 10)
            }else{
                return CGSize(width: itemWidth - 50 , height: itemHeight )
            }
        }else if collectionView ==  collectionStichedBottom{
            let width = collectionView.frame.width - 80
            let height = collectionView.frame.height - 80
            return CGSize(width: width, height: height)
        } else if collectionView == colletionUnstiched {
            let itemWidth = collectionView.frame.width - 50
            let itemHeight = collectionView.frame.height
            return CGSize(width: itemWidth, height: itemHeight)
        }else if collectionView == collectionStichedTop{
            let verticalSpacing: CGFloat = 10
                let itemHeight = collectionView.bounds.height - verticalSpacing
                let itemWidth = itemHeight
                return CGSize(width: itemWidth + 40, height: itemHeight)
        }

        return CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == colletionCategory || collectionView == colletionFabric || collectionView == colletionRangeofPattern || collectionView == colletionDesignOccasion || collectionView == collectionStichedTop || collectionView == collectionStichedBottom{
            return 10
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == colletionCategory{
            return 10
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == colletionCategory || collectionView == colletionFabric || collectionView == colletionRangeofPattern || collectionView == collectionStichedTop || collectionView == collectionStichedBottom{
            return UIEdgeInsets(top: 0.0, left: 10, bottom: 0.0, right: 10)
        }else{
            return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0)
        }
    }
}
extension HomeVC{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x) / Int(scrollView.frame.width)
        pageControlboutie.currentPage = index
    }
}
