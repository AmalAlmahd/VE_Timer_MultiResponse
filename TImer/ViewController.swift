//
//  ViewController.swift
//  TImer
//
//  Created by RoviSys on 9/25/17.
//  Copyright © 2017 RoviSys. All rights reserved.
//

import UIKit
import SwiftyPresenter


class ViewController: UIViewController {

    
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var responseTxtView: UITextView!
    

    @IBOutlet weak var TimeEnd: UILabel!
    

    @IBAction func buttonHandler(_ sender: Any) {
        let controller = DustingTimeViewController()
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = transition
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        
    }
        lazy var transition: SwiftyPresenter = {
        var swifty = SwiftyPresenter()
        swifty.transition(from: .left, useDimmer: true, dismissWithDimmer: false, withContainerSizeof: .containerSize(width: 0.7, height: 0.85), framePositionAt: .framePos(width: 0.9, height: 1.0))
            swifty.transition(withAnimationDurationOf: 0.7)
        
        return swifty
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: DataDelegate {
    func sendDate(date: String) {
        TimeEnd.text = date
    }
    func sendDustingTime(dusting: String) {
        responseTxtView.text = "Accumulated Dusting Time: " + dusting
    }
    
}
