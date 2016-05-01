//
//  Pet.swift
//  Feed or Die
//
//  Created by Sumesh John on 5/1/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit
import Foundation

class Pet : NSObject {
    var picture: UIImage?
    var name: String!
    var breed: String!
    
    
    init(name: String? = "No name", breed: String? = "Unknown") {
        super.init()
        self.name = name
        self.breed = breed
    }
}