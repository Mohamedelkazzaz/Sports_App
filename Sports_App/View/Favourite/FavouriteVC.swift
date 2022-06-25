//
//  FavouriteVC.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 23/06/2022.
//

import UIKit
import Network

class FavouriteVC: UIViewController {
    @IBOutlet weak var favouriteTableView: UITableView!
//    var ViewModel: FavouriteViewModel?
    var leaguesViewModel: LeagueViewModel?
    var favourit: [Favourite] = []
    var filterLeague : Country?
    
    var networkCheck = NetworkCheck.sharedInstance()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()

        favouriteTableView.delegate = self
        favouriteTableView.dataSource = self
        
        favouriteTableView.register(UINib(nibName: "LeaguesCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favourit =  DBManager.sharedInstanse.fetchData(appDelegate: appDelegate)

        self.favouriteTableView.reloadData()
    }
}



extension FavouriteVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourit.count
//        return ViewModel?.getLeagues()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favouriteTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesCell
        cell.nameLabel.text = favourit[indexPath.row].leagueName
        cell.leagueImage.sd_setImage(with: URL(string: favourit[indexPath.row].leagueImage ?? ""), completed: nil)
//        cell.setup(country: ViewModel?.getLeague(indexPath: indexPath))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if networkCheck.currentStatus == .unsatisfied{
            let alert = UIAlertController(title: "Warning!", message: "Please check your internet connection", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{

        
            let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = stoaryBoard.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsVC


            vc.viewModel = LeagueDeatilsViewModel(filterLeague: Country(favourite: favourit[indexPath.row]))
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        print("Deleted")
          DBManager.sharedInstanse.delete(league: favourit[indexPath.row], indexPath: indexPath, appDelegate: self.appDelegate, delegate: self)
        
        self.favouriteTableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
}

extension FavouriteVC:DeletionDelegate{
    func deleteLeagueById(indexPath: IndexPath) {
        favourit.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.favouriteTableView.reloadData()
        }
    }
    
   
    
    
}

