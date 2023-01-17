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
    @IBOutlet weak var diamondVỉew: UIView!
    
    @IBOutlet weak var rubyButton: UIButton!
    @IBOutlet weak var rubyView: UIView!
    
    @IBOutlet weak var roseButton: UIButton!
    @IBOutlet weak var roseView: UIView!
    
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
//        UINavigationBarAppearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Sarabun", size: 20)!, NSAttributedString.Key.foregroundColor: UIColor.black]
      
//        setNavigationBar()
        setupButton()
        
        strokeView1.layer.cornerRadius = 5
        strokeView1.layer.borderColor = UIColor(red: 0.871, green: 0.845, blue: 0.845, alpha: 1).cgColor
        strokeView2.layer.cornerRadius = 5
        strokeView2.layer.borderColor = UIColor(red: 0.871, green: 0.845, blue: 0.845, alpha: 1).cgColor
        configCollectionView()
    }
    
    @IBAction func actionDiamond(_ sender: UIButton) {
        
        diamondButton.tag = 0
        rubyButton.tag = 1
        roseButton.tag = 2
        switch sender.tag {
        case 0:
            print("btn1")
            setupViewDiamond()
        case 1:
            print("select 2")
            setupViewRuby()
        default:
            print("last button")
            setupViewRose()
        }
    }
    @IBAction func actionRuby(_ sender: UIButton) {
//        setupViewRuby()
    }
    @IBAction func actionRose(_ sender: UIButton) {
//        setupViewRose()
    }
    
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "buyDiamondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buyDiamondCollectionViewCell")
    }

    func setupViewDiamond() {
        diamondButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
//        diamondVỉew.gradientButton(diamondButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        diamondVỉew.gradientButton2(diamondVỉew, diamondButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        selectDiamondView.layer.cornerRadius = 1
        selectDiamondView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        rubyButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        rubyView.gradientButton2(rubyView, rubyButton, startColor: .black, endColor: .black)
        selectRubyView.layer.cornerRadius = 1
        selectRubyView.applyGradient(colors: [.clear, .clear], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)

        roseButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        roseView.gradientButton2(roseView, roseButton, startColor: .black, endColor: .black)
        selectRoseView.layer.cornerRadius = 1
        selectRoseView.applyGradient(colors: [.clear, .clear], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
    }
    func setupViewRuby() {
        
        diamondButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        diamondButton.gradientButton2(diamondVỉew, diamondButton, startColor: .black, endColor: .black)
        selectDiamondView.layer.cornerRadius = 1
        selectDiamondView.applyGradient(colors: [.clear, .clear], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)

        roseButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        roseView.gradientButton2(roseView, roseButton, startColor: .black, endColor: .black)
        selectRoseView.layer.cornerRadius = 1
        selectRoseView.applyGradient(colors: [.clear, .clear], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        rubyButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        rubyView.gradientButton2(rubyView, rubyButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        selectRubyView.layer.cornerRadius = 1
        selectRubyView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
    
    }
    func setupViewRose() {
        
//        rubyButton.setTitle("Ruby", for: .normal)
        rubyButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        rubyView.gradientButton2(rubyView, rubyButton, startColor: .black, endColor: .black)
        selectRubyView.layer.cornerRadius = 1
        selectRubyView.applyGradient(colors: [.clear, .clear], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)

//        diamondButton.setTitle("Kim cương", for: .normal)
        diamondButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        diamondButton.gradientButton2(diamondVỉew, diamondButton, startColor: .black, endColor: .black)
        selectDiamondView.layer.cornerRadius = 1
        selectDiamondView.applyGradient(colors: [.clear, .clear], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
//        roseButton.setTitle("Hoa hồng", for: .normal)
        roseButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        roseView.gradientButton2(roseView, roseButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        selectRoseView.layer.cornerRadius = 1
        selectRoseView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
    }
    func setupButton() {
        diamondButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        diamondVỉew.gradientButton2(diamondVỉew, diamondButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        selectDiamondView.layer.cornerRadius = 1
        selectDiamondView.applyGradient(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)

//        rubyButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
//        rubyView.gradientButton(rubyButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
//
//        roseButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
//        roseView.gradientButton(roseButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
    }
    func setNavigationBar() {

        self.navigationItem.setHidesBackButton(true, animated:false)

        //your custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 12.5, width: 12, height: 15))

        if let imgBackArrow = UIImage(systemName: "chevron.backward") {
            imageView.image = imgBackArrow
            //Expand_left , chevron.backward
        }
        view.addSubview(imageView)

        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        view.addGestureRecognizer(backTap)

        let leftBarButtonItem = UIBarButtonItem(customView: view )
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.tintColor = .black
    }
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
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
//        let collectionViewWidth = collectionView.bounds.width
//        return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/3)
        return CGSize(width: 109.0, height: 67.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    //    //  set padding cho 4 cạnh colectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 23, bottom: 20, right: 23)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectIndexPath != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! buyDiamondCollectionViewCell

            let gradientBorder = UICollectionViewCell.gradientImage(bounds: cell.bounds, colors: [UIColor(named: "ColorBorCell1")!, UIColor(named: "ColorBorCell2")!, UIColor(named: "ColorBorCell3")!])
            let gradientColor = UIColor(patternImage: gradientBorder)
            cell.customView.backgroundColor =  UIColor(named: "SelectedCell")
            cell.layer.borderColor = gradientColor.cgColor
            cell.layer.borderWidth = 1.5
//            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 8
            
            let cells = collectionView.cellForItem(at: self.selectIndexPath) as? buyDiamondCollectionViewCell
            cells?.customView.backgroundColor = UIColor(named: "CellDefault")
//            cells?.layer.masksToBounds = true
            cells?.layer.borderColor = UIColor.systemBackground.cgColor
            cells?.layer.borderWidth = 0
//            cells?.layer.masksToBounds = true
//            cells?.layer.cornerRadius = 8
            self.selectIndexPath = indexPath
        }
            
    }
    
}
extension UICollectionViewCell{
    static func gradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map(\.cgColor)

        // This makes it left to right, default is top to bottom
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        let renderer = UIGraphicsImageRenderer(bounds: bounds)

        return renderer.image { ctx in
            gradientLayer.render(in: ctx.cgContext)
        }
    }
}
