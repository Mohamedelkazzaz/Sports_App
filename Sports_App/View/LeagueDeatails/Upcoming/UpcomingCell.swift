//
//  UpcomingCell.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import UIKit

class UpcomingCell: UICollectionViewCell {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    @IBOutlet weak var timeEventLabel: UILabel!
//    @IBOutlet weak var matchImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(event: Events?){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let someDate = dateFormatter.date(from: event?.dateEvent ?? "") ?? Date()
        let date2 = Date()
        
       if (someDate  > date2){
            eventNameLabel.text = event?.strEvent
            dateEventLabel.text = event?.dateEvent
            timeEventLabel.text = event?.strTime
//                   matchImage.sd_setImage(with: URL(string: event?.strThumb ?? ""), completed: nil)
       }else{
            eventNameLabel.text = "No upComing Event now"
           eventNameLabel.textAlignment = .center
            dateEventLabel.text = ""
            timeEventLabel.text = ""
        }
        

    }
}
