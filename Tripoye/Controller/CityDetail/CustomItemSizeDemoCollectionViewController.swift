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
  @IBOutlet var lblTitle: UILabel!
  @IBOutlet var collectionView: UICollectionView!
    
  var alamofireSource :[InputSource] = [ImageSource(imageString: "goa1")!, ImageSource(imageString: "goa2")!, ImageSource(imageString: "goa1")!, ImageSource(imageString: "goa2")!]
    
  var imageSizes = [[CGSize]]()
  var imageCache = [[UIImage?]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.setupSlideView()
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
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

//MARK: Cuatum Method
extension CustomItemSizeDemoCollectionViewController{
    func setupSlideView(){
        headerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 175)
        headerView.slideshowInterval = 5.0
        headerView.pageControlPosition = PageControlPosition.insideScrollView
        headerView.pageControl.currentPageIndicatorTintColor = UIColor.gray
        headerView.pageControl.pageIndicatorTintColor = UIColor.white
        headerView.contentScaleMode = UIViewContentMode.scaleToFill
        
        if self.alamofireSource.count != 0{
            headerView.setImageInputs(self.alamofireSource)
        }
        headerView.activityIndicator = DefaultActivityIndicator()
    }
    
    @objc func viewAllButtonPress(_ sender: UIButton!){
        if sender.tag == 0{
            let topViewDeailController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.topViewDetailController) as! TopViewDetailController
            self.navigationController?.pushViewController(topViewDeailController, animated: true)
        }else{
            let bestViewDeailController = self.storyboard?.instantiateViewController(withIdentifier: StoryboardIdentifier.bestViewDeailController) as! BestViewDeailController
            self.navigationController?.pushViewController(bestViewDeailController, animated: true)
        }
        
    }
}

//MARK: IBAction Method
extension CustomItemSizeDemoCollectionViewController{
    @IBAction func btnBackPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnMenuPress(_ sender: Any) {
        
    }
    
    @IBAction func btnCartPress(_ sender: Any) {
        
    }
}

//MARK: CollectionView Delegate and DataSource Method
extension CustomItemSizeDemoCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringName.collViewCityInfoCell, for: indexPath) as! CityInfoCollectionViewCell
             return cell
        }else{
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StringName.secondCollViewCityInfoCell, for: indexPath) as! SecondCityInfoCollectionViewCell
             return cell
        }
        
       
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let inpath = (indexPath as NSIndexPath).section
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath)
        if let view = view as? HeaderCollectionReusableView {
          view.viewAllbBtn.tag = inpath
          view.viewAllbBtn.addTarget(self, action: #selector(viewAllButtonPress(_:)), for: .touchUpInside)
        }
        return view
    }
    
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


/*
 
 //     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
 //        let cell = cell as! ImageCollectionViewCell
 //        cell.imageView.image = imageCache[indexPath.section][indexPath.item]
 //    }
 
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
 //        }*/
