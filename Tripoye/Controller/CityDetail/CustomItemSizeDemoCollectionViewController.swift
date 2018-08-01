//
//  CustomItemSizeDemoCollectionViewController.swift
//  AppStoreCollectionViewLayout-Demo
//
//  Created by Pitiphong Phongpattranont on 29/10/2017.
//  Copyright © 2017 Pitiphong Phongpattranont. All rights reserved.
//

import UIKit


private let reuseIdentifier = "Cell"

class ImageCollectionViewCell: UICollectionViewCell {
  @IBOutlet var imageView: UIImageView!
}

class CustomItemSizeDemoCollectionViewController: UIViewController, CollectionViewDelegateShelfLayout {
  @IBOutlet var headerView: ImageSlideshow!
@IBOutlet var collectionView: UICollectionView!
  var imageSizes = [[CGSize]]()
  var imageCache = [[UIImage?]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    if #available(iOS 10.0, *) {
      collectionView?.refreshControl = refreshControl
    }
    
    if let layout = collectionView?.collectionViewLayout as? CollectionViewShelfLayout {
      layout.sectionCellInset = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        collectionView?.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: ShelfElementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView");//register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: ShelfElementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        layout.sectionHeaderHeight = 30
       // layout.he = CGSizeMake(self.collectionView!.frame.size.width, 66);
    }
    
    refresh()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @objc func refresh() {
    // Generate image size randomly with aspect ratio of 3:2 and the height is between 120 - 240 points with stepping of 20.0 points
    imageSizes = (0..<5).map({ _ in
      (0..<8).map({ _ in
        let height = (CGFloat(arc4random_uniform(6)) * 20.0) + 120.0
        let width = height * 3 / 2
        return CGSize(width: width, height: height)
      })
    })
    
    imageCache = (0..<5).map({ _ in
      Array(repeating: nil, count: 8)
    })
    
    collectionView?.reloadData()
    if #available(iOS 10.0, *) {
      collectionView?.refreshControl?.endRefreshing()
    }
  }
  
  
  
}

extension CustomItemSizeDemoCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
//
//        if imageCache[indexPath.section][indexPath.item] == nil {
//            let size = imageSizes[indexPath.section][indexPath.item]
//            var urlComponents = URLComponents(string: "https://dummyimage.com/3:2x\(size.height * collectionView.traitCollection.displayScale)")!
//            urlComponents.queryItems = [ URLQueryItem(name: "text", value: "\(Int(size.width))x\(Int(size.height))")]
//
//            let request = URLRequest.init(url: urlComponents.url!)
//            let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
//                if let data = data, let image = UIImage(data: data) {
//                    self?.imageCache[indexPath.section][indexPath.item] = image
//                    DispatchQueue.main.async {
//                        if let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell {
//                            cell.imageView.image = image
//                        }
//                    }
//                }
//            })
//            task.resume()
//        }
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringName.collViewCityInfoCell, for: indexPath) as! CityInfoCollectionViewCell
             return cell
        }else{
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringName.secondCollViewCityInfoCell, for: indexPath) as! SecondCityInfoCollectionViewCell
             return cell
        }
        
       
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //        switch kind {
        //        case ShelfElementKindSectionHeader:
        //            let cellHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        //
        //            return cellHeader
        //        default:
        //            assert(false, "Unexpected element kind")
        //        }
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath)
        if let view = view as? HeaderCollectionReusableView {
            //            view.label.text = sections[(indexPath as NSIndexPath).section].rawValue
            //            view.button.setTitle("See All >", for: UIControlState())
            //            view.button.setTitleColor(UIColor.darkGray, for: UIControlState())
            //            view.delegate = self
        }
        return view
    }
//     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let cell = cell as! ImageCollectionViewCell
//        cell.imageView.image = imageCache[indexPath.section][indexPath.item]
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0{
            return CGSize(width:collectionView.frame.size.width , height:55)
        }else{
            return CGSize(width:collectionView.frame.size.width , height:100)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0{
            return CGSize(width: 150, height: 175)
        }else{
            return CGSize(width: 250, height: 300)
        }
        //imageSizes[indexPath.section][indexPath.item]
    }
}