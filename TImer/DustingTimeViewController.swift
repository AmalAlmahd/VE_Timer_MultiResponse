//
//  DustingTimeViewController.swift
//  TImer
//  Description: Collection View Controller for the Dusting Timer View.
//  Created by RoviSys on 9/25/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit
import LBTAComponents

protocol DataDelegate {
    func sendDate(date: String)
    func sendDustingTime(dusting: String)
}

class DustingTimeViewController: DatasourceController {
   
    let window = UIApplication.shared.keyWindow
    // initiate variables for timeLabel, timeframe, timer, timer status
    var timeLabel: UILabel?
    var dustingTimeLabel : UILabel?
    var resetBtn: UIButton?
    var dustBtn:UIButton?
    var initialTime = 10
    var initialDustingTime = 0
    var timer = Timer()
    var dustTimer = Timer()
    var timerOn = false
    var dustingTimerOn = false
    var timerUp = false
    var timerPaused = false
    var blue = UIColor(colorLiteralRed:0.00, green:0.40, blue:0.80, alpha: 1).cgColor
    var green = UIColor(colorLiteralRed:0.20, green:0.75, blue:0.20, alpha: 1).cgColor
    var red = UIColor(colorLiteralRed:0.80, green:0.00, blue:0.00, alpha: 1).cgColor
    var delegate: DataDelegate!
    var confirmed = false
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.datasource = DustingTimeDatasource()
        self.collectionView?.backgroundColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        }
    }


