//
//  SecondViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 05/01/2023.
//

import UIKit

@available(iOS 13.0, *)
class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
//            if item.hasPrefix("An") {
//                // this is a picture to load!
//                print("\(item)")
//            }
            print("\(item)")
        }
        title = "Second"
        let goVC = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftAction))
        let dismissButtonItem = UIBarButtonItem(title: "Dissmis", style: .done, target: self, action: #selector(onDissmisVC))
        navigationItem.rightBarButtonItems = [goVC, dismissButtonItem]
      
//        let button = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width - (7 * 30)) / 2, y: UIScreen.main.bounds.height * 0.90, width: 200, height: 50))
//
//        button.setTitle("GoBack", for: .normal)
//        button.backgroundColor = .gray
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderColor = CGColor(red: 1, green: 0.2, blue: 0.1, alpha: 1)
//        button.layer.cornerRadius = 15
//        button.layer.borderWidth = 2
//
//        button.addTarget(self, action: #selector(goToFirst), for: .touchUpInside)
//        view.addSubview(button)
       
    }
    @objc func leftAction() {
        let vc = StackViewViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        let scrollView = UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: view.frame.size.height - 20))
//        scrollView.backgroundColor = .green
//        view.addSubview(scrollView)
//
//        let topButton = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
//        topButton.backgroundColor = .blue
//        scrollView.addSubview(topButton)
//        let bottomButton = UIButton(frame: CGRect(x: 20, y: 2000, width: 100, height: 100))
//        bottomButton.backgroundColor = .blue
//        scrollView.addSubview(bottomButton)
//
//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2200)
//    }
    @objc func onDissmisVC() {
          navigationController?.popViewController(animated: true)
    }


    
}
