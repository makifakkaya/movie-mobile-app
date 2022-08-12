//
//  MovieTableViewController.swift
//  Filim
//
//  Created by Akif on 11.08.2022.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var currentURL: String = "https://api.themoviedb.org/3/movie/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            currentURL = "https://api.themoviedb.org/3/movie/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"
            loadData()
            self.tableView.reloadData()
        case 1:
            currentURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"
            loadData()
            self.tableView.reloadData()
        case 2:
            currentURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"
            loadData()
            self.tableView.reloadData()
        default:
            break
        }
    }
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    
    var Results: [Movie] = []
    var Result: PopularMovies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! MovieDetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {
            return
        }
        let movie = Results[row]
        viewController.movie = movie
    }
    
    
    private func loadData(){
            guard let jsonUrl = URL(string: currentURL), let data = try? Data(contentsOf: jsonUrl) else {
                 return
            }
            do {
                Result = try JSONDecoder().decode(PopularMovies.self, from: data)
                Results = Result!.results
            } catch  {
                print(error.localizedDescription)
            }
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell", for: indexPath) as! MovieTableViewCell
        cell.prepareMovie(movie: Results[indexPath.row])
        return cell
    }

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! DetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {
            return
        }
        let movie = popularMoviesResultElements[row]
        viewController.movie = movie
    }*/

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
