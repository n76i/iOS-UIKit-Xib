//
//  CollectionViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/01/2023.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrImage: [String] = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
       
    }
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "TestCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TestCollectionViewCell")
//        // đổi hướng scroll của colectionView
//        if  let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//        }
    }

    
}
extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    // Số lượng section trong collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // số lượng item trong một section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCollectionViewCell", for: indexPath) as! TestCollectionViewCell
        cell.nameImage.image = UIImage(named: arrImage[indexPath.row])
        
        return cell
    }
    // Set kích thước cho từng item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with = (collectionView.bounds.width - 32) / 3
        return CGSize(width: with, height: with)
    }
    // set khoảng cách từng item trên 1 dòng
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
        //  set padding cho 4 cạnh colectionView
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return .init(top: 100, left: 8, bottom: 200, right: 8)
        }
        // set khoảng cách giữa các dòng
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 6
        }
    // sự kiện chọn vào item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("section \(indexPath.section) - row\(indexPath.row)")
    }
}
