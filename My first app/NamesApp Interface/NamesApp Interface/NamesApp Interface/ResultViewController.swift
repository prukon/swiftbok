//
//  ResultViewController.swift
//  NamesApp Interface
//
//  Created by Evgeniy Ustyan on 15.03.2023.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    
    var firstName : String!
    var secondName: String!
    
    var resultValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
        resultValue = findResult()
        resultLabel.text = resultValue.formatted(.percent) //форматирование числа в процент
        progressView.progress = Float(resultValue) / 100

        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
    }
    
    private func findValue (for name: String) -> Int {
        var count = 0
        for character in name.lowercased() {
            switch character {
            case "a", "b", "d":
                count += 1
            case "e", "f", "g":
                count += 3
            case "h", "i", "j":
                count += 3
            case "k", "l", "m":
                count += 4
            case "n", "o", "p":
                count += 5
            case "q", "r", "s":
                count += 6
            case "t", "u", "v":
                count += 7
            case "w", "x", "y", "z":
                count += 8
            default :
                count += 0
            }
        }
       return count
    }
    
   private func findResult() -> Int {
        var result = 0
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let absDiffenence = abs(firstValue - secondValue)

       switch absDiffenence {
       case 0, 1, 2:
           result = 100
       case 3, 4:
           result = 80
       case 5:
           result = 60
       case 6:
           result = 40
       case 7:
           result = 20
       default:
           result = 10
       }
       
       return result
    }
    
    
}
