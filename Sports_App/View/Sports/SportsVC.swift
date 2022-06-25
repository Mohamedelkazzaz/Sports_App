//
//  SportsVC.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 19/06/2022.
//


import UIKit
import SDWebImage

class SportsVC: UIViewController {
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    var sportsViewModel: SportsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportsViewModel = SportsViewModel(navigation: self.navigationController!)
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        
        sportsCollectionView.register(UINib(nibName: "SportsCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        
        sportsViewModel.fetchSports(endPoint: "all_sports.php")
        sportsViewModel.bindingData = { sports, error in
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                }
            
            if let error = error{
                print(error.localizedDescription)
            }
        }
        
        
    }
    
}

extension SportsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsViewModel.getSports()?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SportsCell
        
        
        cell.setup(sport: sportsViewModel.getSport(indexPath: indexPath))
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: (view.frame.size.width - 20) / 2 , height: 165)

        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        sportsViewModel.didSelect(indexPath: indexPath)
         let selectedItem = sportsViewModel.sportArray?[indexPath.row]
            // to do: to go to leagues
        let stoaryBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = stoaryBoard.instantiateViewController(withIdentifier: "LeaguesVC") as! LeaguesVC
//            vc.sport = selectedItem
        vc.leaguesViewModel = LeagueViewModel(filterSport: selectedItem!)
        vc.titles = sportsViewModel.sportArray?[indexPath.row].strSport ?? ""
        navigationController?.pushViewController(vc, animated: true)
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true, completion: nil)
        
    
}

}
