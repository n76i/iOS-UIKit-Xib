//
//  RewardType.swift
//  iOSUIKitXib
//
//  Created by HungND on 30/12/2022.
//

import Foundation

enum RewardType {
  case awaiting //đang chờ để đếm thời gian
  case just_opened //vừa mở quà xong và chưa ẩn hiển thị phần quà
  case opened   //đã mở quà và đã ẩn hiển thị quà
  case count_down //đang đếm thời gian
  case open //đã có thể mở được quà
}

class RewardModelView {
    var imageName: String
    var rewardName: String
    var numberReward: Int
    var type: RewardType
    
    init(imageName: String, rewardName: String, numberReward: Int, type: RewardType) {
        self.imageName = imageName
        self.rewardName = rewardName
        self.numberReward = numberReward
        self.type = type
    }
}

