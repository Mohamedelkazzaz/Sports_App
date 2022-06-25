//
//  Teams.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 21/06/2022.
//

import Foundation

struct TeamModel: Codable {
    let teams: [Teams]
}

struct Teams: Codable{
    let idTeam: String?
    let idSoccerXML: String?
    let strTeam: String?
    let strAlternate :String?
    let intFormedYear:String?
    let strSport: String?
    let strLeague:String?
    let strStadium :String?
    let strStadiumThumb: String?
    let strStadiumLocation:String?
    let intStadiumCapacity: String?
    let strDescriptionEN:String?
    let strWebsite: String?
    let strFacebook:String?
    let strTwitter: String?
    let strInstagram:String?
    let strCountry:String?
    let strTeamBadge: String?
    let strTeamJersey :String?
    let strYoutube: String?
   
    
}
