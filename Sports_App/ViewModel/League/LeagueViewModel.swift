//
//  LeagueViewModel.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import Foundation


class LeagueViewModel {
    var filterSport: Sports
//    private let navigation: UINavigationController
//     var viewController: UIViewController?
    var leagueArray: [Country]? {
        didSet {
            bindingData(leagueArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let apiService: ApiService
    var bindingData: (([Country]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManager(), filterSport: Sports) {
        self.apiService = apiService
        self.filterSport = filterSport
//        self.navigation = navigation
    }
    func fetchLeagues() {
        let endPoint = "search_all_leagues.php?s=\(filterSport.strSport)"
        apiService.fetchLeagues(endPoint: endPoint) { leagues, error in
            if let leagues = leagues {
                self.leagueArray = leagues.filter({leguaeItem in
                    return leguaeItem.strSport == self.filterSport.strSport
                })
            }
            if let error = error {
                self.error = error
            }
        }
    }
    
    func getLeagues() -> [Country]?{
        return leagueArray
    }
    
    func getLeague(indexPath: IndexPath) -> Country?{
        return leagueArray?[indexPath.row]
    }
}

