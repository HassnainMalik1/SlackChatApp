//
//  AvatarPickerVC.swift
//  Slack
//
//  Created by MalikHassnain on 14/06/2019.
//  Copyright © 2019 MalikHassnain. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    //variable
    var avatarType = AvatarType.dark
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell {
            cell.configureCell(index: indexPath.row, type: avatarType)
            return cell
        }
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfCols : CGFloat = 3
        
        if UIScreen.main.bounds.width > 320 {
            numberOfCols = 4
        }

        let spaceBetweenCells : CGFloat = 10
        let padding : CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfCols - 1 ) * spaceBetweenCells) / numberOfCols
        
        return CGSize(width: cellDimension, height: cellDimension)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.row)")
        }else{
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.row)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChange(_ sender: Any) {
    
        if segmentController.selectedSegmentIndex == 0{
            avatarType = .dark
        }else{
            avatarType = .light
        }
        
        collectionView.reloadData()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
