//
//  ProfileViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 09/02/2023.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataManager: [[DataManager]] = [
        [DataManager(showImage: "Chat_fill", nameTitleLabel: "Tin nhắn", notifyImage: "Group 319771", nextImage: "Group 8689", isHiden: false),
        DataManager(showImage: "Nhiệm vụ", nameTitleLabel: "Nhiệm vụ", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: false),
        DataManager(showImage: "Group 31723", nameTitleLabel: "Bảng xếp hạng", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "Gamepad_light", nameTitleLabel: "Mini game", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true)],
        
        [DataManager(showImage: "Level người dùng", nameTitleLabel: "Level người dùng", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "Group 31718", nameTitleLabel: "Túi đồ", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "wallet", nameTitleLabel: "Ví tiền", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "ticket", nameTitleLabel: "VIP", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "account-location", nameTitleLabel: "Nhóm fan", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true)],
        [DataManager(showImage: "Chat_alt_3_fill", nameTitleLabel: "Ý kiến phản hồi", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "alert-box", nameTitleLabel: "Giới thiệu với chúng tôi", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true)],
        [DataManager(showImage: "Đăng xuất", nameTitleLabel: "Đăng suất", notifyImage: "Group 31977", nextImage: "Group 8689", isHiden: true)]
    ]
    
    var data = [
        ["Thích", "Chơi", "Thể", "Thao"],
        ["Văn", "Ngọc", "An", "Vĩnh", "Phúc"],
        ["Vui", "Vẻ"],
        ["Năng động"]
    ]
//    var section = [" ", " ", " ", " "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configTableView()
    }
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        
        let nib = UINib(nibName: "ListSettingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListSettingTableViewCell")
    }
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListSettingTableViewCell", for: indexPath) as! ListSettingTableViewCell
//        cell.nameTitleLabel.text = data[indexPath.section][indexPath.row]
        cell.bindData(dataManager: dataManager[indexPath.section][indexPath.row])
//        cell.nameTitleLabel.text = data[indexPath.section][indexPath.row]
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
//            let header = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 310))
            let header = HeaderView()
            return header
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
        switch section {
        case 0:
            return 310
        default:
            return 0
        }
    }
}
