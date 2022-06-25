//
//  LeagueDetailsVC.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 20/06/2022.
//

import UIKit

class LeagueDetailsVC: UIViewController {
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    @IBOutlet weak var resultsCollectionView: UICollectionView!
    @IBOutlet weak var teamCollectionView: UICollectionView!
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    var viewModel: LeagueDeatilsViewModel!
    var team = [Teams]()
    var isSelect = false
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    var league: Country?
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        league?.idLeague = viewModel.filterLeague.idLeague
//        league?.strLeague = viewModel.filterLeague.strLeague
//        print(league?.idLeague)
        for i in DBManager.sharedInstanse.fetchData(appDelegate: appDelegate.self){
            if i.leagueId == viewModel.filterLeague.idLeague{
                isSelect = true
                favButton.tintColor = .red
                
            }
        }
        
        
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        resultsCollectionView.delegate = self
        resultsCollectionView.dataSource = self
        teamCollectionView.delegate = self
        teamCollectionView.dataSource = self
       
        upcomingCollectionView.register(UINib(nibName: "UpcomingCell", bundle: nil), forCellWithReuseIdentifier: "cell")
//        resultsCollectionView.register(UINib(nibName: "ResultsCell", bundle: nil), forCellWithReuseIdentifier: "resultCell")
        
        resultsCollectionView.register(UINib(nibName: "ResultsCell", bundle: nil), forCellWithReuseIdentifier: "resultCell")
        
        teamCollectionView.register(UINib(nibName: "TeamsCell", bundle: nil), forCellWithReuseIdentifier: "teamCell")
        
        
        viewModel.fetchResults()
        viewModel.fetchTeams()
        navBar.topItem?.title = viewModel.filterLeague.strLeague ?? ""
        viewModel.bindingResult = { results, error in
            DispatchQueue.main.async {
                self.resultsCollectionView.reloadData()
                self.upcomingCollectionView.reloadData()
            }
        
        if let error = error{
            print(error.localizedDescription)
        }
    }
        viewModel.bindingData = { teams, error in
            DispatchQueue.main.async {
                self.teamCollectionView.reloadData()
            }
        
        if let error = error{
            print(error.localizedDescription)
        }
    }
      

        
    }
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func favouriteButton(_ sender: UIBarButtonItem) {
        if isSelect == false{
//            favButton.isSelected = true
            DBManager.sharedInstanse.addLeague(appDelegate: self.appDelegate, id: viewModel.filterLeague.idLeague ?? "", leagueName: viewModel.filterLeague.strLeague ?? "", leagueImage: viewModel.filterLeague.strBadge ?? "", leagueVideo: viewModel.filterLeague.strYoutube ?? "")
            favButton.tintColor = .red
            isSelect = true
//            favButton.isSelected = true
        }else{
            favButton.isSelected = false
        }
        
    }
    
}

extension LeagueDetailsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == upcomingCollectionView{
            return viewModel.getResults()?.count ?? 0
        }else if collectionView == resultsCollectionView{
            return viewModel.getResults()?.count ?? 0
        }else {
            return viewModel.getTeams()?.count ?? 0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == upcomingCollectionView{
            let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingCell
            cell.setup(event: viewModel.getResult(indexPath: indexPath))
            return cell
        }else if collectionView == resultsCollectionView{
            let cell = resultsCollectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultsCell
            cell.setup(results: viewModel.getResult(indexPath: indexPath))
            return cell
        }else {
            let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamsCell
            cell.setup(team: viewModel.getTeam(indexPath: indexPath))
            return cell
        }
        
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == upcomingCollectionView{
            return CGSize(width: 300 , height: 140)
        }else if collectionView == resultsCollectionView{
            return CGSize(width: 350 , height: 160)
        }else{
            return CGSize(width: 200 , height: 150)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamCollectionView{
            let selectedItem = viewModel.teamArray?[indexPath.row]
                // to do: to go to leagues
            let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
                let vc = stoaryBoard.instantiateViewController(withIdentifier: "TeamsVC") as! TeamsVC
                
                vc.viewModel = TeamViewModel(filterTeam: selectedItem!)
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true, completion: nil)

            
        }else{return}
    }
}
