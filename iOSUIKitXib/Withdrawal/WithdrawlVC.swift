//
//  WithdrawlVCViewController.swift
//  iOSUIKitXib
//
//  Created by HungND on 10/01/2023.
//

import UIKit

class WithdrawlVC: UIViewController {
    var data: [[Withdrawl]] = []
    
    @IBOutlet weak var empty_img: UIImageView!
    @IBOutlet weak var withdrawlTableView: UITableView!
    
    @IBOutlet weak var tabbar: UICollectionView!
    
    
    //    let gradient
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hide toolbar
        self.navigationController?.isNavigationBarHidden = true
        
        //set background screen
        setBackgroundImage()
        //setup view
        setupView()
        
        withdrawlTableView.delegate = self
        withdrawlTableView.dataSource = self
        withdrawlTableView.register(UINib(nibName: "WithdrawlCell", bundle: nil), forCellReuseIdentifier: "WithdrawlCell")
        withdrawlTableView.separatorStyle = .none
        
        tabbar.delegate = self
        tabbar.dataSource = self
        tabbar.register(UINib(nibName: "TabbarCell", bundle: nil), forCellWithReuseIdentifier: "TabbarCell")
    }
    
    func showContentView() {
        if(data.isEmpty) {
            empty_img.isHidden = false
            withdrawlTableView.isHidden = true
        } else {
            empty_img.isHidden = true
            withdrawlTableView.isHidden = false
        }
    }
    
    func setBackgroundImage() {
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "gradient_bgr_image")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    func setupView() {
        data.append(contentsOf: dataWthdrawlVC)
        showContentView()
    }
    
    func filterData(state: WithdrawlSate) {
        data.removeAll()
        data.append(contentsOf: state.filterList(datas: dataWthdrawlVC))
        withdrawlTableView.reloadData()
    }
}

extension WithdrawlVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = withdrawlTableView.dequeueReusableCell(withIdentifier: "WithdrawlCell", for: indexPath) as! WithdrawlCell
        
        cell.setupData(data: data[indexPath.section][indexPath.row])
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: DetailWithdrawlVC = DetailWithdrawlVC()
        vc.id = data[indexPath.section][indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension WithdrawlVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataTabbar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabbar.dequeueReusableCell(withReuseIdentifier: "TabbarCell", for: indexPath) as! TabbarCell
        
        if(dataTabbar[indexPath.row] === dataTabbar.first) {
            cell.setUpData(data: dataTabbar[indexPath.row], isShowLeadingLine: false)
        } else {
            cell.setUpData(data: dataTabbar[indexPath.row], isShowLeadingLine: true)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = tabbar.bounds.size.width / 4.0
        
        return CGSize(width: width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for tab in dataTabbar {
            if(tab === dataTabbar[indexPath.row]) {
                tab.isSelect = true
            } else {
                tab.isSelect = false
            }
        }
        
        tabbar.reloadData()
        filterData(state: dataTabbar[indexPath.row].state)
    }
}


