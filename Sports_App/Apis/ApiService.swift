//
//  ApiService.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation

protocol ApiService{
    func fetchSports(endPoint: String, completion: @escaping (([Sports]?, Error?) -> Void))
    func fetchLeagues(endPoint: String, completion: @escaping (([Country]?, Error?) -> Void))
    func fetchResults(endPoint: String, completion: @escaping (([Events]?, Error?) -> Void))
    func fetchTeams(endPoint: String, completion: @escaping (([Teams]?, Error?) -> Void))
    
    
}
