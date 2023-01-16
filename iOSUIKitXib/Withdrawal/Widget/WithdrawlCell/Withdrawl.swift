//
//  Withdrawl.swift
//  iOSUIKitXib
//
//  Created by HungND on 12/01/2023.
//

import Foundation

enum WithdrawlSate: String {
    case Success = "Thành công"
    case Awaiting = "Chờ x.lý"
    case Failed = "Thất bại"
}

extension WithdrawlSate {
    func filterList(datas: [[Withdrawl]]) -> [[Withdrawl]] {
        switch self {
        case .Success:
            return datas.filter({(e) in e[0].state == .Success})
        case .Awaiting:
            return datas.filter({(e) in e[0].state == .Awaiting})
        case .Failed:
            return datas.filter({(e) in e[0].state == .Failed})
        }
    }
}

struct Withdrawl {
    var id: Int
    var dateTime: String
    var state: WithdrawlSate
    var rubyNumber: Int
    var acountNumber: String
    var transactionNumber: String
}

let dataWthdrawlVC: [[Withdrawl]] = [
    [Withdrawl(id: 1, dateTime: "2022/10/24 11:00", state: .Success, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 2, dateTime: "2022/10/24 11:00", state: .Success, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 3, dateTime: "2022/10/24 11:00", state: .Failed, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 4, dateTime: "2022/10/24 11:00", state: .Awaiting, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 5, dateTime: "2022/10/24 11:00", state: .Awaiting, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 6, dateTime: "2022/10/24 11:00", state: .Failed, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 7, dateTime: "2022/10/24 11:00", state: .Success, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 8, dateTime: "2022/10/24 11:00", state: .Failed, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 9, dateTime: "2022/10/24 11:00", state: .Success, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 10, dateTime: "2022/10/24 11:00", state: .Awaiting, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
    [Withdrawl(id: 11, dateTime: "2022/10/24 11:00", state: .Success, rubyNumber: 260000, acountNumber: "01230123129120", transactionNumber: "93423931")],
]
