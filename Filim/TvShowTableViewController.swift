//
//  TvShowTableViewController.swift
//  Filim
//
//  Created by Akif on 12.08.2022.
//

import UIKit

class TvShowTableViewController: UITableViewController {
    
    var Results: [TvShow] = []
    
    var Result: PopularTvShows?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         //getPopularMovies(from: popularMoviesURL)
        loadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! TvShowDetailViewController
        guard let row = tableView.indexPathForSelectedRow?.row else {
            return
        }
        let tvShow = Results[row]
        viewController.tvShow = tvShow
    }
    
    private func loadData(){
        
            guard let jsonUrl = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1"), let data = try? Data(contentsOf: jsonUrl) else {
                 return
            }
            do {
                Result = try JSONDecoder().decode(PopularTvShows.self, from: data)
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
        // #warning Incomplete implementation, return the number of rows
        
        return Results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvcell", for: indexPath) as! TvShowTableViewCell
loadData()
        cell.prepareTvShow(tvShow: Results[indexPath.row])
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
