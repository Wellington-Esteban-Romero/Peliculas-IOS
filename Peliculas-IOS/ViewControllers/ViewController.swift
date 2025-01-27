//
//  ViewController.swift
//  Peliculas-IOS
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var list: [MovieResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        findMoviesByName(name: "joker")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieViewCell
        cell.render(movie: list[indexPath.item])
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            findMoviesByName(name: query)
        } else {
            findMoviesByName(name: "joker")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController =  segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let movie = list[indexPath.row]
        detailViewController.imdbID = movie.imdbID
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func findMoviesByName(name: String) {
        Task {
            do {
                list =  try await SearchProvider.findMoviesByName(name: name)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }


}

