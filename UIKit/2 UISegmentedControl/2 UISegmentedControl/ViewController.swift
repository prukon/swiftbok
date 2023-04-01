//
//  ViewController.swift
//  2 UISegmentedControl
//
//  Created by Evgeniy Ustyan on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentConrol: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2  //кол-во строк в label
        
        segmentConrol.insertSegment(withTitle: "Third", at: 2, animated: true)
    }

    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch segmentConrol.selectedSegmentIndex {
        case 0:
            label.text = "First segment selected"
            label.textColor = .red
        case 1:
            label.text = "Second segment selected"
            label.textColor = .blue
        case 2:
            label.text = "Third segment selected"
            label.textColor = .yellow
        default:
            print("Somthing wrong")
        }
    }
    
}

