//
//  DescriptionViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class : UIViewController {
  
  let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  //라벨
  let descriptionTitle = UILabel()
  let descriptionLable = UILabel()
  
  //스크롤뷰
  //  lazy var scrollView = UIScrollView()
  //  var scrollFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
  let images = ["naver","instagram","naver"]
  
  //페이지뷰
  lazy var pageControl = UIPageControl(frame: CGRect(x: view.frame.midX - 100, y: view.frame.maxY - 200, width: 200, height: 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "친환경 기업"
    collectionView.dataSource = self
    collectionView.delegate = self
   
    navigationLess()
    setupView()
    setipConstrain()
    // setScrollView()
    pageViewControl()
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    UIView.animate(withDuration: 1.5) {
      self.descriptionTitle.alpha = 1
      
    }
  }
  
  //MARK:- UI
  func setupView(){
    
    descriptionTitle.text = "환경을 살리는\n기업을 알아보세요."
    descriptionTitle.numberOfLines = 2
    descriptionTitle.alpha = 0
    descriptionTitle.font = UIFont(name: "PingFangHK-Light", size: 25)
    view.addSubview(descriptionTitle)
    
    descriptionLable.text = "우리의 노력으로 새로운"
    descriptionLable.font = UIFont.systemFont(ofSize: 14)
    descriptionLable.textColor = ColorPiker.customGray
    view.addSubview(descriptionLable)
    
    collectionView.backgroundColor = .red
    collectionView.register(DescriotionCollectionViewCell.self, forCellWithReuseIdentifier: "deCell")
    view.addSubview(collectionView)
    

    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    
    //    scrollView.contentSize = CGSize(width: 375 * 3, height: scrollView.frame.height)
    //    scrollView.delegate = self
    //    scrollView.isPagingEnabled = true
    //    scrollView.backgroundColor = .red
    //    view.addSubview(scrollView)
    view.addSubview(pageControl)
  }
  
  func navigationLess(){
    //네비게이션바 디자인 생략
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  //MARK:-setipConstrain
  func setipConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    [descriptionTitle,descriptionLable].forEach{
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 34).isActive = true
      $0.trailingAnchor.constraint(equalTo: guide.trailingAnchor,constant: -34).isActive = true
    }
    
    //scrollView.translatesAutoresizingMaskIntoConstraints = false
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      descriptionTitle.topAnchor.constraint(equalTo: guide.topAnchor, constant: 18),
      
      descriptionLable.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 16),
      
      collectionView.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 37),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.heightAnchor.constraint(equalToConstant: 430),
      
      pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
      pageControl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      
    ])
  }
  //MARK:-ScrollView
  func setScrollView(){
    //
    //    for index in images.indices {
    //      scrollFrame.origin.x = view.frame.width * CGFloat(index)
    //      scrollFrame.size = scrollView.frame.size
    //
    //
    //      let descriptionImage = UIImageView()
    //      descriptionImage.image = UIImage(named: images[index])
    //      descriptionImage.frame = CGRect(x: scrollFrame.origin.x, y: 0, width: 375, height: 430)
    //      scrollView.addSubview(descriptionImage)
    //
    //    }
  }
  
  struct Standard {
    static let standard: CGFloat = 12
    static var inset = UIEdgeInsets(top: 12, left: 18, bottom: 0, right: 18)
  }
  
  //MARK:-pageView
  func pageViewControl(){
    
    pageControl.numberOfPages = images.count
    pageControl.currentPage = 0
    pageControl.pageIndicatorTintColor = .lightGray
    pageControl.currentPageIndicatorTintColor = ColorPiker.customBlue
    pageControl.addTarget(self, action: #selector(handlePageControl(_:)), for: .valueChanged)
    
  }
  
  
  @objc func handlePageControl(_ sender: UIPageControl) {
    //  let x = CGFloat(pageControl.currentPage) * scrollView.frame.width
    //scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
  }
  
}


//MARK:-UIScrollViewDelegate
extension DescriptionViewController: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.width)
    pageControl.currentPage = Int(pageNumber)
  }
  
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//          let centerX = self.collectionView.center.x
//
//          for cell in self.collectionView.visibleCells {
//            cell.transform = CGAffineTransform(scaleX: Standard.standard, y: Standard.standard)
//
//              // change the alpha of the image view
//              let coverCell = cell as! DescriotionCollectionViewCell
//            //  coverCell.coverImageView.alpha = changeSizeScaleToAlphaScale(scale)
//          }
//      }
//
//        func changeSizeScaleToAlphaScale(_ x : CGFloat) -> CGFloat {
//          let minScale : CGFloat = 0.86
//          let maxScale : CGFloat = 1.0
//
//          let minAlpha : CGFloat = 0.25
//          let maxAlpha : CGFloat = 1.0
//
//          return ((maxAlpha - minAlpha) * (x - minScale)) / (maxScale - minScale) + minAlpha
//      }
  }
  
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let pageWidth = 430 + 30
//
//    let currentOffset = scrollView.contentOffset.x
//    let targetOffset = targetContentOffset
//    let newTargetOffset = 0
//
//    if (targetOffset > currentOffset) {
//            newTargetOffset = ceilf(currentOffset /pageWidth) * pageWidth
//    } else {
//            newTargetOffset = floorf(currentOffset /pageWidth) * pageWidth
//
//      if (newTargetOffset < 0) {
//            newTargetOffset = 0;
//        else if (newTargetOffset > scrollView.contentSize.width)
//            newTargetOffset = scrollView.contentSize.width;
//
//        targetContentOffset->x = currentOffset
//        [scrollView setContentOffset:CGPointMake(newTargetOffset, scrollView.contentOffset.y) animated:YES];

    }


extension DescriptionViewController: UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "deCell", for: indexPath) as! DescriotionCollectionViewCell
    cell.backgroundColor = .white
    return cell
  }
}

//MARK:-UICollectionViewDelegateFlowLayout
extension DescriptionViewController : UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.standard
    let height = view.frame.height/2
    print(width)
    
    return CGSize(width: width, height: height)
  }


}

