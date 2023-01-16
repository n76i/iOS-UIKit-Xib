//
//  WalletDiamondViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 13/01/2023.
//

import UIKit

@available(iOS 13.0, *)
class WalletDiamondViewController: UIViewController {
    
    @IBOutlet weak var containtViewButton: UIView!
    
    @IBOutlet weak var diamondButton: UIButton!
    @IBOutlet weak var viewDiamondButton: UIView!
    
    @IBOutlet weak var rubyButton: UIButton!
    @IBOutlet weak var viewRubyButton: UIView!
    
    @IBOutlet weak var roseButton: UIButton!
    @IBOutlet weak var viewRoseButton: UIView!
    
    @IBOutlet weak var strokeView1: UIView!
    @IBOutlet weak var strokeView2: UIView!
    @IBOutlet weak var selecView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "18 Live +"
//        view.applyGradient(colors: [UIColor(named: "Color1")!, UIColor(named: "Color2")!], startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 3.0), shape: CAShapeLayer(), corner: 3)
//        setNavigationBar()
//        setupView()
//
//        strokeView1.layer.cornerRadius = 5
//        strokeView1.layer.borderColor = UIColor(red: 0.871, green: 0.845, blue: 0.845, alpha: 1).cgColor
//        strokeView2.layer.cornerRadius = 5
//        strokeView2.layer.borderColor = UIColor(red: 0.871, green: 0.845, blue: 0.845, alpha: 1).cgColor
//
//        diamondButton.titleLabel?.font =  UIFont(name: "Sarabun-SemiBold", size: 14)
//        viewDiamondButton.gradientButton(diamondButton, startColor: UIColor(named: "8F4AFF")!, endColor: UIColor(named: "FF5B37")!)
    
    }

    func setupView() {
        selecView.layer.cornerRadius = 1
        
        selecView.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.5), endPoint: CGPoint(x: 1.0, y: 0.5), shape: CAShapeLayer(), corner: 3)
   
    }

    func setNavigationBar() {

        self.navigationItem.setHidesBackButton(true, animated:false)

        //your custom view for back image with custom size
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: view.bounds.width, y: view.bounds.width, width: 20, height: 20))

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
