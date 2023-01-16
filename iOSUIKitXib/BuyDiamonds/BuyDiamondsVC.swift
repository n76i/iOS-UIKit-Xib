//
//  BuyDiamondsVC.swift
//  iOSUIKitXib
//
//  Created by HungND on 26/12/2022.
//

import UIKit

class BuyDiamondsVC: UIViewController {
    let diamondsData: [DiamondModel] = [
        DiamondModel(diamondNumber: 69, money: 100000, isSelect: true),
        DiamondModel(diamondNumber: 139, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 349, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 699, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 3499, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 6999, money: 100000, isSelect: false),
    ]
    
    
    @IBOutlet weak var diamondView: UIView!
    @IBOutlet weak var diamondCurrentTxt: UILabel!
    @IBOutlet weak var titletxt: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var diamondsClv: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setBackgroundImage()
        setupView()
        
        
    }
    
    func setupView() {
        //setup diamondsCollection
        diamondsClv.register(UINib(nibName: "DiamondCell", bundle: nil), forCellWithReuseIdentifier: "DiamondCell")
        diamondsClv.dataSource = self
        diamondsClv.delegate = self
        
        //setup contentView
        contentView.roundCorners([.topLeft, .topRight], radius: 18)
        
        //setup titleTxt
        titletxt.font = UIFont(name: "Sarabun-Regular", size: 18)
        
        //setup diamondView
        diamondView.layer.cornerRadius = 8
        
        //setup buy btn
//        buyBtn.setTitle("NẠP", for: .normal)
//        buyBtn.layoutIfNeeded()
//        let shape = CAShapeLayer()
//        buyBtn.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.8), endPoint: CGPoint(x: 1.0, y: 0.2), shape: shape)
    }
    
    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "buy_diamonds_bgr_img")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    
}

extension BuyDiamondsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diamondsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = diamondsClv.dequeueReusableCell(withReuseIdentifier: "DiamondCell", for: indexPath) as! DiamondCell
        
        cell.setupView(model: diamondsData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 2*8
        let width = UIScreen.main.bounds.width  - padding - 32
        return CGSize(width: width/3.0, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(diamondsData[indexPath.row].diamondNumber)
        
        for e in diamondsData {
            if (e.diamondNumber == diamondsData[indexPath.row].diamondNumber) {
                e.isSelect = true
            } else {
                e.isSelect = false
            }
        }
        
        
    }
}

