//
//  League.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation

struct CountryModel: Codable {
    let countries: [Country]
}

// MARK: - League
struct Country: Codable {
    var idLeague, strLeague, strSport: String?
    let strLeagueAlternate: String?
    let strCurrentSeason: String?
    var strBadge: String?
    let strYoutube: String?
    
    init(favourite: Favourite){
        self.idLeague = favourite.leagueId
        self.strLeague = favourite.leagueName
        self.strSport = ""
        self.strLeagueAlternate = ""
        self.strCurrentSeason = ""
        self.strBadge = favourite.leagueImage
        self.strYoutube = favourite.leagueVideo
    }
    
}
