//
//  ChartsViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 20/02/2023.
//

import UIKit

class ChartsViewController: UIViewController {

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var dedicationButton: UIButton!
    @IBOutlet weak var liveButton: UIButton!
    @IBOutlet weak var rankingDayButton: UIButton!
    @IBOutlet weak var rankingWeekButton: UIButton!
    @IBOutlet weak var rankingMonthButton: UIButton!
    @IBOutlet weak var upRankingButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrData: [DataRanking] = [
    DataRanking(topRankingImage: "Group 31394", topRankingLabel: "1", numberHeart: "19,6k", ishiddenRanking: true),
    DataRanking(topRankingImage: "Group 31393", topRankingLabel: "2", numberHeart: "15k", ishiddenRanking: true),
    DataRanking(topRankingImage: "Group 31392", topRankingLabel: "3", numberHeart: "9,9k", ishiddenRanking: true),
    DataRanking(topRankingImage: "Group 31320", topRankingLabel: "4", numberHeart: "7,6k", ishiddenRanking: false),
    DataRanking(topRankingImage: "Group 31320", topRankingLabel: "5", numberHeart: "7,5k", ishiddenRanking: false),
    DataRanking(topRankingImage: "Group 31320", topRankingLabel: "6", numberHeart: "5,9k", ishiddenRanking: false),
    DataRanking(topRankingImage: "Group 31320", topRankingLabel: "7", numberHeart: "5,2k", ishiddenRanking: false),
    DataRanking(topRankingImage: "Group 31320", topRankingLabel: "8", numberHeart: "159", ishiddenRanking: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containView.layer.cornerRadius = 20
        
        dedicationButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: dedicationButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        setupLive()
        liveButton.layer.cornerRadius = 12
        rankingDayButton.layer.cornerRadius = 12
        rankingWeekButton.layer.cornerRadius = 12
        rankingMonthButton.layer.cornerRadius = 12
        
        upRankingButton.layer.cornerRadius = 8
        upRankingButton.clipsToBounds = true
        upRankingButton.layer.borderWidth = 1
        upRankingButton.layer.borderColor = UIColor.lightGray.cgColor
        configTableView()
    }
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: "TopDedicationTableViewCell", bundle: nil), forCellReuseIdentifier: "TopDedicationTableViewCell")
    }

    @IBAction func actionButton(_ sender: UIButton) {
        liveButton.tag = 0
        rankingDayButton.tag = 1
        rankingWeekButton.tag = 2
        rankingMonthButton.tag = 3
        switch sender.tag {
        case 0:
            setupLive()
        case 1:
            setupRankingDay()
        case 2:
            setupRankingWeek()
        default:
            setupRankingMonth()
        }
    }
    
    @IBAction func actionShowSheet(_ sender: Any) {
        
    }
    
    
    func setupLive() {
        liveButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: liveButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        liveButton.backgroundColor = UIColor(named: "ColorPink")
        rankingDayButton.setTitleColor(.lightGray, for: .normal)
        rankingDayButton.backgroundColor = UIColor(named: "ColorLightPink")
        rankingWeekButton.setTitleColor(.lightGray, for: .normal)
        rankingWeekButton.backgroundColor = UIColor(named: "ColorLightPink")
        rankingMonthButton.setTitleColor(.lightGray, for: .normal)
        rankingMonthButton.backgroundColor = UIColor(named: "ColorLightPink")
    }
    func setupRankingDay() {
        rankingDayButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: rankingDayButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        rankingDayButton.backgroundColor = UIColor(named: "ColorPink")
        rankingWeekButton.setTitleColor(.lightGray, for: .normal)
        rankingWeekButton.backgroundColor = UIColor(named: "ColorLightPink")
        rankingMonthButton.setTitleColor(.lightGray, for: .normal)
        rankingMonthButton.backgroundColor = UIColor(named: "ColorLightPink")
        liveButton.setTitleColor(.lightGray, for: .normal)
        liveButton.backgroundColor = UIColor(named: "ColorLightPink")
    }
    func setupRankingWeek() {
        rankingWeekButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: rankingWeekButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        rankingWeekButton.backgroundColor = UIColor(named: "ColorPink")
        rankingMonthButton.setTitleColor(.lightGray, for: .normal)
        rankingMonthButton.backgroundColor = UIColor(named: "ColorLightPink")
        liveButton.setTitleColor(.lightGray, for: .normal)
        liveButton.backgroundColor = UIColor(named: "ColorLightPink")
        rankingDayButton.setTitleColor(.lightGray, for: .normal)
        rankingDayButton.backgroundColor = UIColor(named: "ColorLightPink")
    }
    func setupRankingMonth() {
        rankingMonthButton.setTitleColor(UIColor(patternImage: UIImage.gradientButtonImage(bounds: rankingMonthButton.bounds, colors: [UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!])), for: .normal)
        rankingMonthButton.backgroundColor = UIColor(named: "ColorPink")
        liveButton.setTitleColor(.lightGray, for: .normal)
        liveButton.backgroundColor = UIColor(named: "ColorLightPink")
        rankingDayButton.setTitleColor(.lightGray, for: .normal)
        rankingDayButton.backgroundColor = UIColor(named: "ColorLightPink")
        rankingWeekButton.setTitleColor(.lightGray, for: .normal)
        rankingWeekButton.backgroundColor = UIColor(named: "ColorLightPink")
    }
}
extension ChartsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopDedicationTableViewCell", for: indexPath) as! TopDedicationTableViewCell
        cell.bindData(data: arrData[indexPath.row])
        print(indexPath.row)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(named: "ColorLightPink")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
}
