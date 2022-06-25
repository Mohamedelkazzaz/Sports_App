//
//  Url.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation

struct Url {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
}
