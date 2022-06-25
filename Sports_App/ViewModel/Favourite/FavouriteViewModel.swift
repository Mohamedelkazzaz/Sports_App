////
////  FavouriteViewModel.swift
////  Sports_App
////
////  Created by Mohamed Elkazzaz on 23/06/2022.
////
//
//import Foundation
//import UIKit
//
//class FavouriteViewModel {
//    var filterSport: Sports
//    private let navigation: UINavigationController
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    var favourite: [Favourite]?
////     var viewController: UIViewController?
//    var leagueArray: [Favourite]? {
//        didSet {
//            bindingData(favourite,nil)
//        }
//    }
//    var error: Error? {
//        didSet {
//            bindingData(nil, error)
//        }
//    }
//    let apiService: ApiService
//    var bindingData: (([Favourite]?,Error?) -> Void) = {_, _ in }
//    init(apiService: ApiService = NetworkManager(), filterSport: Sports,navigation: UINavigationController) {
//        self.apiService = apiService
//        self.filterSport = filterSport
//        self.navigation = navigation
//    }
//    func fetchLeagues() {
//        favourite =  DBManager.sharedInstanse.fetchData(appDelegate: appDelegate)
//    }
//
//    func getLeagues() -> [Favourite]?{
//        return favourite
//    }
//
//    func getLeague(indexPath: IndexPath) -> Favourite?{
//        return favourite?[indexPath.row]
//    }
//}
//
//extension FavouriteViewModel{
//    func didSelect(indexPath: IndexPath) {
//        if let selectedItem = favourite?[indexPath.row] {
//            // to do: to go to leagues
//        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = stoaryBoard.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsVC
//            vc.viewModel = LeagueDeatilsViewModel(fi: selectedItem, navigation: navigation)
////            vc.navigationItem.title = leagueArray?[indexPath.row].strLeagueAlternate
//            vc.modalPresentationStyle = .fullScreen
//            Helper.topMostController()?.present(vc, animated: true, completion: nil)
//        }
//    }
//}
