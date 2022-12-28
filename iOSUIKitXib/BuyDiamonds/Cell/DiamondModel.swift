//
//  DiamondModel.swift
//  iOSUIKitXib
//
//  Created by HungND on 26/12/2022.
//

import Foundation

class DiamondModel {
    let diamondNumber: Int
    let money: Int
    var isSelect: Bool
    
    init(diamondNumber: Int, money: Int, isSelect: Bool) {
        self.diamondNumber = diamondNumber
        self.money = money
        self.isSelect = isSelect
    }
}
