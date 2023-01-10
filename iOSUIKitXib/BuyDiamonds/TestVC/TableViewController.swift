//
//  TableViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 09/01/2023.
//

import UIKit
@available(iOS 13.0, *)
class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var myData = ["First", "Second", "Third", "Four", "Five"]
    var myDataSection = ["F", "S", "T", "D", "V"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self // Phương thức liên quan đến tương tác với cell, số dòng
        tableView.dataSource = self // Phương thức liên quan đến dữ liệu
        tableView.separatorColor = .red // Chỉnh màu chho đường kẻ ngăn cách
        tableView.tableFooterView = UIView() // ẩn những row chống
        
        let nib = UINib(nibName: "TestTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TestTableViewCell")
    }
 
}
@available(iOS 13.0, *)
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    // số lượng Setion
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Set title cho Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return myDataSection[section]
    }
    // set chiều cao cho section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    // số dòng trong từng section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    // dữ liệu của cell tại vị trí indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath) as! TestTableViewCell
        cell.myLabel.text = myData[indexPath.row]
        cell.myImage.backgroundColor = .orange
//        cell.imageView?.image = UIImage(systemName: "xmark")
        
       // tắt hiệu ứng selection
        cell.selectionStyle = .none
        return cell
    }
    // Chiều cao của cell, row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 80
        } else {
            return 40
        }
        
//        return UITableView.automaticDimension // Tự động trả về height phù hợp
    }
    // Bắt dự kiện người dùng chọn vào row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Did selected \(indexPath.section) - \(indexPath.row)")
        // hàm bỏ màu của dòng vừa chọn
        tableView.deselectRow(at: indexPath, animated: true) // thế làm sao để ko hiện luôn cái màu khi bấm vào? Thì chúng ta viết 1 cái hàm trong cell chứ còn gì nữa
    }
//    // bắt sự kiện khi nguời dùng bỏ chọn  row
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print("did selected \(indexPath.row)")
//    }
    
    // bắt sự kiện vuốt từ trái sang phải
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editButton = UIContextualAction(style: .destructive, title: "Edit") { _, _, _ in
            print("Edit row at \(indexPath.row)")
        }
        editButton.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [editButton])
    }
    // Bắt sự kiện người dùng vuốt từ phải trang trái
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteButton = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.myData.remove(at: indexPath.row)
            tableView.reloadData()
//            tableView.reloadSections([indexPath.section], with: .fade)
        }
        let blockButton = UIContextualAction(style: .destructive, title: "Block") { _, _, _ in
            print("Block row at \(indexPath.row)")
        }
        deleteButton.backgroundColor = .red
        blockButton.backgroundColor = .systemPurple
        
        return UISwipeActionsConfiguration(actions: [deleteButton, blockButton])
    }
//    // Hàm commitEditting có độ ưu tiên thấp hơn 2 cái ở trên
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            print("Style delete")
//        }
//    }
    // vì tableView kế thừa từ scrollView nên có mọi delegate của scrollView
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrolling")
    }
}
