//
//  DustingTimeViewController+delegates.swift
//  TImer
//
//  Created by RoviSys on 9/28/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit


extension DustingTimeViewController: DustingTimerCellDelegate {
    
    //format time and date 
    
    func getString() ->String {
        let formatter = DateFormatter()
        // initialize format
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date (from: myString)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let myStringfd = formatter.string(from: yourDate!)
        
        return myStringfd
    }

    func createAlert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "YES", style: .default, handler: { (ACTION) in
            alert.dismiss(animated: true, completion: nil)
            self.timerOn = false
            self.timerPaused = false
            self.timer.invalidate()
            self.dustTimer.invalidate()
            self.initialDustingTime = 0
            self.initialTime = 360
            self.timeLabel?.text = "06:00"
            self.dustingTimeLabel?.text = "00:00"
            self.resetBtn?.setTitle("Pause", for: .normal)
            self.resetBtn?.layer.backgroundColor = self.blue
            self.resetBtn?.layer.borderColor = self.self.blue
      
        }))
        alert.addAction(UIAlertAction(title: "NO", style: .default, handler: { (ACTION) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //take initialTime value and format it to minutes:seconds
    func timeString (time:TimeInterval)-> String{
        let minutes = Int(time)/60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i",minutes, seconds)
    }

    // update timer by decrementing initialTimer, terminate Timer when initialTimer=0
    func updateMainTimer(){
        if let timeLabel = self.timeLabel{
            if initialTime == 0 {
                timer.invalidate()
                timerOn = false
                timerUp = true
                delegate.sendDate(date: getString())
                delegate.sendDustingTime(dusting: timeString(time: TimeInterval(initialDustingTime)))
                dismiss(animated: true, completion: nil)
            } else {
                initialTime -= 1
                timeLabel.text = timeString(time: TimeInterval(initialTime))
            }
        }
    }
  
    
    // update timer by incrementing initialDustingTime, terminate Timer when initialTimer=0
    func updateDustingTimer(){
        if let dustingTimeLabel = self.dustingTimeLabel{
            if initialTime == 0 {
                timerUp = true
                dustTimer.invalidate()
            
            } else {
                initialDustingTime += 1
                dustingTimeLabel.text = timeString(time: TimeInterval(initialDustingTime))
                
            }
        }
    }
    
    // updating timer every second
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateMainTimer), userInfo: nil, repeats: true)
    }
    
    func runDustingTimer(){
        dustTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateDustingTimer), userInfo: nil, repeats: true)
    }
    
    
    // on the click of "Start" runTimer
    func handleStartButton(){
        if timerOn == false && timerUp == false {
            // There's only 1 subview for the collectionview, and it's of type DustingTimerCell
            let view = self.collectionView?.subviews[0] as! DustingTimerCell
            let label = view.timeLabel
            let btn = view.resetButton
            runTimer()
            timerOn = true
            self.timeLabel = label
            timerPaused = false
            self.resetBtn = btn
            self.resetBtn?.setTitle("Pause", for: .normal)
            self.resetBtn?.layer.backgroundColor = blue
            self.resetBtn?.layer.borderColor = blue
            
        }
    }
    
    // on the click of "Reset" terminate timer and reset initialTime
    func handleResetButton(){
        // pause timer
        if timerOn == true {
            timer.invalidate()
            timerOn = false
            timerPaused = true
            dustTimer.invalidate()
            dustingTimerOn = false
            self.resetBtn?.setTitle("Reset", for: .normal)
            self.resetBtn?.layer.backgroundColor = red
            self.resetBtn?.layer.borderColor = red
            self.dustBtn?.setTitle("Start", for: .normal)
            self.dustBtn?.layer.backgroundColor = green
            self.dustBtn?.layer.borderColor = green
            
        // display alert, reset timer if confirmed
        } else {
            if timerPaused == true {
                createAlert(title: "Reset", message: "are you sure you want to reset your timer?")
            }
        }
    }
    
    //on the click of "Start/Stop"
    func handleDustingTimeButton(){
        if dustingTimerOn == false && timerOn == true && timerPaused == false {
            let view = self.collectionView?.subviews[0] as! DustingTimerCell
            
            let label = view.dustingTimeLabel
            let btn = view.dustingTimeButton
            runDustingTimer()
            dustingTimerOn = true
            self.dustingTimeLabel = label
            self.dustBtn = btn
            self.dustBtn?.setTitle("Stop", for: .normal)
            self.dustBtn?.layer.backgroundColor = red
            self.dustBtn?.layer.borderColor = red
        } else {
            dustTimer.invalidate()
            dustingTimerOn = false
            self.dustBtn?.setTitle("Start", for: .normal)
            self.dustBtn?.layer.backgroundColor = green
            self.dustBtn?.layer.borderColor = green
        }
    }
}
