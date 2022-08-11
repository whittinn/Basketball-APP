//
//  ImageService.swift
//  Example
//
//  Created by Nathaniel Whittington on 8/10/22.
//

import Foundation
import UIKit

class ImageService{
    
    static let shared = ImageService()
     let cache = NSCache<NSString, UIImage>()
    func downloadImage(with url:URL, completion: @escaping (_ image: UIImage?)->()){
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            var downloadedImage: UIImage?
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            
            if downloadedImage != nil{
                self.cache.setObject(downloadedImage ?? UIImage(), forKey: url.absoluteString as NSString)
            }
            
            DispatchQueue.main.async {
                completion(downloadedImage)
            }
        }.resume()
    }
    
    func getImage(with url:URL, completion:@escaping (_ image:UIImage?)->()){
        
      
        if let image = cache.object(forKey: url.absoluteString as NSString){
            completion(image)
        }else{
            downloadImage(with: url, completion: completion)
        }
    }
}
