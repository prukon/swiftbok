//
//  TrackList.swift
//  UITableView и UIImage
//
//  Created by Evgeniy Ustyan on 04.04.2023.
//

import UIKit

class TrackList: UITableViewController {
    
    
    let imageNameArray = [
        "Montero (Call Me By Your Name) - Lil Nas X",
                "Stay - The Kid LAROI & Justin Bieber",
                "Industry Baby - Lil Nas X & Jack Harlow",
                "Levitating (feat. DaBaby) - Dua Lipa",
                "Peaches (feat. Daniel Caesar & Giveon) - Justin Bieber",
                "Good 4 U - Olivia Rodrigo",
                "Save Your Tears (with Ariana Grande) (Remix) - The Weeknd & Ariana Grande",
                "Heat Waves - Glass Animals",
                "Kiss Me More (feat. SZA) - Doja Cat",
                "Permission to Dance - BTS"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text  = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 60
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as! DetailVC
                detailsVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }
}
