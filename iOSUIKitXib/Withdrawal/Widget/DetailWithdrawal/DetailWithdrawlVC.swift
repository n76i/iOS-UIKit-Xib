//
//  DetailWithdrawlVC.swift
//  iOSUIKitXib
//
//  Created by HungND on 13/01/2023.
//

import UIKit

class DetailWithdrawlVC: UIViewController {
    @IBOutlet weak var toolbarView: ToolbarView!
    
    @IBOutlet weak var detailTableView: UITableView!
    var id: Int?
    
    var dataDetail: DetailWithDrawl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for e in detailWithdrawCellData {
            if(e.id == (id ?? 0)) {
                dataDetail = e
            }
        }
        
        // Do any additional setup after loading the view.
        
        toolbarView.delegate = self
        
        detailTableView.register(UINib(nibName: "DetailWithdrawlCell", bundle: nil), forCellReuseIdentifier: "DetailWithdrawlCell")
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
        setupView()
    }
    
    func setupView() {
        setBackgroundImage()
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.backgroundColor = .clear
        toolbarView.setTitle(title: "Chi tiết rút tiền")
    }
    
    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "gradient_bgr_image")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }

}

extension DetailWithdrawlVC: ButtonTapDelegate {
    func ontapReward(item: RewardModelView) {
    }
    
    func ontapButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailWithdrawlVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataDetail?.data[section].count ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "DetailWithdrawlCell", for: indexPath) as! DetailWithdrawlCell
        
        cell.setupData(data: (dataDetail?.data[indexPath.section][indexPath.row])!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.red
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataDetail?.data.count ?? 0
    }
}
