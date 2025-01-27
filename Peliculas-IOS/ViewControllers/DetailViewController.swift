//
//  DetailViewController.swift
//  justicieLeague
//
//  Created by Tardes on 8/1/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var contryLabel: UILabel!
    
    var movie: MovieResponse!
    var imdbID: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        findMovieByImdbID(id: imdbID)
    }
    
    func findMovieByImdbID(id: String) {
        Task {
            do {
                movie =  try await SearchProvider.findMovieByImdbID(id: id)
                DispatchQueue.main.async {
                    self.loadMovie()
                }
            } catch {
                print(error)
            }
        }
    }
    
    func loadMovie() {
        titleLabel.text = movie.title
        imageView.loadFrom(url: movie.poster)
        yearLabel.text = movie.year
        plotLabel.text = movie.plot
        runtimeLabel.text = movie.runtime
        directorLabel.text = movie.director
        genreLabel.text = movie.genre
        contryLabel.text = movie.country
    }
}
