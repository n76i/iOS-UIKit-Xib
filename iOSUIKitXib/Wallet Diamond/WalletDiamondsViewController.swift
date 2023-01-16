//
//  WalletDiamondsViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 16/01/2023.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "18 Live +"
        setNavigationBar()
        setupButton()
        setupView()

        strokeView1.layer.cornerRadius = 5
        strokeView1.layer.borderColor = UIColor(red: 0.871, green: 0.845, blue: 0.845, alpha: 1).cgColor
        strokeView2.layer.cornerRadius = 5
        strokeView2.layer.borderColor = UIColor(red: 0.871, green: 0.845, blue: 0.845, alpha: 1).cgColor
        configCollectionView()
    }
    func configCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "buyDiamondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "buyDiamondCollectionViewCell")
    }

    func setupView() {
        selectDiamondView.layer.cornerRadius = 1
        selectDiamondView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        selectRubyView.layer.cornerRadius = 1
        selectRubyView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
        
        selectRoseView.layer.cornerRadius = 1
        selectRoseView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
   
    }
    func setupButton() {
        diamondButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        diamondVỉew.gradientButton(diamondButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        
        rubyButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        rubyView.gradientButton(rubyButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
        
        roseButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
        roseView.gradientButton(roseButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
    }
    func setNavigationBar() {

        self.navigationItem.setHidesBackButton(true, animated:false)

        //your custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 10, width: 20, height: 20))

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
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buyDiamondCollectionViewCell", for: indexPath) as! buyDiamondCollectionViewCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let collectionViewWidth = collectionView.bounds.width
//        return CGSize(width: collectionViewWidth/3, height: collectionViewWidth/3)
        return CGSize(width: 109.0, height: 67.0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
