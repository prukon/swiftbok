//
//  DetailVC.swift
//  UITableView и UIImage
//
//  Created by Evgeniy Ustyan on 04.04.2023.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var image: UIImageView! 
    @IBOutlet weak var titleLabel: UILabel!
    
    var trackTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        image.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
        titleLabel.numberOfLines = 0
        
    }
    


}
