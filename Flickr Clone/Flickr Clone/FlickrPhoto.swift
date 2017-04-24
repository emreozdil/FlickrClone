//
//  FlickrPhoto.swift
//  Flickr Clone
//
//  Created by Emre Özdil on 24/04/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhoto {
    var photoId: String = ""
    var nsid: String = ""
    var farm: Int = 0
    var iconfarm: Int = 0
    var secret: String = ""
    var server: String = ""
    var iconserver: String = ""
    var realname: String = ""
    var dates: String = ""
    var profilePhoto: UIImage? = nil
    var photo: UIImage? = nil
    init(photoId: String, nsid: String, farm: Int, iconfarm: Int, secret: String, server: String, iconserver: String, realname: String, dates: String) {
        self.photoId = photoId
        self.nsid = nsid
        self.farm = farm
        self.iconfarm = iconfarm
        self.secret = secret
        self.server = server
        self.iconserver = iconserver
        self.realname = realname
        self.dates = dates
        
        /*
        let urlProfilePhoto = URL(string: "https://farm" + farm + ".staticflickr.com/" + server + "/" + photoId + "_" + secret + "_n.jpg")!
        let requestProfilePhoto = NSMutableURLRequest(url: urlProfilePhoto)
        let taskProfilePhoto = URLSession.shared.dataTask(with: requestProfilePhoto as URLRequest) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                if let data = data {
                    if let profilePhoto = UIImage(data: data) {
                        self.profilePhoto = profilePhoto
                    }
                }
                
            }
        }
        taskProfilePhoto.resume()
        let urlPhoto = URL(string: "https://farm" + iconfarm + ".staticflickr.com/" + iconserver + "/buddyicons/" + nsid + ".jpg")!
        let requestPhoto = NSMutableURLRequest(url: urlPhoto)
        
        let taskPhoto = URLSession.shared.dataTask(with: requestPhoto as URLRequest) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                if let data = data {
                    if let photo = UIImage(data: data) {
                        self.photo.image = photo
                    }
                }
                
            }
        }
        taskPhoto.resume()
    */
    }
    /*
    var photoUrl: String {
        return "https://farm" + farm + ".staticflickr.com/" + server + "/" + photoId + "_" + secret + "_n.jpg"
    }
    var profilePhotoUrl: String {
        return "https://farm" + iconfarm + ".staticflickr.com/" + iconserver + "/buddyicons/" + nsid + ".jpg"
    }
     */
}
