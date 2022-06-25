//
//  SportsViewModel.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation
import UIKit


class SportsViewModel{
    private let navigation: UINavigationController
    var sportArray: [Sports]? {
        didSet {
            bindingData(sportArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let apiService: ApiService
    var bindingData: (([Sports]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManager(),navigation: UINavigationController) {
        self.apiService = apiService
        self.navigation = navigation
    }
    func fetchSports(endPoint: String) {
        apiService.fetchSports(endPoint: endPoint) { sports, error in
            if let sports = sports {
                self.sportArray = sports
            }
            if let error = error {
                self.error = error
            }
        }
    }
}

extension SportsViewModel{

    func getSports() -> [Sports]?{
        return sportArray
    }
    
    func getSport(indexPath: IndexPath) -> Sports?{
        return sportArray?[indexPath.row]
    }
    
}
