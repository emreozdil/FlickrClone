//
//  PostTableViewCell.swift
//  Flickr Clone
//
//  Created by Emre Özdil on 24/04/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet var userProfilephoto: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var photoDate: UILabel!
    @IBOutlet var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
