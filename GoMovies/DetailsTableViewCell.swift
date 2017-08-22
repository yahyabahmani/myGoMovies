//
//  DetailsTableViewCell.swift
//  GoMovies
//
//  Created by zafre MAD on 5/29/1396 AP.
//  Copyright © 1396 AP zafre MADzafre. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var directorLabel2: UILabel!
    @IBOutlet var directorLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var carbonViews: UIView!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var genres: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var mediumImage: UIImageView!
    @IBOutlet var bannerImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
