//
//  DustingTimeViewController.swift
//  TImer
//  Description: Collection View Controller for the Dusting Timer View.
//  Created by RoviSys on 9/25/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit
import LBTAComponents

class DustingTimeViewController: DatasourceController {
   
    // initiate variables for timeLabel, timeframe, timer, timer status
    var timeLabel: UILabel?
    var dustingTimeLabel : UILabel?
    var initialTime = 360
    var initialDustingTime = 0
    var timer = Timer()
    var dustTimer = Timer()
    var timerOn = false
    var dustingTimerOn = false
    var timerUp = false
    var timerPaused = false
    var resetBtn: UIButton?
    var dustBtn:UIButton?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = DustingTimeDatasource()
        self.collectionView?.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

