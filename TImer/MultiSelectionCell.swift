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
//public protocol DustingTimerCellDelegate: class {
//    func handleStartButton()
//    func handleResetButton()
//    func handleDustingTimeButton()
//}

class MultiSelectionCell: DatasourceCell {
    
    
    override var datasourceItem: Any? {
        didSet {
            guard let response = datasourceItem as? String else { return }
            choiceText.text = response
        }
    }
    
    let choiceText: UITextView = {
        let choice = UITextView()
        choice.text = "choice"
        choice.font = UIFont.systemFont(ofSize: 17)
        choice.textColor = UIColor.black
        choice.textAlignment = .left
        choice.isEditable = false
        return choice
    }()
    
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.black
        backgroundColor = .white
        
        // Add subviews to cell
        addSubview(choiceText)
        
        // Clamp the subviews within the cell
        choiceText.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant:0, heightConstant: 0)
    }

}




