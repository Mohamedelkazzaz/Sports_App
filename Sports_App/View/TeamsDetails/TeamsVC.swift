//
//  TeamsVC.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import UIKit

class TeamsVC: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var shirtImage: UIImageView!
    @IBOutlet weak var staduimImage: UIImageView!
    @IBOutlet weak var formedLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var websiteButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var instgramButton: UIButton!
    @IBOutlet weak var youtubeButton: UIButton!
    
    //    var team: Teams?
    var viewModel: TeamViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
         
         
        navBar.topItem?.title = viewModel?.filterTeam.strTeam ?? ""
        viewModel?.bindingData = {
            DispatchQueue.main.async {
                self.check()
                self.logoImage.sd_setImage(with: URL(string: self.viewModel?.getTeam()?.strTeamBadge ?? ""), completed: nil)
                self.shirtImage.sd_setImage(with: URL(string: self.viewModel?.getTeam()?.strTeamJersey ?? ""), completed: nil)
                self.staduimImage.sd_setImage(with: URL(string: self.viewModel?.getTeam()?.strStadiumThumb ?? ""), completed: nil)
                self.formedLabel.text = self.viewModel?.getTeam()?.intFormedYear

                self.countryLabel.text = self.viewModel?.getTeam()?.strCountry
                self.descriptionTextView.text = self.viewModel?.getTeam()?.strDescriptionEN
            }
    }
        viewModel?.viewIsLoade()
        
       

        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func safariBtn(_ sender: UIButton) {
        guard let url = URL(string: "http://\(viewModel?.getTeam()?.strWebsite ?? "")") else { return}
        UIApplication.shared.open(url)
    }
    @IBAction func faceBookBtn(_ sender: UIButton) {
        guard let url = URL(string: "https://\(viewModel?.getTeam()?.strFacebook ?? "")") else { return}
        UIApplication.shared.open(url)
    }
    @IBAction func twiiterBtn(_ sender: UIButton) {
        guard let url = URL(string: "http://\(viewModel?.getTeam()?.strTwitter ?? "")") else { return}
        UIApplication.shared.open(url)
    }
    @IBAction func instgramBtn(_ sender: UIButton) {
        guard let url = URL(string: "http://\(viewModel?.getTeam()?.strInstagram ?? "")") else { return}
        UIApplication.shared.open(url)
    }
    
    @IBAction func youtubeBtn(_ sender: UIButton) {
        guard let url = URL(string: "http://\(viewModel?.getTeam()?.strYoutube ?? "")") else { return}
        UIApplication.shared.open(url)
    }
    
    func check(){
        if self.viewModel?.getTeam()?.strWebsite == ""{
            self.websiteButton.isHidden = true
        }else{
            self.websiteButton.isHidden = false
        }
        
        if self.viewModel?.getTeam()?.strYoutube == ""{
            self.youtubeButton.isHidden = true
        }else{
            self.youtubeButton.isHidden = false
        }
        
        if self.viewModel?.getTeam()?.strFacebook == ""{
            self.facebookButton.isHidden = true
        }else{
            self.facebookButton.isHidden = false
        }
        
        if self.viewModel?.getTeam()?.strTwitter == ""{
            self.twitterButton.isHidden = true
        }else{
            self.twitterButton.isHidden = false
        }
        
        if self.viewModel?.getTeam()?.strInstagram == ""{
            self.instgramButton.isHidden = true
        }else{
            self.instgramButton.isHidden = false
        }
        
    }
    
}
