//
//  WithdrawlVCViewController.swift
//  iOSUIKitXib
//
//  Created by HungND on 10/01/2023.
//

import UIKit

class WithdrawlVC: UIViewController {
    var data: [[Withdrawl]] = []
    
    @IBOutlet weak var withdrawlTableView: UITableView!
    @IBOutlet private weak var labelTab1: UILabel!
    @IBOutlet weak var tab1: UIView!
    @IBOutlet private weak var lineBottomTab1: LineView!
    
    @IBOutlet weak var tab2: UIView!
    @IBOutlet private weak var labelTab2: UILabel!
    @IBOutlet private weak var lineBottomTab2: LineView!
    
    @IBOutlet weak var tab3: UIView!
    @IBOutlet private weak var labelTab3: UILabel!
    @IBOutlet private weak var lineBottomTab3: LineView!
    
    @IBOutlet weak var tab4: UIView!
    @IBOutlet private weak var lineBottomTab4: LineView!
    @IBOutlet private weak var labelTab4: UILabel!
    
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
    }
    
    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "gradient_bgr_image")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    
    func setupView() {
        data.append(contentsOf: dataWthdrawlVC)
        //setup defaul tab1
        labelTab1.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
        labelTab1.font = UIFont.sarabunFont(type: .SarabunRegular, size: 14)
        
        labelTab2.textColor = UIColor(named: "555050")
        lineBottomTab2.isHidden = true
        labelTab3.textColor = UIColor(named: "555050")
        lineBottomTab3.isHidden = true
        labelTab4.textColor = UIColor(named: "555050")
        lineBottomTab4.isHidden = true
        
        //set action tab
        tab1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tab1Action(_:))))
        tab2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tab2Action(_:))))
        tab3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tab3Action(_:))))
        tab4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tab4Action(_:))))
    }
    
    @objc func tab1Action(_ sender: Any) {
        data.removeAll()
        data.append(contentsOf: dataWthdrawlVC)
        labelTab1.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
        lineBottomTab1.isHidden = false
        labelTab2.textColor = UIColor(named: "555050")
        lineBottomTab2.isHidden = true
        labelTab3.textColor = UIColor(named: "555050")
        lineBottomTab3.isHidden = true
        labelTab4.textColor = UIColor(named: "555050")
        lineBottomTab4.isHidden = true
        
        withdrawlTableView.reloadData()
    }
    
    @objc func tab2Action(_ sender: Any) {
        data.removeAll()
        data.append(contentsOf: WithdrawlSate.Success.filterList(datas: dataWthdrawlVC))

        labelTab2.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
        lineBottomTab2.isHidden = false
        labelTab1.textColor = UIColor(named: "555050")
        lineBottomTab1.isHidden = true
        labelTab3.textColor = UIColor(named: "555050")
        lineBottomTab3.isHidden = true
        labelTab4.textColor = UIColor(named: "555050")
        lineBottomTab4.isHidden = true
        
        withdrawlTableView.reloadData()
    }
    
    @objc func tab3Action(_ sender: Any) {
        data.removeAll()
        data.append(contentsOf: WithdrawlSate.Awaiting.filterList(datas: dataWthdrawlVC))

        labelTab3.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
        lineBottomTab3.isHidden = false
        labelTab2.textColor = UIColor(named: "555050")
        lineBottomTab2.isHidden = true
        labelTab1.textColor = UIColor(named: "555050")
        lineBottomTab1.isHidden = true
        labelTab4.textColor = UIColor(named: "555050")
        lineBottomTab4.isHidden = true
        
        withdrawlTableView.reloadData()
    }
    
    @objc func tab4Action(_ sender: Any) {
        data.removeAll()
        data.append(contentsOf: WithdrawlSate.Failed.filterList(datas: dataWthdrawlVC))
        
        labelTab4.gradientColorText(colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])
        lineBottomTab4.isHidden = false
        labelTab2.textColor = UIColor(named: "555050")
        lineBottomTab2.isHidden = true
        labelTab3.textColor = UIColor(named: "555050")
        lineBottomTab3.isHidden = true
        labelTab1.textColor = UIColor(named: "555050")
        lineBottomTab1.isHidden = true
        
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
