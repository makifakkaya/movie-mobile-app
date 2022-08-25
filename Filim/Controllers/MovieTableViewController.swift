//
//  MovieTableViewController.swift
//  Filim
//
//  Created by Akif on 11.08.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class MovieTableViewController: UITableViewController {
    
    var myMovieResults: [Movie] = []
    var myMovieDetails: [MovieCredits] = []
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl)  {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            getMovies(tab: 0)
        case 1:
            getMovies(tab: 1)
        case 2:
            getMovies(tab: 2)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMovies(tab: 0)
    }
    
    func getMovies(tab: Int)  {
        switch tab{
        case 0:
            API.getPopularMovies { myMovies in
                self.myMovieResults = myMovies.results
                self.myMovieDetails.removeAll()
                for movie in self.myMovieResults {
                    API.getMovieDetails(id: movie.id) { movieCredit in
                        self.myMovieDetails.append(movieCredit)
                    }
                }
                self.tableView.reloadData()
                
            }
        case 1:
            API.getNowPlayingMovies { myMovies in
                self.myMovieResults = myMovies.results
                self.myMovieDetails.removeAll()
                for movie in self.myMovieResults {
                    API.getMovieDetails(id: movie.id) { movieCredit in
                        self.myMovieDetails.append(movieCredit)
                    }
                }
                self.tableView.reloadData()
            }
        case 2:
            API.getTopRatedMovies { myMovies in
                self.myMovieResults = myMovies.results
                self.myMovieDetails.removeAll()
                for movie in self.myMovieResults {
                    API.getMovieDetails(id: movie.id) { movieCredit in
                        self.myMovieDetails.append(movieCredit)
                    }
                }
                self.tableView.reloadData()
            }
        default:
            return
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myMovieResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell", for: indexPath) as! MovieTableViewCell
        cell.prepareMovie(movie: myMovieResults[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! MovieDetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {
            return
        }
        let movie = myMovieResults[row]
        viewController.movie = movie
        viewController.movieCast = myMovieDetails[row].cast
    }
}
