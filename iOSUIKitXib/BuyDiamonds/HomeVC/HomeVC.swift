//
//  HomeVC.swift
//  iOSUIKitXib
//
//  Created by HungND on 29/12/2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        // Do any additional setup after loading the view.
    }

    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "buy_diamonds_bgr_img")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
    

    @IBAction func showBottomSheet(_ sender: Any) {
        let detailSheet = BuydiamondsBottomSheet()
        detailSheet.modalPresentationStyle = .overCurrentContext

        self.present(detailSheet, animated: true)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
