//
//  CustomCollecVsTableViewController.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/01/2023.
//

import UIKit

class CustomCollecVsTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var models = [Models]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models.append(Models(text: "First", imageName: "1"))
        models.append(Models(text: "Second", imageName: "2"))
        models.append(Models(text: "Third", imageName: "3"))
        models.append(Models(text: "Four", imageName: "4"))
        models.append(Models(text: "Five", imageName: "5"))
        models.append(Models(text: "Six", imageName: "6"))
        models.append(Models(text: "Seven", imageName: "7"))
        models.append(Models(text: "Eight", imageName: "8"))

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
    }

}
extension CustomCollecVsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 23
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell", for: indexPath) as! CollectionTableViewCell
        cell.configuress(with: models)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}
