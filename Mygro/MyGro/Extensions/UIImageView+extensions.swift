//
//  UIImageView+extensions.swift
//  MyGro
//
//  Created by Emil Sandström on 2017-09-06.
//  Copyright © 2017 Emil Sandström. All rights reserved.
//

import Foundation
import AlamofireImage

extension UIImageView {
    
    func setImage(with url: URL,
                  placeholderImage: UIImage? = nil,
                  transition: ImageTransition = .noTransition,
                  completion: ((_ image: UIImage?)->Void)? = nil) {
        if !Reachability.isConnectedToNetwork() {
            if let image = UIImage(named: "noConnection") {
                completion?(image)
            }
            return
        }
        
        if let completion = completion {
            af_setImage(withURL: url,
                        placeholderImage: placeholderImage,
                        filter: nil,
                        progress: nil,
                        imageTransition: transition,
                        runImageTransitionIfCached: false,
                        completion: { response in
                            if let data = response.data {
                                let image = UIImage(data: data)
                                completion(image)
                            } else {
                                completion(nil)
                            }
            })
        } else {
            af_setImage(withURL: url)
        }
    }
    
    func cancelImageRequest() {
        af_cancelImageRequest()
    }
}
