//
//  BuydiamondsBottomSheet.swift
//  iOSUIKitXib
//
//  Created by HungND on 29/12/2022.
//

import UIKit

class BuydiamondsBottomSheet: UIViewController {
    let diamondsData: [DiamondModel] = [
        DiamondModel(diamondNumber: 69, money: 100000, isSelect: true),
        DiamondModel(diamondNumber: 139, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 349, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 699, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 3499, money: 100000, isSelect: false),
        DiamondModel(diamondNumber: 6999, money: 100000, isSelect: false),
    ]
    
    @IBOutlet weak var space: UIView!
    @IBOutlet weak var moneyTotal: UILabel!
    @IBOutlet weak var diamondTotal: UILabel!
    @IBOutlet weak var diamondView: UIView!
    @IBOutlet weak var diamondCurrentTxt: UILabel!
    @IBOutlet weak var titletxt: UILabel!

    @IBOutlet weak var sheetView: UIView!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var diamondsClv: UICollectionView!
    
    var itemSize: CGSize!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view.
    }
    
    @objc func spaceAction(_ sender:UITapGestureRecognizer){
        // do other task
        dismiss(animated: true)
    }

    
    func setupView() {
        self.view.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        //set height to BottomSheet
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.spaceAction(_:)))
        self.space.addGestureRecognizer(gesture)
        space.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        sheetView.roundCorners([.topLeft, .topRight], radius: 18)

        //setup diamondsCollection
        diamondsClv.register(UINib(nibName: "DiamondCell", bundle: nil), forCellWithReuseIdentifier: "DiamondCell")
        diamondsClv.dataSource = self
        diamondsClv.delegate = self
        
        
        //setup titleTxt
        titletxt.font = UIFont(name: "Sarabun-Regular", size: 18)
        
        //setup diamondView
        diamondView.layer.cornerRadius = 8
        
        //setup diamondTotal
        diamondTotal.text = String(699.description)
        moneyTotal.text = String( "(" + 100000.description + " vnđ)")
        
        //setup buy btn
        buyBtn.setTitle("NẠP", for: .normal)
        let shape = CAShapeLayer()
        buyBtn.applyGradient(colors: [ UIColor(named: "8F4AFF")!, UIColor(named: "FF5B37")!], startPoint: CGPoint(x: 0.0, y: 0.8), endPoint: CGPoint(x: 1.0, y: 0.2), shape: shape)
    }
}

extension BuydiamondsBottomSheet: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diamondsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = diamondsClv.dequeueReusableCell(withReuseIdentifier: "DiamondCell", for: indexPath) as! DiamondCell
        cell.sizeOfView = itemSize
        cell.setupView(model: diamondsData[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 2*8
        let width = collectionView.frame.width - padding
        itemSize = CGSize(width: width/3.0, height: 70)
        return CGSize(width: width/3.0, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(diamondsData[indexPath.row].diamondNumber)
        
        for e in diamondsData {
            if (e === diamondsData[indexPath.row]) {
                e.isSelect = true
            } else {
                e.isSelect = false
            }
        }
        
        diamondsClv.reloadData()
    }
}

