//
//  ViewController.swift
//  Enjoy every day
//
//  Created by Evgeniy Ustyan on 14.03.2023.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    private var numberOfDays = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        resultButton.layer.cornerRadius = 12
    }

    @IBAction func resultButtonTapped() {
        infoLabel.text = "Ты наслаждаешься жизнью \(numberOfDays)"
    }
    
    @IBAction func datePicker(_ sender:    UIDatePicker) {
        let range = sender.date..<Date.now
        numberOfDays = range.formatted(.components(style: .wide, fields: [.day]))
    }
}

