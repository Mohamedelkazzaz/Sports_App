//
//  SportsCell.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import UIKit

class SportsCell: UICollectionViewCell {
    @IBOutlet weak var sportsImage: UIImageView!
    @IBOutlet weak var sportsNameLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(sport: Sports?){
        sportsNameLabel.text = sport?.strSport ?? ""
        sportsImage.sd_setImage(with: URL(string: sport?.strSportThumb ?? ""), completed: nil)

    }

}
