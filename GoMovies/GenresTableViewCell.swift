//
//  GenresTableViewCell.swift
//  GoMovies
//
//  Created by zafre MAD on 5/26/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//

import UIKit

class GenresTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet var nameLabel: UILabel!

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var filmImage: UIImageView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var genresLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
