//
//  LeagueDeatilsViewModel.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import Foundation


class LeagueDeatilsViewModel {
    var filterLeague: Country
//    var favourite = [Country]()
//    private let navigation: UINavigationController
    var teamArray: [Teams]? {
        didSet {
            bindingData(teamArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    var events: [Events]? {
        didSet {
            bindingResult(events,nil)
        }
    }

    var resultError: Error?{
        didSet{
            bindingResult(nil,error)
        }
    }
    let apiService: ApiService
    var bindingData: (([Teams]?,Error?) -> Void) = {_, _ in }
    var bindingResult: (([Events]?,Error?) -> Void) = {_, _ in }
    init(apiService: ApiService = NetworkManager(), filterLeague: Country) {
        self.apiService = apiService
        self.filterLeague = filterLeague
//        self.navigation = navigation
    }
    func fetchTeams() {
        let endPoint = "search_all_teams.php?l=\(filterLeague.strLeague ?? "")"
        let urlString = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

//        print(urlString)
        apiService.fetchTeams(endPoint: urlString ?? "") { teams, error in
            if let teams = teams {
                self.teamArray = teams.filter({teamItem in
                    return teamItem.strLeague == self.filterLeague.strLeague
                })
                
//                print(self.teamArray)
            }
            if let error = error {
                self.error = error
            }
        }
    }
    
    func getTeams() -> [Teams]?{
        return teamArray
    }
    
    func getTeam(indexPath: IndexPath) -> Teams?{
        return teamArray?[indexPath.row]
    }
}

extension LeagueDeatilsViewModel{
    
    func fetchResults() {
        let endPoint = "eventsseason.php?id=\(filterLeague.idLeague ?? "")"
        print(endPoint)
//        print(urlString)
        apiService.fetchResults(endPoint: endPoint) { event, error in
            if let event = event {
                self.events = event.filter({resultItem in
                    return resultItem.idLeague == self.filterLeague.idLeague
                })
                
//                print(self.teamArray)
            }
            if let error = error {
                self.resultError = error
            }
        }
    }
    
    func getResults() -> [Events]?{
        return events
    }
    
    func getResult(indexPath: IndexPath) -> Events?{
        return events?[indexPath.row]
    }
   
}



