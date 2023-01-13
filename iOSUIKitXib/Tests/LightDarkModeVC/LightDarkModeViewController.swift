//
//  LightDarkModeViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 11/01/2023.
//

import UIKit

@available(iOS 13.0, *)
class LightDarkModeViewController: UIViewController {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var comBtn: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var shareBtn: UIButton!
    
    let darkModeLabel = UILabel()
    let darkModeSwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "HELLO"

//        likeButton.setImage(, for: .normal)
//        likeButton.setImage(UIImage(systemName: "highlighter"), for: .normal)
//        likeButton.setImage(UIImage(systemName: "scribble"), for: .normal)
        
        likeButton.tintColor = .green
        
        likeButton.setTitle("LI", for: .normal)
        
        likeButton.setTitleColor(.red, for: .normal)
        
//        setUpDarkMOdeLabel()
//        setupDarkModeSwitch()
       
    }
    func setUpDarkMOdeLabel() {
        view.addSubview(darkModeLabel)
        
        darkModeLabel.translatesAutoresizingMaskIntoConstraints = false
        darkModeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        darkModeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        darkModeLabel.text = "Dark Mode"
        darkModeLabel.textColor = .black
        
        
    }
    func setupDarkModeSwitch() {
        view.addSubview(darkModeSwitch)
        darkModeSwitch.translatesAutoresizingMaskIntoConstraints = false
        darkModeSwitch.topAnchor.constraint(equalTo: darkModeLabel.bottomAnchor, constant: 30).isActive = true
        darkModeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        darkModeSwitch.addTarget(self, action: #selector(darkModeAction), for: .touchUpInside)
    }
    @objc func darkModeAction(_ sender: UISwitch) {
        
        let currentTheme = sender.isOn ? Theme.dark : Theme.light
        view.backgroundColor = currentTheme.backgroundColor
        darkModeLabel.textColor = currentTheme.textColor
        
        navigationController?.navigationBar.barTintColor = currentTheme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: currentTheme.textColor]
        tabBarController?.tabBar.barTintColor = currentTheme.backgroundColor
//        if sender.isOn {
//            view.backgroundColor = .black
//            darkModeLabel.textColor = .white
//
//            navigationController?.navigationBar.barTintColor = .black
//            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            tabBarController?.tabBar.barTintColor = .black
//        } else {
//            view.backgroundColor = .white
//            darkModeLabel.textColor = .white
//
//            navigationController?.navigationBar.barTintColor = .white
//            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//            tabBarController?.tabBar.barTintColor = .white
//        }
    }
}
struct Theme {
    let textColor: UIColor
    let backgroundColor: UIColor
    
    static let light = Theme(textColor: .black, backgroundColor: .white)
    static let dark = Theme(textColor: .white, backgroundColor: .black)
    
}


//@available(iOS 13.0, *)
//class LightDarkModeViewController: UIViewController {
//
//    private let myView: UIView = {
//        let view = UIView(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
//        view.backgroundColor = .tertiarySystemBackground // secondarySystemBackground
//        return view
//    }()
//    private let myLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .label
//        label.text = "Hello world"
//        label.textAlignment = .center
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        myLabel.frame = myView.bounds
//        myView.addSubview(myLabel)
//        view.addSubview(myView)
//        view.backgroundColor = .systemBlue // systemBackground
//
//        switch traitCollection.userInterfaceStyle {
//        case .dark:
//            print("Do somthing Dark")
//            break
//        case .light:
//            print("Do somtihng Light")
//            break
//
//        default:
//            print("Do somtihng")
//        }
//    }
//}
