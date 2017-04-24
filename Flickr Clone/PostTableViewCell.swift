//
//  PostTableViewCell.swift
//  Flickr Clone
//
//  Created by Emre Özdil on 24/04/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var userProfilePicture: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var pictureDate: UILabel!
    @IBOutlet var picture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
