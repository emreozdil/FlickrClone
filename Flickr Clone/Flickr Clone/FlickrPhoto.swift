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
        var photoUrl: String {
            return String("https://farm\(farm).staticflickr.com/\(server)/\(photoId)_\(secret)_m.jpg")!
        }
        let urlPhoto = URL(string: photoUrl)!
        
        let requestPhoto = NSMutableURLRequest(url: urlPhoto)
        
        let taskPhoto = URLSession.shared.dataTask(with: requestPhoto as URLRequest) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                if let data = data {
                    if let tempPhoto = UIImage(data: data) {
                        self.photo = tempPhoto
                    }
                }
                
            }
        }
        taskPhoto.resume()

        var profilePhotoUrl: String {
            return String("https://farm\(iconfarm).staticflickr.com/\(iconserver)/buddyicons/\(nsid).jpg")!
            
        }
        let urlProfilePhoto = URL(string: profilePhotoUrl)!
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
    }
    
    func timeAgoSinceDate(numericDates:Bool = false) -> String {
        let dateStringUTC = self.dates
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss X"
        let date = dateFormatter.date(from: dateStringUTC)!
        
        let calendar = NSCalendar.current
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let earliest = now < date ? now : date
        let latest = (earliest == now) ? date : now
        let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
        
        if (components.year! >= 2) {
            return "\(components.year!) years ago"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year ago"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months ago"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month ago"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks ago"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week ago"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days ago"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day ago"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours ago"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour ago"
            } else {
                return "An hour ago"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes ago"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute ago"
            } else {
                return "A minute ago"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds ago"
        } else {
            return "Just now"
        }
    }
}
