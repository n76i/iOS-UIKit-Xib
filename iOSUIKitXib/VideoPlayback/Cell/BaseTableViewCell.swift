//
//  BaseTableViewCell.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 10/02/2023.
//

import Foundation
import UIKit

enum CallBackType {
    case delete
    case edit
}

class BaseTableViewCell: UITableViewCell {
    var callBack: ((CallBackType) -> (Void))? = nil
    
    
}
