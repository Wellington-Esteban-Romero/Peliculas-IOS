//
//  UIImageExtensions.swift
//  justicieLeague
//
//  Created by Tardes on 7/1/25.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.sync {
                        self?.image  = image
                    }
                }
            }
        }
    }
    
    func loadFrom (url: String) {
        self.loadFrom(url: URL(string: url)!)
    }
    
    
}
