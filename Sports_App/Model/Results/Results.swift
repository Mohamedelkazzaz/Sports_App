//
//  Results.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 21/06/2022.
//

import Foundation

struct EventModel: Codable {
    let events: [Events]
}

struct Events: Codable{
    let idEvent: String?
    let idLeague: String?
    let intHomeScore: String?
    let intAwayScore :String?
    let dateEvent: String?
    let strTime: String?
    let strThumb: String?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let strEvent: String?
    let strSeason: String?
    
}

