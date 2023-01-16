//
//  ButtonTapDelegate.swift
//  iOSUIKitXib
//
//  Created by HungND on 06/01/2023.
//

import Foundation

protocol ButtonTapDelegate: AnyObject {
    func ontapReward(item: RewardModelView)
    func ontapButton()
}
