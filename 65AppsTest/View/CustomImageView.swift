//
//  CustomImageView.swift
//  65AppsTest
//
//  Created by Дмитрий Папушин on 22.01.2021.
//

import UIKit

let cache = NSCache<NSString, UIImage>()
let spiner = UIActivityIndicatorView(style: .medium)

class CustomImageView: UIImageView {
    
    func loadImage(with urlString: String) {
        
        image = nil
        
        addSpiner()
        
        let cacheKey = NSString(string: urlString)
        
        if let cachedImage = cache.object(forKey: cacheKey) {
            spiner.removeFromSuperview()
            self.image = cachedImage
            return
        }
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, res, err) in
            guard let self = self else {return}
            if let err = err {
                print("Failed to load image: ", err.localizedDescription)
                return
            }
            
            guard let imageData = data else {return}
            guard let loadedImage = UIImage(data: imageData) else {return}
            
            DispatchQueue.main.async {
                cache.setObject(loadedImage, forKey: cacheKey)
                self.image = loadedImage
                spiner.removeFromSuperview()
            }
        }.resume()
        
    }
    
    func addSpiner() {
        addSubview(spiner)
        spiner.fillSuperview()
        
        spiner.startAnimating()
    }
    
    func removeSpiner() {
        spiner.removeFromSuperview()
    }
    
}
