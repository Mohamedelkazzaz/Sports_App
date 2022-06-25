//
//  LeaguesCell.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import UIKit

class LeaguesCell: UITableViewCell {
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!
    
    var country: Country?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func linkButton(_ sender: Any) {
        
        guard let url = URL(string: "https://\(country?.strYoutube ?? "")") else { return}
            print(url)
            UIApplication.shared.open(url)
    
    }
    
    func setup(country: Country?){
        nameLabel.text = country?.strLeague ?? ""
        leagueImage.sd_setImage(with: URL(string: country?.strBadge ?? ""), completed: nil)
        if country?.strYoutube == ""{
            youtubeButton.isHidden = true
        }else{
            youtubeButton.isHidden = false
        }
        
        self.country = country
    }
    
}
