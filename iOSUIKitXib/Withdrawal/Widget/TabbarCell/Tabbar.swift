//
//  Tabbar.swift
//  iOSUIKitXib
//
//  Created by HungND on 17/01/2023.
//

import Foundation

class Tabbar {
    let state: WithdrawlSate
    var isSelect: Bool
        
    init(state: WithdrawlSate, isSelect: Bool) {
        self.state = state
        self.isSelect = isSelect
    }
}

let dataTabbar: [Tabbar] = [
    Tabbar(state: .All, isSelect: true),
    Tabbar(state: .Success, isSelect: false),
    Tabbar(state: .Awaiting, isSelect: false),
    Tabbar(state: .Failed, isSelect: false),
]
