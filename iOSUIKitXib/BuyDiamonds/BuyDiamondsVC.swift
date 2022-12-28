//
//  BuyDiamondsVC.swift
//  iOSUIKitXib
//
//  Created by HungND on 26/12/2022.
//

import UIKit

class BuyDiamondsVC: UIViewController {
    let diamondsData: [DiamondModel] = [
        DiamondModel(diamondNumber: 69, money: 100000, isSelect: true),
        DiamondModel(diamondNumber: 139, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 349, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 699, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 3499, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 6999, money: 100000, isSelect: false),
    ]
    
    
    @IBOutlet weak var diamondView: UIView!
    @IBOutlet weak var diamondCurrentTxt: UILabel!
    @IBOutlet weak var titletxt: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var diamondsClv: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setBackgroundImage()
        setupView()
        
        
    }
    
    func setupView() {
        //setup diamondsCollection
        diamondsClv.register(UINib(nibName: "DiamondCell", bundle: nil), forCellWithReuseIdentifier: "DiamondCell")
        diamondsClv.dataSource = self
        diamondsClv.delegate = self
        
        //setup contentView
        contentView.roundCorners([.topLeft, .topRight], radius: 18)
        
        //setup titleTxt
        titletxt.font = UIFont(name: "Sarabun-Regular", size: 18)
        
        //setup diamondView
        diamondView.layer.cornerRadius = 8
        
        //setup buy btn
        buyBtn.setTitle("Nạp", for: .normal)
        let shape = CAShapeLayer()
        buyBtn.applyGradient(colors: [ UIColor(named: "8F4AFF")!.withAlphaComponent(0.9013), UIColor(named: "FF5B37")!.withAlphaComponent(0.0528)], startPoint: CGPoint(x: 0.0, y: 1.0), endPoint: CGPoint(x: 1.0, y: 1.0), shape: shape)
    }
    
    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "buy_diamonds_bgr_img")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
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

extension BuyDiamondsVC: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diamondsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = diamondsClv.dequeueReusableCell(withReuseIdentifier: "DiamondCell", for: indexPath) as! DiamondCell
        
        cell.setupView(model: diamondsData[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 2*8
        let width = UIScreen.main.bounds.width  - padding - 32
        return CGSize(width: width/3.0, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(diamondsData[indexPath.row].diamondNumber)
        
        for e in diamondsData {
            if (e.diamondNumber == diamondsData[indexPath.row].diamondNumber) {
                e.isSelect = true
            } else {
                e.isSelect = false
            }
        }
        
        
    }
}

