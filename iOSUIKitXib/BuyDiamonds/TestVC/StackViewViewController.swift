//
//  StackViewViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 05/01/2023.
//

import UIKit

@available(iOS 13.0, *)
class StackViewViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.frame = CGRect(x: UIScreen.main.bounds.height / 2, y: UIScreen.main.bounds.height / 2, width: 200, height: 50)
        button.layer.cornerRadius = 15
        button.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 5
        button.backgroundColor = .green
        button.setTitle("Go present", for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        return button
    }()
    let button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 5
        button.backgroundColor = .green
        button.setTitle("Go present", for: .normal)
        button.setTitleColor(.darkText, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "StackView"
        view.addSubview(button)
        view.addSubview(button2)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/9),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            button2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            button2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            button2.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        button.addTarget(self, action: #selector(goStack), for: .touchUpInside)
        
        button2.addTarget(self, action: #selector(bottomSheet), for: .touchUpInside)
        
    }
    @objc func goStack() {
        let vc = PresentViewController()
        vc.modalPresentationStyle = .overFullScreen // dùng overFullScreen
        present(vc, animated: true)
    }
    
    @available(iOS 13.0, *)
    @objc func bottomSheet() {
        if #available(iOS 15.0, *) {
            if let sheet = ViewController().sheetPresentationController {
                sheet.detents = [.medium()]
                sheet.prefersGrabberVisible = true
            }
        } else {
            // Fallback on earlier versions
        }
        self.present(ViewController(), animated: true, completion: nil)
    }
    
}
