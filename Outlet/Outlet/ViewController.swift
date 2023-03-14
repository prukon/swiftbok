//
//  ViewController.swift
//  Outlet
//
//  Created by Evgeniy Ustyan on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var welcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func showWelcome(_ sender: UIButton) {
        welcome.text = "welcome"
    }
}
