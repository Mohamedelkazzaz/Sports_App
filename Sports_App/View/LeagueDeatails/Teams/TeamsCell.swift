//
//  TeamsCell.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import UIKit

class TeamsCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(team: Teams?){
        nameLbl.text = team?.strTeam
        teamImage.sd_setImage(with: URL(string: team?.strTeamBadge ?? ""), completed: nil)
        
        teamImage.layer.borderWidth = 1
        teamImage.layer.masksToBounds = false
        teamImage.layer.borderColor = UIColor.black.cgColor
        teamImage.layer.cornerRadius = teamImage.frame.height/2
        teamImage.clipsToBounds = true
        
    }
}
