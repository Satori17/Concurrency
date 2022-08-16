//
//  ViewController.swift
//  S.Kh_Task_23
//
//  Created by Saba Khitaridze on 16.08.22.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK: - Vars
    let semaphore = DispatchSemaphore(value: 1)
    let backgroundQueue = DispatchQueue.global()
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundQueue.async {
            self.semaphore.wait()
            self.fetchTVShows()
        }
        
        backgroundQueue.async {
            self.semaphore.wait()
            self.fetchSimilarTVShows()
        }
        
        backgroundQueue.async {
            self.semaphore.wait()
            self.FetchTVShowDetails()
        }
    }
    
    //MARK: - Methods
    
    func fetchTVShows() {
        Fetcher.shared.fetchData(withBuilder: TVShowUrlBuilder.shared, as: TVShowData.self) { result in
            switch result {
            case .success(let tvShows):
                SimilarTVShowUrlBuilder.tvShowId = tvShows.results.randomElement()?.id
                self.semaphore.signal()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchSimilarTVShows() {
        Fetcher.shared.fetchData(withBuilder: SimilarTVShowUrlBuilder.shared, as: TVShowData.self) { result in
            switch result {
            case .success(let tvShows):
                TVShowDetailUrlBuilder.tvShowDetailId = tvShows.results.randomElement()?.id
                self.semaphore.signal()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func FetchTVShowDetails() {
        Fetcher.shared.fetchData(withBuilder: TVShowDetailUrlBuilder.shared, as: TVShowDetails.self) { result in
            switch result {
            case .success(let tvShow):
                print("Name:", tvShow.name,"|", "episodes:", tvShow.numberOfEpisodes)
                self.semaphore.signal()
            case .failure(let error):
                print(error)
            }
        }
    }
}





/*
 
 actor TVShow {
     
     var tvShowInfo: (name: String, numberOfEpisodes: Int)?
     
         func getInfo() -> (name: String, numberOfEpisodes: Int)? {
             guard let info = tvShowInfo else { return nil }
             return info
         }
     
     func fetchTVShows() async {
         Fetcher.shared.fetchData(withBuilder: TVShowUrlBuilder.shared, as: TVShowData.self) { result in
             switch result {
             case .success(let tvShows):
                 SimilarTVShowUrlBuilder.tvShowId = tvShows.results.randomElement()?.id
                 //self.fetchSimilarTVShows()
             case .failure(let error):
                 print(error)
             }
         }
     }
     
     func fetchSimilarTVShows() async {
         Fetcher.shared.fetchData(withBuilder: SimilarTVShowUrlBuilder.shared, as: TVShowData.self) { result in
             switch result {
             case .success(let tvShows):
                 TVShowDetailUrlBuilder.tvShowDetailId = tvShows.results.randomElement()?.id
                 print(tvShows.results[0].name!)
             case .failure(let error):
                 print(error)
             }
         }
     }
     
     //    func FetchTVShowDetails() async {
     //        Fetcher.shared.fetchData(withBuilder: TVShowDetailUrlBuilder.shared, as: TVShowDetails.self) { result in
     //            switch result {
     //            case .success(let tvShow):
     //                self.tvShowInfo?.name = tvShow.name
     //                self.tvShowInfo?.numberOfEpisodes = tvShow.numberOfEpisodes
     //            case .failure(let error):
     //                print(error)
     //            }
     //        }
     //    }
     
 }
 
 */
