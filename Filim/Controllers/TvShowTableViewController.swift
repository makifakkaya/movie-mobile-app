//
//  TvShowTableViewController.swift
//  Filim
//
//  Created by Akif on 12.08.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class TvShowTableViewController: UITableViewController {
    
    var myTvShowResults: [TvShow] = []
    var myTvShowDetails: [TvShowCredits] = []
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            getTvShows(tab: 0)
        case 1:
            getTvShows(tab: 1)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTvShows(tab: 0)
    }
    
    func getTvShows(tab: Int)  {
        switch tab{
        case 0:
            API.getPopularTvShows{ myTvShows in
                self.myTvShowResults = myTvShows.results
                self.myTvShowDetails.removeAll()
                for movie in self.myTvShowResults {
                    API.getTvShowDetails(id: movie.id) { tvShowCredit in
                        self.myTvShowDetails.append(tvShowCredit)
                    }
                }
                self.tableView.reloadData()
            }
        case 1:
            API.getTopRatedTvShows{ myTvShows in
                self.myTvShowResults = myTvShows.results
                self.myTvShowDetails.removeAll()
                for movie in self.myTvShowResults {
                    API.getTvShowDetails(id: movie.id) { tvShowCredit in
                        self.myTvShowDetails.append(tvShowCredit)
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
        return myTvShowResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvcell", for: indexPath) as! TvShowTableViewCell
        cell.prepareTvShow(tvShow: myTvShowResults[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! TvShowDetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {
            return
        }
        let tvShow = myTvShowResults[row]
        viewController.tvShow = tvShow
        viewController.tvShowCast = myTvShowDetails[row].cast
    }
}
