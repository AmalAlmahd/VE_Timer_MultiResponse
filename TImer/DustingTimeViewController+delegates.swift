//
//  DustingTimeViewController+delegates.swift
//  TImer
//
//  Created by RoviSys on 9/28/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit

extension DustingTimeViewController: DustingTimerCellDelegate {
    
  
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
                dismiss(animated: true, completion: nil)
                date = Date().description
            }
            else {
                initialTime -= 1
                timeLabel.text = timeString(time: TimeInterval(initialTime))

            }
        }
    }
    

    func updateDustingTimer(){
        if let dustingTimeLabel = self.dustingTimeLabel{
            if initialTime == 0 {
                timerUp = true
                dustTimer.invalidate()
                date = Date().description
            
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
            print(date)
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
        if timerOn == true{
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
            
        // reset timer
        } else {
            timerOn = false
            timerPaused = false
            timer.invalidate()
            dustTimer.invalidate()
            initialDustingTime = 0
            
            if timerUp == false{
                    initialTime = 360
                    self.timeLabel?.text = "06:00"
                    self.dustingTimeLabel?.text = "00:00"
                    self.resetBtn?.setTitle("Pause", for: .normal)
                    self.resetBtn?.layer.backgroundColor = blue
                    self.resetBtn?.layer.borderColor = blue
                    self.dustBtn?.setTitle("Start", for: .normal)
                    self.dustBtn?.layer.backgroundColor = green
                    self.dustBtn?.layer.borderColor = green
            } else {
                    initialTime = 0
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

