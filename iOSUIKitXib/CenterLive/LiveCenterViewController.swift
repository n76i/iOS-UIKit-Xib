//
//  LiveCenterViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import UIKit

class LiveCenterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [DataManager] = [
        DataManager(showImage: "ImageStatistical", nameTitleLabel: "Thống kê livestreams", notifyImage: "", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "hide_eye_fill", nameTitleLabel: "Danh sách chặn", notifyImage: "", nextImage: "Group 8689", isHiden: true),
        DataManager(showImage: "Video_fill", nameTitleLabel: "Video phát lại", notifyImage: "", nextImage: "Group 8689", isHiden: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Trung tâm phát trực tiếp"
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        backButton.tintColor = .black
        
        configTableView()

    }
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        
        tableView.register(UINib(nibName: "OptionTableViewCell", bundle: nil), forCellReuseIdentifier: "OptionTableViewCell")
    }

}
extension LiveCenterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as! OptionTableViewCell
        cell.bindData(data: data[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderViewLive()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Vị trí \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2 {
            let vc = VideoPlaybackViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
