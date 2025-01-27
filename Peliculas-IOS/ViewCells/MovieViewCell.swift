//
//  SuoerheroViewCell.swift
//  justicieLeague
//
//  Created by Tardes on 7/1/25.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func render(movie:MovieResponse) {
        nameLabel.text = movie.title
        yearLabel.text = movie.year
        avatarImageView.loadFrom(url: movie.poster)
    }

}
