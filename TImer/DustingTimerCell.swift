//
//  DustingTimerCell.swift
//  TImer
//
//  Created by RoviSys on 9/26/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit
import LBTAComponents


// MARK: - Home User Cell Delegate Definition
public protocol DustingTimerCellDelegate: class {
    func handleStartButton()
    func handleResetButton()
    func handleDustingTimeButton()
}

class DustingTimerCell: DatasourceCell{
    

    
    public weak var delegate: DustingTimerCellDelegate?
    
    let primarySectionLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "")
        text.append(NSAttributedString(string: "Emission Observation Timer", attributes: [NSFontAttributeName: UIFont(name: "AvenirNextCondensed-Heavy", size: 35)!, NSForegroundColorAttributeName: UIColor.white]))
        label.attributedText = text
        label.textAlignment = .center
        return label
    }()
    
    // Set up Primary Timer
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "06:00"
        label.font = UIFont(name: "GillSans-Bold", size: 77)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    
    // Set up Dusting Timer section label
    let dustingTimeSectionLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(string: "")
        text.append(NSAttributedString(string: "Accumulated Dusting Time", attributes: [NSFontAttributeName: UIFont(name: "AvenirNextCondensed-Heavy", size: 35)!, NSForegroundColorAttributeName: UIColor.white]))
        label.attributedText = text
        label.textAlignment = .center
        return label
    }()
    
    
    // Set up Dusting Timer
    let dustingTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans-Bold", size: 77)
        label.text = "00:00"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(colorLiteralRed:0.20, green:0.75, blue:0.20, alpha: 1).cgColor
        button.layer.backgroundColor = UIColor(colorLiteralRed:0.20, green:0.75, blue:0.20, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.setTitle("Start", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 22)
        button.setTitleColor (UIColor.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
        return button
        
    }()
    let resetButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(colorLiteralRed:0.00, green:0.40, blue:0.80, alpha: 1).cgColor
        button.layer.backgroundColor = UIColor(colorLiteralRed:0.00, green:0.40, blue:0.80, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.setTitle("Pause", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 22)
        button.setTitleColor (UIColor.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.addTarget (self, action: #selector(handleResetButton), for: .touchUpInside)
        return button
    }()
    
    let dustingTimeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(colorLiteralRed:0.20, green:0.75, blue:0.20, alpha: 1).cgColor
        button.layer.backgroundColor = UIColor(colorLiteralRed:0.20, green:0.75, blue:0.20, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.setTitle("Start", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 22)
        button.setTitleColor (UIColor.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleDustingTimeButton), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.black
        
        // Add subviews to cell
        addSubview(timeLabel)
        addSubview(dustingTimeLabel)
        addSubview(primarySectionLabel)
        addSubview(dustingTimeSectionLabel)
        addSubview(startButton)
        addSubview(resetButton)
        addSubview(dustingTimeButton)
        
        // Clamp the subviews within the cell
        primarySectionLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant:frame.width, heightConstant: 45)
        
        startButton.anchor(primarySectionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 75, heightConstant: 50)
        
        resetButton.anchor(primarySectionLabel.bottomAnchor, left:nil, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 75, heightConstant: 50)
        
        dustingTimeSectionLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: (frame.height-20)/2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant:frame.width, heightConstant: 45)
        
        dustingTimeButton.anchor(dustingTimeSectionLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 75, heightConstant: 50)
        
        timeLabel.anchor(primarySectionLabel.topAnchor, left: nil, bottom: nil, right: nil, topConstant: frame.height/4.5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 100)
        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        dustingTimeLabel.anchor(dustingTimeSectionLabel.topAnchor, left: timeLabel.leftAnchor, bottom: nil, right: timeLabel.rightAnchor, topConstant: frame.height/4.5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 100)
        dustingTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    // MARK: - Action Handler
    func handleStartButton() {
        delegate?.handleStartButton()
    }
    func handleResetButton() {
        delegate?.handleResetButton()
    }
    func handleDustingTimeButton() {
        delegate?.handleDustingTimeButton()
    }
    
    deinit {
        print("Farewell from Dusting Time Cell")
    }
}



