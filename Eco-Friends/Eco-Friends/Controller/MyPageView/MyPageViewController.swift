//
//  MyPageViewController.swift
//  Eco-Friends
//
//  Created by 윤병일 on 2020/07/15.
//  Copyright © 2020 Byoungil Youn. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  
  //MARK: - Properties
  
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  //MARK: - viewDidLoad()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    setNavigation()
    setUI()
    setConstraint()
  }
  
  //MARK: - struct
  
  struct Standard {
    static let standard: CGFloat = 12
    static var inset = UIEdgeInsets(top: 12, left: 18, bottom: 0, right: 18)
  }
  
  //MARK: - setNavigation()
  
  private func setNavigation() {
    navigationItem.title = "마이페이지"
  
  }
  //MARK: - setUI()
  
  private func setUI() {
    view.backgroundColor = UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register( MyPageCollectionViewCell1.self, forCellWithReuseIdentifier:  MyPageCollectionViewCell1.identifier)
    collectionView.register(MyPageViewCollectionCell2.self, forCellWithReuseIdentifier: MyPageViewCollectionCell2.identifier)
    collectionView.register(MyPageViewCollectionCell3.self, forCellWithReuseIdentifier: MyPageViewCollectionCell3.identifier)
    view.addSubview(collectionView)
  }
  
  //MARK: -  setConstraint()
  
  private func setConstraint() {
    let guide = view.safeAreaLayoutGuide
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -100)
//      collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
    ])
  }
  
}

//MARK: - UICollectionViewDataSource

extension MyPageViewController : UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    1
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  MyPageCollectionViewCell1.identifier, for: indexPath) as!  MyPageCollectionViewCell1
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width / 19
     return cell
    } else if indexPath.section == 1 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageViewCollectionCell2.identifier, for: indexPath) as! MyPageViewCollectionCell2
      
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width / 19
      print("cell2 : ", cell.layer.cornerRadius)
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageViewCollectionCell3.identifier, for: indexPath) as! MyPageViewCollectionCell3
      cell.backgroundColor = .white
      cell.layer.cornerRadius = view.frame.width / 19
      print("cell3 :" , cell.layer.cornerRadius)
      return cell
    }

  }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MyPageViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 && indexPath.section ==  1{
      return CGSize(width: 339, height: 104)
    } else {
      return CGSize(width: 339, height: 300)
    }
  }
}
