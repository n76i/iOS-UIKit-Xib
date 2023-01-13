//
//  PresentViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 06/01/2023.
//

import UIKit

class PresentViewController: UIViewController {
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        return button
    }()
    
    let customView: UIView = {
        let view = UIView()
        // để có thể constraint đc thì phải có thằng translatesAutoresizingMaskIntoConstraints
        view.translatesAutoresizingMaskIntoConstraints = false // nếu bằng true thì sử dụng frame
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // Cái maskedCorners này là đánh dấu điểm cần bo tròn
        view.backgroundColor = .yellow
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .red
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        constraintLayout()
        clearButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2, delay: 0.2) {
            self.view.backgroundColor = .white.withAlphaComponent(0.2)
        }
    }
    @objc func dismissVC() {
        view.backgroundColor = .white
        dismiss(animated: true)
    }
    func constraintLayout() {
        view.addSubview(clearButton)
        view.addSubview(customView)
        customView.addSubview(stackView)
       
        NSLayoutConstraint.activate([
            clearButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            clearButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            clearButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            clearButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),

            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            customView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            customView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            customView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2/3),

            stackView.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: customView.widthAnchor, multiplier: 0.8),
            stackView.heightAnchor.constraint(equalTo: customView.heightAnchor, multiplier: 0.5),

        ])
        for i in 0...3 {
            let button = UIButton()
            if i == 0 {
                button.setTitle("nút bấm 1", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .gray
            } else if i == 1 {
                button.setTitle("nút bấm 2", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .blue
            } else if i == 2 {
                button.setTitle("nút bấm 3", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .green
            } else {
                button.setTitle("nút bấm 4", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .red
            }
            button.tag = i // ta biết rằng mỗi cái button,label,textField đều có một cái tag riêng
            button.addTarget(self, action: #selector(actionSelectButton(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(button)
        }
    }
    @objc func actionSelectButton(_ sender: UIButton) {
//        print("selectted \(sender.titleLabel?.text ?? "")")
        switch sender.tag {
        case 0:
            print("cái button đầu tiên")
        case 1:
            print("cái button thứ 2")
        case 2:
            print("cái button thứ 3 ")
        default:
            print("cái button cuối cùng")
        }
    }
}
