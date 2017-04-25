//
//  ApiOperation.swift
//  Flickr Clone
//
//  Created by Emre Özdil on 24/04/2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import Foundation
import UIKit

let apiKey = "25ea84a2ecde6066158c58d9d3ab1267"
var photoIds = [String]()

class ApiOperation {
    
    func getRecent(){
        
        let apiMethod = "flickr.photos.getRecent"
        
        let url = URL(string: "https://api.flickr.com/services/rest/?method=" + apiMethod + "&api_key=" + apiKey + "&format=json&nojsoncallback=1")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                if let urlContent = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        let photosContainer = jsonResult["photos"] as? NSDictionary
                        let photosArray = photosContainer?["photo"] as? [NSDictionary]
                        for photo in photosArray! {
                            let photoId = photo["id"] as! String
                            photoIds.append(photoId)
                            self.getImageInfo(id: photoId)
                        }
                        
                    }
                    catch {
                        print("JSON Proccesing Failed")
                    }
                    
                }
            }
        }
        task.resume()
    }
    func getImageInfo(id: String){

        let apiMethod = "flickr.photos.getInfo"
        let url = URL(string: "https://api.flickr.com/services/rest/?method=" + apiMethod + "&api_key=" + apiKey + "&photo_id=" + id + "&format=json&nojsoncallback=1")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
            }
            else {
                if let urlContent = data {
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        print(jsonResult)
                        let photoInfo = jsonResult["photo"] as? NSDictionary
                        let ownerInfo = photoInfo?["owner"] as? NSDictionary
                        let datesInfo = photoInfo?["dates"] as? NSDictionary
                        let secret = photoInfo?["secret"] as! String
                        let server = photoInfo?["server"] as! String
                        let farm = photoInfo?["farm"] as! Int
                        let nsid = ownerInfo?["nsid"] as! String
                        let realname = ownerInfo?["realname"] as! String
                        let iconserver = ownerInfo?["iconserver"] as! String
                        let iconfarm = ownerInfo?["iconfarm"] as! Int
                        let rawDates = datesInfo?["taken"] as! String
                        let dates = String(describing: rawDates) + " +0000"
                        let flickrPhoto = FlickrPhoto(photoId: id, nsid: nsid, farm: farm, iconfarm: iconfarm, secret: secret, server: server, iconserver: iconserver, realname: realname, dates: dates)
                        photos.append(flickrPhoto)
                    }
                    catch {
                        print("JSON Proccesing Failed")
                    }
                    
                }
            }
        }
        task.resume()
    }
}

