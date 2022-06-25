//
//  TeamsViewModel.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import Foundation


class TeamViewModel {
    var filterTeam: Teams
//    private var navigation: UINavigationController?
//     var viewController: UIViewController?
    var teamArray: [Teams]? {
        didSet {
            bindingData()
        }
    }
    var error: Error? {
        didSet {
            bindingData()
        }
    }
    let apiService: ApiService
    var bindingData: (() -> Void) = { }
    init(apiService: ApiService = NetworkManager(), filterTeam: Teams) {
        self.apiService = apiService
        self.filterTeam = filterTeam
//        self.filterSport = filterSport
//        self.navigation = navigation
    }
    func fetchTeams() {
        let endPoint = "search_all_teams.php?l=\(filterTeam.strLeague ?? "")"
        let urlString = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        apiService.fetchTeams(endPoint: urlString ?? "") { teams, error in
            if let teams = teams {
                self.teamArray = teams.filter({leguaeItem in
                    return leguaeItem.idTeam == self.filterTeam.idTeam
                })
            }
            if let error = error {
                self.error = error
            }
        }
    }
    

    func getTeam() -> Teams?{
        return filterTeam
    }
    
    func viewIsLoade(){
        bindingData()
    }
}
