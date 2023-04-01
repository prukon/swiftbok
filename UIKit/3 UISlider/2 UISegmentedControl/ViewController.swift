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
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        label.isHidden = true
        slider.value = 1
        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2  //кол-во строк в label
        
        segmentConrol.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .blue
        
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
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.text = String(sender.value)
        
        //изменение прозрачности вью
        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
}

