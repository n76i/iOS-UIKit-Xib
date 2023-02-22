//
//  Modelll.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 21/02/2023.
//

import Foundation
import UIKit

enum StateCashOut {
    case success
    case fail
    case pending
    case none
//    var title: String {
////        switch self {
////        case .success:
////            return "Thanh cong"
////        case .fail:
////            return "That bai"
////        case .pending:
////            return "Cho xu li"
////        if self == .success {
////            return "Thanh cong"
////        } else if self == .fail {
////            return "sdasdas"
////        } else {
////            return "pending"
////        }
//        if self == .success {
//            return "Thanh cong"
//        }
//        if self == .pending {
//            return "Cho xu li"
//        }
//
//        return "that bai"
//    }
    var descripsion: String {
//
//        return self == .success ? "thanh cong" : "That bai"
        return self == .success ? "Thanh Cong" : (self == .fail ? "That bai" : (self == .pending ? "Cho xu li" : "None"))
    }
//    var color: UIColor {
//        switch self {
//        case .success:
//
//            return .green
//        case .fail:
//            return .red
//        case .pending:
//            return .yellow
//        }
//    }
    
}

struct DataCashOut {
    let dayCashOut: String
    let hourCashOut: String
    let resultCashOut: String
    let resultTextColor: UIColor
    let resultBackgroundColor: UIColor
    let numberRuby: String
    let numberAccount: String
    let numberTransaction: String
//    var stateCashOut: StateCashOut
    let reasonVsImageL: String
    let wrongVsSwapImage: String
    let imageLVsReason: String
    let swapVsWrong: String
}
