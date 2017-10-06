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
    
    
    func getString() ->String {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        
        let todayString = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!) + ":" + String(minute!) + ":" + String(second!)
        
        return todayString
    }
    

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


