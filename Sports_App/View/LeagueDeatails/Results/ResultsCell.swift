//
//  ResultsCell.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import UIKit

class ResultsCell: UICollectionViewCell {
//    @IBOutlet weak var matchImage: UIImageView!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(results: Events?){
//        matchImage.sd_setImage(with: URL(string: results?.strThumb ?? ""), completed: nil)
        homeTeamLabel.text = results?.strHomeTeam
        awayTeamLabel.text = results?.strAwayTeam
        homeScoreLabel.text = results?.intHomeScore
        awayScoreLabel.text = results?.intAwayScore
        timeLabel.text = results?.strTime
        dateLabel.text = results?.dateEvent
//        if results?.dateEvent.
    }
    
}
