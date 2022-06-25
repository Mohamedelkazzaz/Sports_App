//
//  LeaguesVC.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//

import UIKit

class LeaguesVC: UIViewController {

    @IBOutlet weak var leagueTableView: UITableView!
    var leaguesViewModel: LeagueViewModel!
    var league = [Country]()
    var titles = ""
//    var sport: Sports!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = titles

        leagueTableView.delegate = self
        leagueTableView.dataSource = self
        leagueTableView.sectionIndexBackgroundColor = UIColor.black

        
        leagueTableView.register(UINib(nibName: "LeaguesCell", bundle: nil), forCellReuseIdentifier: "cell")
//        leaguesViewModel.viewController = self
        leaguesViewModel.fetchLeagues()
        leaguesViewModel.bindingData = { leagues, error in
                DispatchQueue.main.async {
                    self.leagueTableView.reloadData()
                }
            
            if let error = error{
                print(error.localizedDescription)
            }
        }
        
    }
    
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension LeaguesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leaguesViewModel.getLeagues()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesCell
        cell.setup(country: leaguesViewModel.getLeague(indexPath: indexPath))
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        leaguesViewModel.didSelect(indexPath: indexPath)
        
        let selectedItem = leaguesViewModel.leagueArray?[indexPath.row]
            // to do: to go to leagues
        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = stoaryBoard.instantiateViewController(withIdentifier: "LeagueDetailsVC") as! LeagueDetailsVC
            vc.viewModel = LeagueDeatilsViewModel(filterLeague: selectedItem!)
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
