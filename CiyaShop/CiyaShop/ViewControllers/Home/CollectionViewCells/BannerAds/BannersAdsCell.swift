//
//  TopCategoriesCell.swift
//  CiyaShop
//
//  Created by Apple on 22/09/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftyJSON

class BannersAdsCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    @IBOutlet weak var cvBannerAds: UICollectionView!
    @IBOutlet weak var cvHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cvWidthConstraint: NSLayoutConstraint!
    
    var timer = Timer()
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()

    }
    
    // MARK: - Configuration
       private func setupCollectionView() {
        
        cvBannerAds.delegate = self
        cvBannerAds.dataSource = self
        
        cvBannerAds.setBackgroundColor()
        
        if let layout = cvBannerAds.collectionViewLayout as? MMBannerLayout {
            layout.itemSpace = 10
            layout.itemSize = UIScreen.main.bounds.insetBy(dx: 10, dy: 10).size
            layout.minimuAlpha = 1
        }
        
        cvBannerAds.register(UINib(nibName: "BannerAdsItemCell", bundle: nil), forCellWithReuseIdentifier: "BannerAdsItemCell")
        
        cvWidthConstraint.constant = screenWidth
    
        self.cvBannerAds.reloadData()
       
        (cvBannerAds.collectionViewLayout as? MMBannerLayout)?.setInfinite(isInfinite: true, completed: nil)
        (cvBannerAds.collectionViewLayout as? MMBannerLayout)?.angle = 0
        
        //        DispatchQueue.main.async {
        //            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        //        }
        
        if isRTL {
            cvBannerAds.semanticContentAttribute = .forceRightToLeft
        }
        
    }
    
    
//    @objc func changeImage() {
//        if counter < arrSliders.count {
//            let index = IndexPath.init(item: counter, section: 0)
//            cvBannerAds.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
////            pageView.currentPage = counter
//            counter += 1
//        } else {
//            counter = 0
//            let index = IndexPath.init(item: counter, section: 0)
//            cvBannerAds.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
////            pageView.currentPage = counter
//            counter = 1
//        }
//
//    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        self.contentView.frame = self.bounds
        self.contentView.layoutIfNeeded()
        
        cvWidthConstraint.constant = screenWidth
        cvHeightConstraint.constant = self.cvBannerAds.contentSize.height
        
        return  CGSize(width: self.cvBannerAds.contentSize.width, height: self.cvBannerAds.contentSize.height)
    }
    

    // MARK: - UICollection Delegate methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
        return arrBannersAd.count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerAdsItemCell", for: indexPath) as! BannerAdsItemCell
        
        
        let imageUrl = arrBannersAd[indexPath.row]["banner_ad_image_url"].string
        
        if imageUrl != nil {
            cell.imgBanner.sd_setImage(with: imageUrl!.encodeURL() as URL) { (image, error, cacheType, imageURL) in
                if (image == nil) {
                    cell.imgBanner.image = UIImage(named: "noImage")
                }
            }
        } else {
            cell.imgBanner.image = nil
        }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width-80 , height: 140*collectionView.frame.size.width/375)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let productsVC = ProductsVC(nibName: "ProductsVC", bundle: nil)
        productsVC.fromCategory = true
        productsVC.categoryID = arrBannersAd[indexPath.row]["banner_ad_cat_id"].intValue
        self.parentContainerViewController()?.navigationController?.pushViewController(productsVC, animated: true)
        
        
    }
}
