//
//  ReserveViewController.swift
//  Pagetest
//
//  Created by Qussk_MAC on 2020/07/16.
//  Copyright © 2020 Qussk_MAC. All rights reserved.
//

import UIKit

class ReserveViewController: UIViewController {
  
  let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  let reserveButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "예약하기"
    
    collectionView.dataSource = self
    collectionView.delegate = self
    view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    
    setupView()
    setupConstrain()
    
  }
  //MARK:- UI
  func setupView(){
    
    collectionView.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    collectionView.register(ReserveSection1CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    collectionView.register(ReserveSection2CollectionViewCell.self, forCellWithReuseIdentifier: "Cell2")
    view.addSubview(collectionView)
    
    //67, 187, 254
    reserveButton.backgroundColor = UIColor(red: 67/255, green: 187/255, blue: 254/255, alpha: 1)
    reserveButton.setTitle("예약하기", for: .normal)
    reserveButton.setTitleColor(.white, for: .normal)
    reserveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    reserveButton.layer.cornerRadius = view.frame.width/17
    collectionView.addSubview(reserveButton)
  }
  
  func setupConstrain(){
    
    let guide = view.safeAreaLayoutGuide
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    reserveButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      
      collectionView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 6),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
      // collectionView.heightAnchor.constraint(equalTo: guide.widthAnchor, multiplier: 1)
      
      reserveButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
      reserveButton.heightAnchor.constraint(equalToConstant: 44),
      reserveButton.widthAnchor.constraint(equalToConstant: 251),
      reserveButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20)
    
    ])
  }
  
  struct Standard {
    static let standard: CGFloat = 12
    static var inset = UIEdgeInsets(top: 12, left: 18, bottom: 0, right: 18)
  }
  
}

//MARK:-UICollectionViewDataSource
extension ReserveViewController : UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    
    if section == 0 {
      return 1
    } else {
      return 2
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    
    
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ReserveSection1CollectionViewCell
      
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width/19
      
      
      return cell
      
    }else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath) as! ReserveSection2CollectionViewCell
      
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width/19
      
      return cell
    }
    
  }
  
}

//MARK:-UICollectionViewDelegateFlowLayout
extension ReserveViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if indexPath.section == 0{
      
      let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.standard
      let height = view.frame.height/2.4
      print(width)
      
      return CGSize(width: width, height: height)
    } else{
      
      
      let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right - Standard.standard
      let height = collectionView.frame.height/6.5
      return CGSize(width: width, height: height)
    }
    
  }
}
