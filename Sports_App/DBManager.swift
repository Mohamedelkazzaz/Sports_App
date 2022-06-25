//
//  DBManager.swift
//  Sports_App
//
//  Created by Mohamed Elkazzaz on 23/06/2022.
//

import Foundation
import CoreData

protocol DeletionDelegate{
    func deleteLeagueById(indexPath: IndexPath)
}

class DBManager{
    static let sharedInstanse = DBManager()
    private init(){}
}

extension DBManager{

    func addLeague(appDelegate: AppDelegate,id: String,leagueName: String,leagueImage: String,leagueVideo: String){
        /*
         Steps to save data to an entity in core data:
            1- get the shared application delegate
            2- get the managed object context
            3- get the required entity using the name of the entity and the managed context
            4- Create a movie in the managed context using the NSManagedObject
            5- Set the values of the attributes of the current record
            6- try saving the object using the managedContext
            7- handle the error using do and catch
         */

        let managedContext = appDelegate.persistentContainer.viewContext

        //if there is an entity called "Movie" then a value returns otherwise, it would be nil
        if let entity = NSEntityDescription.entity(forEntityName: "Favourite", in: managedContext){

            let league = NSManagedObject(entity: entity, insertInto: managedContext)
            league.setValue(id, forKey: "leagueId")
            league.setValue(leagueName, forKey: "leagueName")
            league.setValue(leagueImage, forKey: "leagueImage")
            league.setValue(leagueVideo, forKey: "leagueVideo")
//            league.setValue(isSelect, forKey: "isSelect")
            do {
                try managedContext.save()
            }catch let error as NSError {
                print("Error in saving")
                print(error.localizedDescription)
            }
        }
    }

    func fetchData(appDelegate: AppDelegate) -> [Favourite]{
        /*
         Steps to save data to an entity in core data:
            1- get the shared application delegate
            2- get the managed object context
            3- Create the Fetch Request using th eentity Name and the NSManagedObject
            4- Add Predicate as a condition for fetching the data (optional)
            5- set the predicate of the fetchRequet with your predicate
            6- try fetching the records that have the predicate by  managedContext
            7- handle the error using do and catch

         */

        var fetchedList : [Favourite] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Favourite")

        do{
            fetchedList = try managedContext.fetch(fetchRequest) as! [Favourite]
        }catch let error as NSError {
            print("Error in saving")
            print(error.localizedDescription)
        }

        return fetchedList
    }

    func delete(league:Favourite, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){
        /*
         Steps to save data to an entity in core data:
            1- get the shared application delegate
            2- get the managed object context
            3- delete the required movie
            4- try saving the deletion change by managedContext
            5- handle the error using do and catch
         */

        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(league)
        do{
            try managedContext.save()
            delegate.deleteLeagueById(indexPath: indexPath)
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
}

