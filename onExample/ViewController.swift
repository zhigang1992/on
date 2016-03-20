//
//  ViewController.swift
//  on
//
//  Created by Kyle Fang on 3/20/16.
//  Copyright © 2016 Kyle Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.on(.TouchUpInside) { (button, event) in
            print("This is much cooler than adding a target action")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

