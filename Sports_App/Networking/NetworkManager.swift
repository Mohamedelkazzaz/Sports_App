//
//  NetworkManager.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation
import Alamofire

class NetworkManager: ApiService{
    
    func fetchSports(endPoint: String, completion: @escaping (([Sports]?, Error?) -> Void)) {
        if let url = URL(string: Url(endPoint: endPoint).url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData = try? JSONDecoder().decode(SportModel.self, from: data) else{ return}
                    completion(decodedData.sports,nil)
                    print(decodedData.sports)
                    
                }
                if let error = error {
                    completion(nil,error)
                }
            }.resume()
        }
    }
    func fetchLeagues(endPoint: String, completion: @escaping (([Country]?, Error?) -> Void)) {
        if let url = URL(string: Url(endPoint: endPoint).url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData = try? JSONDecoder().decode(CountryModel.self, from: data) else{ return}
                    completion(decodedData.countries,nil)
                    print(decodedData.countries)
                }
                if let error = error {
                    completion(nil,error)
                }
            }.resume()
        }
    }
    
    func fetchResults(endPoint: String, completion: @escaping (([Events]?, Error?) -> Void)) {
        if let url = URL(string: Url(endPoint: endPoint).url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData =  try? JSONDecoder().decode(EventModel.self, from: data) else{ return}
                    completion(decodedData.events,nil)
                    print(decodedData.events)
                }
                if let error = error {
                    completion(nil,error)
                }
            }.resume()
    }
    }
    
    func fetchTeams(endPoint: String, completion: @escaping (([Teams]?, Error?) -> Void)) {
        if let url = URL(string: Url(endPoint: endPoint).url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData = try? JSONDecoder().decode(TeamModel.self, from: data) else{ return}
                    completion(decodedData.teams,nil)
                    print(decodedData.teams)
                }
                if let error = error {
                    completion(nil,error)
                }
            }.resume()
    }
    
}

}
