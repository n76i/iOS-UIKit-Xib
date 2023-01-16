import Foundation

struct DetailWithDrawl {
    let id: Int
    let data: [[DetailWithdrawlCellModel]]
}

struct DetailWithdrawlCellModel {
    let key: String
    let value: Any
}

let detailWithdrawCellData: [DetailWithDrawl] = [
    DetailWithDrawl(id: 1, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Success)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 2, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Success)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 3, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Failed)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 4, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Awaiting)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 5, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Awaiting)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 6, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Failed)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 7, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Success)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 8, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Failed)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 9, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Success)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 10, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Awaiting)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),
    DetailWithDrawl(id: 11, data: [
        [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
        [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
        [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
        [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
        [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
        [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
        [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
        [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
        [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Success)],
        [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
    ]
),

]

let data: [[DetailWithdrawlCellModel]] = [
    [DetailWithdrawlCellModel(key: "Mã giao dịch:", value: "F123456")],
    [DetailWithdrawlCellModel(key: "Thời gian:", value: "2022/12/24 11:25:44")],
    [DetailWithdrawlCellModel(key: "Số ruby:", value: "100")],
    [DetailWithdrawlCellModel(key: "Số tiền rút:", value: "100.000 VNĐ")],
    [DetailWithdrawlCellModel(key: "Ngân hàng:", value: "VIETCOMBANK")],
    [DetailWithdrawlCellModel(key: "Chi nhánh:", value: "Chi nhanh Nguyen Chi Thanh")],
    [DetailWithdrawlCellModel(key: "Chủ tài khoản:", value: "NGUYEN THI THUY LY")],
    [DetailWithdrawlCellModel(key: "Số tài khoản:", value: "017201101204")],
    [DetailWithdrawlCellModel(key: "Trạng thái:", value: WithdrawlSate.Awaiting)],
    [DetailWithdrawlCellModel(key: "Hình ảnh:", value: "[Hình ảnh]")],
]
