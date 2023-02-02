//
//  WalletDiamondsViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 16/01/2023.
//

import UIKit

struct Diamond {
    var numberDiamond: String
    var vndPrice: String
    var sale: Bool
}

@available(iOS 13.0, *)
class WalletDiamondsViewController: UIViewController {
    
    @IBOutlet weak var diamondButton: UIButton!
    @IBOutlet weak var rubyButton: UIButton!
    @IBOutlet weak var roseButton: UIButton!
    
    @IBOutlet weak var strokeView1: UIView!
    @IBOutlet weak var strokeView2: UIView!
    
    @IBOutlet weak var selectDiamondView: UIView!
    @IBOutlet weak var selectRubyView: UIView!
    @IBOutlet weak var selectRoseView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var rubySuperView: UIView!
    @IBOutlet weak var roseSuperView: UIView!
    @IBOutlet weak var diamondSuperView: UIView!
    
    
    let arrData: [Diamond] = [
        Diamond(numberDiamond: "69", vndPrice: "100.000 vnd", sale: false),
        Diamond(numberDiamond: "139", vndPrice: "100.000 vnd", sale: true),
        Diamond(numberDiamond: "349", vndPrice: "100.000 vnd", sale: false),
        Diamond(numberDiamond: "699", vndPrice: "100.000 vnd", sale: true),
        Diamond(numberDiamond: "3499", vndPrice: "100.000 vnd", sale: true),
        Diamond(numberDiamond: "6999", vndPrice: "100.000 vnd", sale: true),
    ]
    var selectIndexPath: IndexPath = [1, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "18 Live +"
        
        setupSelectView()
        configCollectionView()
    }
    
    @IBAction func actionDiamond(_ sender: UIButton) {
        
        diamondButton.tag = 0
        rubyButton.tag = 1
        roseButton.tag = 2
        switch sender.tag {
        case 0:
            print("buton 1")
            setupViewDiamond()
        case 1:
            print("buton 2")
            setupViewRuby()
        default:
            print("buton 3")
            setupViewRose()
        }
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "buyDiamondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buyDiamondCollectionViewCell")
    }

    func setupViewDiamond() {
        diamondSuperView.isHidden = false
        roseSuperView.isHidden = true
        rubySuperView.isHidden = true
        
        selectDiamondView.isHidden = false
        selectRubyView.isHidden = true
        selectRoseView.isHidden = true
        diamondButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: diamondButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        selectDiamondView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        rubyButton.setTitleColor(UIColor(named: "555050"), for: .normal)
        roseButton.setTitleColor(UIColor(named: "555050"), for: .normal)
    }
    func setupViewRuby() {
        diamondSuperView.isHidden = true
        rubySuperView.isHidden = false
        roseSuperView.isHidden = true
        
        selectRubyView.isHidden = false
        selectRoseView.isHidden = true
        selectDiamondView.isHidden = true
        rubyButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: rubyButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        selectRubyView.layer.cornerRadius = 1
        selectRubyView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        roseButton.setTitleColor(UIColor(named: "555050"), for: .normal)
        diamondButton.setTitleColor(UIColor(named: "555050"), for: .normal)
    }
    func setupViewRose() {
        diamondSuperView.isHidden = true
        rubySuperView.isHidden = true
        roseSuperView.isHidden = false
        
        selectRoseView.isHidden = false
        selectRubyView.isHidden = true
        selectDiamondView.isHidden = true
        roseButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: roseButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        selectRoseView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        rubyButton.setTitleColor(UIColor(named: "555050"), for: .normal)
        diamondButton.setTitleColor(UIColor(named: "555050"), for: .normal)
    }
    func setupSelectView() {
        diamondSuperView.isHidden = false
        selectDiamondView.layer.cornerRadius = 1
        selectRubyView.layer.cornerRadius = 1
        selectRoseView.layer.cornerRadius = 1
        diamondButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: diamondButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        selectDiamondView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
    }
}
@available(iOS 13.0, *)
extension WalletDiamondsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buyDiamondCollectionViewCell", for: indexPath) as! buyDiamondCollectionViewCell
        cell.bindData(diamond: arrData[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width
        let collectionViewHeight = collectionView.bounds.height
        return CGSize(width: (collectionViewWidth - (16 + 46))/3 , height: (collectionViewHeight / 2) - 8)
//        return CGSize(width: 109.0, height: 67.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    //    //  set padding cho 4 cạnh colectionView
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .init(top: 0, left: 23, bottom: 0, right: 23)
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectIndexPath != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! buyDiamondCollectionViewCell

            let gradientBorder = UICollectionViewCell.gradientImage(bounds: cell.bounds, colors: [UIColor(named: "ColorBorCell1")!, UIColor(named: "ColorBorCell2")!, UIColor(named: "ColorBorCell3")!])
            let gradientColor = UIColor(patternImage: gradientBorder)
            cell.customView.backgroundColor =  UIColor(named: "SelectedCell")
            cell.layer.borderColor = gradientColor.cgColor
            cell.layer.borderWidth = 1.5
            cell.layer.cornerRadius = 8
            
            let cells = collectionView.cellForItem(at: self.selectIndexPath) as? buyDiamondCollectionViewCell
            cells?.customView.backgroundColor = UIColor(named: "CellDefault")
            cells?.layer.borderColor = UIColor.systemBackground.cgColor
            cells?.layer.borderWidth = 0
            self.selectIndexPath = indexPath
        }
            
    }
    
}

