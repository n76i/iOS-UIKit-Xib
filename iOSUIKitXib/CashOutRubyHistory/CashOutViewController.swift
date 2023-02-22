//
//  CashOutViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 21/02/2023.
//

import UIKit

class CashOutViewController: UIViewController {

    @IBOutlet weak var notifyImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imageBottom1: UIImageView!
    @IBOutlet weak var imageBottom2: UIImageView!
    @IBOutlet weak var imageBottom3: UIImageView!
    @IBOutlet weak var imageBottom4: UIImageView!
    
    @IBOutlet weak var allCashOutButton: UIButton!
    @IBOutlet weak var successButton: UIButton!
    @IBOutlet weak var pendingButton: UIButton!
    @IBOutlet weak var failButton: UIButton!
    
    private var currentIndex = 1
    
    private var arrDataAll: [DataCashOut] = [
        DataCashOut(dayCashOut: "2023/02/21", hourCashOut: "11:05", resultCashOut: "Thành công", resultTextColor: .white, resultBackgroundColor: UIColor(named: "Success")!, numberRuby: "100.000", numberAccount: "1030435029", numberTransaction: "3743289328", reasonVsImageL: "Hình ảnh:", wrongVsSwapImage: "[Hình ảnh]", imageLVsReason: "", swapVsWrong: ""),
        DataCashOut(dayCashOut: "2023/02/19", hourCashOut: "10:05", resultCashOut: "Thất bại", resultTextColor: .white, resultBackgroundColor: UIColor(named: "Fail")!, numberRuby: "123.000", numberAccount: "1030435029", numberTransaction: "3778326437", reasonVsImageL: "Lí do:", wrongVsSwapImage: "Tài khoản ngân hàng sai", imageLVsReason: "Hình ảnh:", swapVsWrong: "[Hình ảnh]"),
        DataCashOut(dayCashOut: "2022/05/21", hourCashOut: "09:05", resultCashOut: "Chờ xử lí", resultTextColor: UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 80, height: 21), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), resultBackgroundColor: UIColor(named: "Wait")!, numberRuby: "99.000", numberAccount: "1030435029", numberTransaction: "123456789", reasonVsImageL: "", wrongVsSwapImage: "", imageLVsReason: "", swapVsWrong: ""),
        DataCashOut(dayCashOut: "2022/06/25", hourCashOut: "10:07", resultCashOut: "Chờ xử lí", resultTextColor: UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 80, height: 21), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), resultBackgroundColor: UIColor(named: "Wait")!, numberRuby: "123.000", numberAccount: "1030435029", numberTransaction: "123456789", reasonVsImageL: "", wrongVsSwapImage: "", imageLVsReason: "", swapVsWrong: "")
    ]
    private var arrDataSuccess: [DataCashOut] = [
        DataCashOut(dayCashOut: "2023/02/21", hourCashOut: "11:05", resultCashOut: "Thành công", resultTextColor: .white, resultBackgroundColor: UIColor(named: "Success")!, numberRuby: "100.000", numberAccount: "1030435029", numberTransaction: "3743289328", reasonVsImageL: "Hình ảnh:", wrongVsSwapImage: "[Hình ảnh]", imageLVsReason: "", swapVsWrong: "")
    ]
    
    private var arrDataPending: [DataCashOut] = [
        DataCashOut(dayCashOut: "2022/05/21", hourCashOut: "09:05", resultCashOut: "Chờ xử lí", resultTextColor: UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 80, height: 21), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), resultBackgroundColor: UIColor(named: "Wait")!, numberRuby: "99.000", numberAccount: "1030435029", numberTransaction: "123456789", reasonVsImageL: "", wrongVsSwapImage: "", imageLVsReason: "", swapVsWrong: ""),
        DataCashOut(dayCashOut: "2022/06/25", hourCashOut: "10:07", resultCashOut: "Chờ xử lí", resultTextColor: UIColor(patternImage: UIImage.gradientButtonImage(bounds: CGRect(x: 0, y: 0, width: 80, height: 21), colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), resultBackgroundColor: UIColor(named: "Wait")!, numberRuby: "123.000", numberAccount: "1030435029", numberTransaction: "123456789", reasonVsImageL: "", wrongVsSwapImage: "", imageLVsReason: "", swapVsWrong: "")
    ]
    private var arrDataFail: [DataCashOut] = [
        DataCashOut(dayCashOut: "2023/02/19", hourCashOut: "10:05", resultCashOut: "Thất bại", resultTextColor: .white, resultBackgroundColor: UIColor(named: "Fail")!, numberRuby: "123.000", numberAccount: "1030435029", numberTransaction: "3778326437", reasonVsImageL: "Lí do:", wrongVsSwapImage: "Tài khoản ngân hàng sai", imageLVsReason: "Hình ảnh:", swapVsWrong: "[Hình ảnh]")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rút Tiền"
        let backButton = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        backButton.tintColor = .black
        
        animationLoading()
        configTableView()
        setupAll()
    }
    @IBAction func actionButton(_ sender: UIButton) {
        allCashOutButton.tag = 1
        successButton.tag = 2
        pendingButton.tag = 3
        failButton.tag = 4
        
        switch sender.tag {
        case 1:
           setupAll()
            tableView.reloadData()
        case 2:
            setupSuccess()
            tableView.reloadData()
        case 3:
            setupPending()
            tableView.reloadData()
        default:
            setupFail()
            tableView.reloadData()
        }
    }
    func setupAll() {
        currentIndex = 1
        imageBottom1.isHidden = false
        imageBottom2.isHidden = true
        imageBottom3.isHidden = true
        imageBottom4.isHidden = true
        allCashOutButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: allCashOutButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        successButton.setTitleColor(.lightGray, for: .normal)
        pendingButton.setTitleColor(.lightGray, for: .normal)
        failButton.setTitleColor(.lightGray, for: .normal)
        
    }
    func setupSuccess() {
        currentIndex = 2
        imageBottom1.isHidden = true
        imageBottom2.isHidden = false
        imageBottom3.isHidden = true
        imageBottom4.isHidden = true
        successButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: successButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        allCashOutButton.setTitleColor(.lightGray, for: .normal)
        pendingButton.setTitleColor(.lightGray, for: .normal)
        failButton.setTitleColor(.lightGray, for: .normal)
    }
    func setupPending() {
        currentIndex = 3
        imageBottom1.isHidden = true
        imageBottom2.isHidden = true
        imageBottom3.isHidden = false
        imageBottom4.isHidden = true
        pendingButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: pendingButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        successButton.setTitleColor(.lightGray, for: .normal)
        allCashOutButton.setTitleColor(.lightGray, for: .normal)
        failButton.setTitleColor(.lightGray, for: .normal)
    }
    func setupFail() {
        currentIndex = 4
        imageBottom1.isHidden = true
        imageBottom2.isHidden = true
        imageBottom3.isHidden = true
        imageBottom4.isHidden = false
        failButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: failButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        successButton.setTitleColor(.lightGray, for: .normal)
        pendingButton.setTitleColor(.lightGray, for: .normal)
        allCashOutButton.setTitleColor(.lightGray, for: .normal)
        
    }
    
    func animationLoading() {
        self.tableView.isHidden = true
        let alert = UIAlertController(title: nil, message: "Chờ load xíu đã nha....", preferredStyle: .actionSheet)
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(10, 5, 50, 50)) as UIActivityIndicatorView
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            alert.dismiss(animated: false)
            self.notifyImage.isHidden = true
            self.tableView.isHidden = false
        }
      
    }
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    
        tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryTableViewCell")
    }
}
extension CashOutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentIndex == 1 ? arrDataAll.count : currentIndex == 2 ? arrDataSuccess.count : currentIndex == 3 ? arrDataPending.count : arrDataFail.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        
        currentIndex == 1 ? cell.bindData(data: arrDataAll[indexPath.row]) : currentIndex == 2 ? cell.bindData(data: arrDataSuccess[indexPath.row]) : currentIndex == 3 ? cell.bindData(data: arrDataPending[indexPath.row]) : cell.bindData(data: arrDataFail[indexPath.row])

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 166
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = WithdrawaDetaillViewController()
        if self.currentIndex == 1 {
            vc.trainslationCode = self.arrDataAll[indexPath.row].numberTransaction
            vc.hourMinute = self.arrDataAll[indexPath.row].hourCashOut
            vc.day = self.arrDataAll[indexPath.row].dayCashOut
            vc.numberRuby = self.arrDataAll[indexPath.row].numberRuby
            vc.numberAccount = self.arrDataAll[indexPath.row].numberAccount
            vc.result = self.arrDataAll[indexPath.row].resultCashOut
            vc.resultTextColor = self.arrDataAll[indexPath.row].resultTextColor
            vc.resultBackground = self.arrDataAll[indexPath.row].resultBackgroundColor
            vc.resaon = self.arrDataAll[indexPath.row].reasonVsImageL
            vc.wrongAccount = self.arrDataAll[indexPath.row].wrongVsSwapImage
            vc.imageL = self.arrDataAll[indexPath.row].imageLVsReason
            vc.sawpImage = self.arrDataAll[indexPath.row].swapVsWrong
        } else if self.currentIndex == 2 {
            vc.trainslationCode = self.arrDataSuccess[indexPath.row].numberTransaction
            vc.hourMinute = self.arrDataSuccess[indexPath.row].hourCashOut
            vc.day = self.arrDataSuccess[indexPath.row].dayCashOut
            vc.numberRuby = self.arrDataSuccess[indexPath.row].numberRuby
            vc.numberAccount = self.arrDataSuccess[indexPath.row].numberAccount
            vc.result = self.arrDataSuccess[indexPath.row].resultCashOut
            vc.resultTextColor = self.arrDataSuccess[indexPath.row].resultTextColor
            vc.resultBackground = self.arrDataSuccess[indexPath.row].resultBackgroundColor
            vc.resaon = self.arrDataSuccess[indexPath.row].reasonVsImageL
            vc.wrongAccount = self.arrDataSuccess[indexPath.row].wrongVsSwapImage
            vc.imageL = self.arrDataSuccess[indexPath.row].imageLVsReason
            vc.sawpImage = self.arrDataSuccess[indexPath.row].swapVsWrong
        } else if self.currentIndex == 3 {
            vc.trainslationCode = self.arrDataPending[indexPath.row].numberTransaction
            vc.hourMinute = self.arrDataPending[indexPath.row].hourCashOut
            vc.day = self.arrDataPending[indexPath.row].dayCashOut
            vc.numberRuby = self.arrDataPending[indexPath.row].numberRuby
            vc.numberAccount = self.arrDataPending[indexPath.row].numberAccount
            vc.result = self.arrDataPending[indexPath.row].resultCashOut
            vc.resultTextColor = self.arrDataPending[indexPath.row].resultTextColor
            vc.resultBackground = self.arrDataPending[indexPath.row].resultBackgroundColor
            vc.resaon = self.arrDataPending[indexPath.row].reasonVsImageL
            vc.wrongAccount = self.arrDataPending[indexPath.row].wrongVsSwapImage
            vc.imageL = self.arrDataPending[indexPath.row].imageLVsReason
            vc.sawpImage = self.arrDataPending[indexPath.row].swapVsWrong
        } else {
            vc.trainslationCode = self.arrDataFail[indexPath.row].numberTransaction
            vc.hourMinute = self.arrDataFail[indexPath.row].hourCashOut
            vc.day = self.arrDataFail[indexPath.row].dayCashOut
            vc.numberRuby = self.arrDataFail[indexPath.row].numberRuby
            vc.numberAccount = self.arrDataFail[indexPath.row].numberAccount
            vc.result = self.arrDataFail[indexPath.row].resultCashOut
            vc.resultTextColor = self.arrDataFail[indexPath.row].resultTextColor
            vc.resultBackground = self.arrDataFail[indexPath.row].resultBackgroundColor
            vc.resaon = self.arrDataFail[indexPath.row].reasonVsImageL
            vc.wrongAccount = self.arrDataFail[indexPath.row].wrongVsSwapImage
            vc.imageL = self.arrDataFail[indexPath.row].imageLVsReason
            vc.sawpImage = self.arrDataFail[indexPath.row].swapVsWrong
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

