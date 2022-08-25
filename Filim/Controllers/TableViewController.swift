//
//  TableViewController.swift
//  Filim
//
//  Created by Akif on 18.08.2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch segmentedControlOutlet.selectedSegmentIndex {
        case 0:
            
            self.tableView.reloadData()
        case 1:
            
            self.tableView.reloadData()
        case 2:
            
            self.tableView.reloadData()
        default:
            break
        }
    }
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let service = NetworkingClient(baseUrl: "https://api.themoviedb.org/3/")
        service.getMovies(endPoint: "movie/popular?api_key=05f4a75f65729a8b5f38439876ea9c1a&language=en-US&page=1")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        return cell
    }

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
