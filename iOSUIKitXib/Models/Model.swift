//
//  Model.swift
//  iOSUIKitXib
//
//  Created by Van Ngoc An  on 11/01/2023.
//

import Foundation
import UIKit

struct DataManager {
    let showImage: String
    let nameTitleLabel: String
    let notifyImage: String
    let nextImage: String
    let isHiden: Bool
}

struct Models {
    let text: String
    let imageName: String
    
    init(text: String, imageName: String) {
        self.text = text
        self.imageName = imageName
    }
}

extension UIImage {
    
    static func dynamicImage(withLight light: @autoclosure () -> UIImage,
                             dark: @autoclosure () -> UIImage) -> UIImage {
        
        if #available(iOS 13.0, *) {
            
            let lightTC = UITraitCollection(traitsFrom: [.current, .init(userInterfaceStyle: .light)])
            let darkTC = UITraitCollection(traitsFrom: [.current, .init(userInterfaceStyle: .dark)])
            
            var lightImage = UIImage()
            var darkImage = UIImage()
            
            lightTC.performAsCurrent {
                lightImage = light()
            }
            darkTC.performAsCurrent {
                darkImage = dark()
            }
            
            lightImage.imageAsset?.register(darkImage, with: UITraitCollection(userInterfaceStyle: .dark))
            return lightImage
        }
        else {
            return light()
        }
    }
}
