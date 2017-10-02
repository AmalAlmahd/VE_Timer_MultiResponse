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
    
    @IBAction func buttonHandler(_ sender: Any) {
        let controller = DustingTimeViewController()
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = transition
        present(controller, animated: true, completion: nil)
    }
    lazy var transition: SwiftyPresenter = {
        var swifty = SwiftyPresenter()
        swifty.transition(from: .left, useDimmer: false, dismissWithDimmer: true, withContainerSizeof: .containerSize(width: 0.7, height: 1), framePositionAt: .framePos(width: 0.9, height: 1.0))
      //  swifty.transition(from: .left, useDimmer: true, withContainerSizeof: .containerSize(width: 0.5, height: 1), framePositionAt: .framePos(width: 0.9, height: 1))
     swifty.transition(withAnimationDurationOf: 0.7)
        //swifty.transition(withRoundCornersOn: [.topLeft,.topRight], cornerRadius: 10)
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

