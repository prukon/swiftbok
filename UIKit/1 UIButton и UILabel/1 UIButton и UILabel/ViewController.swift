//
//  ViewController.swift
//  1 UIButton и UILabel
//
//  Created by Evgeniy Ustyan on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    
    
    @IBOutlet weak var action2: UIButton!
    @IBOutlet weak var action1: UIButton!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textColor = .red
        
        button.isHidden = true
        
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        
        action1.setTitleColor(.blue, for: .normal)
        action1.backgroundColor = .green
        
        action2.setTitleColor(.blue, for: .normal)
        action2.backgroundColor = .green
        
    }
    
    @IBAction func pressToButton(_ sender: UIButton) {
        
        label.isHidden = false
        button.isHidden = false
        
        if sender.tag == 0 {
            label.text = "Hello World!"
            label.textColor = .red
            
        } else if sender.tag == 1 {
            label.text = "Hi, there!"
            label.textColor = .blue
        } else if sender.tag == 2 {
            label.isHidden = true
            button.isHidden = true
            
        }
        
        //        if label.isHidden {
        //            label.isHidden = false
        //            label.text = "Hello World!"
        //
        //            button.setTitle("Clear", for: .normal)
        //            button.setTitleColor(.white, for: .normal)
        //            button.backgroundColor = .red
        //        } else {
        //            label.isHidden = true
        //
        //            button.setTitle("Get result", for: .normal)
        //            button.setTitleColor(.blue, for: .normal)
        //            button.backgroundColor = .green
        //
        //        }
        
        
        
        
    }
    
    
}

