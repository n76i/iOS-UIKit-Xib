//
//  TestViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 05/01/2023.
//

import UIKit

@available(iOS 13.0, *)
class TestViewController: UIViewController {
    
    let customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Van Ngoc An"
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        label.backgroundColor = .yellow
        return label
    }()
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tap", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 12
        return button
    }()
    let imageName: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pictruce")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .blue
        return image
    }()
    let textField: UITextField = {
        let textF = UITextField()
        textF.translatesAutoresizingMaskIntoConstraints = false
        textF.textAlignment = .left
        textF.backgroundColor = .white
        textF.layer.cornerRadius = 12
        textF.layer.borderWidth = 2
        return textF
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FIrst"
        setUpUI()

        let goVC = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftAction))
        navigationItem.rightBarButtonItem = goVC
       
    }
    @objc func leftAction() {
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func setUpUI() {
        view.addSubview(customView)
        customView.addSubview(labelName)
        customView.addSubview(button)
        customView.addSubview(imageName)
        customView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            customView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 30),
            customView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            customView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            
            labelName.topAnchor.constraint(equalTo: customView.topAnchor, constant: 30),
            labelName.leftAnchor.constraint(equalTo: customView.leftAnchor, constant: 30),
            labelName.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 0.1),
            labelName.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            
            
            button.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 30),
            button.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 0.3),
            button.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 0.05),
            button.centerXAnchor.constraint(equalTo: customView.centerXAnchor),

            imageName.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 100),
            imageName.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            imageName.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 2/3),
            imageName.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 0.1),

            textField.topAnchor.constraint(equalTo: imageName.bottomAnchor, constant: 50),
            textField.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 0.5),
            textField.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 0.05),
            textField.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
        ])

    }

}
