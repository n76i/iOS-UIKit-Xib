//
//  VideoPlaybackViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import UIKit

class VideoPlaybackViewController: UIViewController {
    
    @IBOutlet weak var recordVideoButton: UIButton!
    @IBOutlet weak var postedVideoButton: UIButton!
    @IBOutlet weak var bottomImage1: UIImageView!
    @IBOutlet weak var bottomImage2: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var currentIndex = 0
    var dataRecord: [DataVideo] = [
        DataVideo(nameImage: "Group 31952", titleString: "An nè"),
        DataVideo(nameImage: "Group 31952", titleString: "I do"),
        DataVideo(nameImage: "Group 31952", titleString: "Why not me ?")
    ]
    
    var dataPosted = [
        DataVideo(nameImage: "Group 31952", titleString: "Phía sau một cô gái"),
        DataVideo(nameImage: "Group 31952", titleString: "My heart will go on"),
        DataVideo(nameImage: "Group 31952", titleString: "Why not me ?"),
        DataVideo(nameImage: "Group 31952", titleString: "lalalalalalaalallalalalalalalalalalalalalalalalalalalalalalalalalalalalalalalallalalalalalalalaalaalallalalalalalalalallllllllllllllllllllllllllaaaaaaaaaaaaaaaaaaaaaallllllllllllllllllllllllllllllllaaaaaaaaaaaaaaaa")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Video phát lại"
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        backButton.tintColor = .black
        
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorColor = .red
        // Chỉnh dường line trong các cell
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 100)
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "ListVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "ListVideoTableViewCell")
        tableView.register(UINib(nibName: "ListPostedVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "ListPostedVideoTableViewCell")
        bottomImage2.isHidden = true
        bottomImage1.isHidden = false
        recordVideoButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 100, height: 23), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        
    }
    
    @IBAction func actionBtnLefr(_ sender: Any) {
        currentIndex = 0
        bottomImage1.isHidden = false
        bottomImage2.isHidden = true
        recordVideoButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 100, height: 23), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        postedVideoButton.setTitleColor( .lightGray, for: .normal)
        tableView.reloadData()
    }
    
    @IBAction func actionBTNRight(_ sender: Any) {
        currentIndex = 1
        bottomImage2.isHidden = false
        bottomImage1.isHidden = true
        postedVideoButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 105, height: 23), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        recordVideoButton.setTitleColor( .lightGray, for: .normal)
        tableView.reloadData()
    }
}
extension VideoPlaybackViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentIndex == 0 {
            return dataRecord.count
        }
        return dataPosted.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if currentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListVideoTableViewCell", for: indexPath) as! ListVideoTableViewCell
            cell.bindData(data: dataRecord[indexPath.row])
            cell.callBack = {
                switch $0 {
                case .delete:
                    self.removeItem(index: indexPath.row) {
                        tableView.deleteRows(at: [indexPath], with: .fade)
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.3)) {
                            self.tableView.reloadData()
                        }
                    }
                    break
                case .edit:
                    break
                }
            }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPostedVideoTableViewCell", for: indexPath) as! ListPostedVideoTableViewCell
        cell.bindData(data: dataPosted[indexPath.row])
        cell.callBack = { // [weak Self] type
            switch $0 {
            case .edit:
                let vc = EditVideoViewController()
                vc.delegate = self
                vc.index = indexPath.row
                vc.content = self.dataPosted[indexPath.row].titleString
                self.navigationController?.pushViewController(vc, animated: true)
            case .delete:
                self.removeItem2(index: indexPath.row) {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(0.3)) {
                        self.tableView.reloadData()
                    }
                }
                break
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    func removeItem(index: Int,completion: (() -> Void)) {
        self.dataRecord.remove(at: index)
        completion()
    }
    func removeItem2(index: Int, completion: (() -> Void)) {
        self.dataPosted.remove(at: index)
        completion()
    }
}
extension VideoPlaybackViewController: PassDataDelegate {
    
    func passData(image: String, title: String, index: Int) {
        dataPosted[index] = DataVideo(nameImage: image, titleString: title)
        tableView.reloadData()
    }
}
