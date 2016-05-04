//
//  PetDetailsViewController.swift
//  Feed or Die
//
//  Created by Sumesh John on 4/28/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit
import FOBKit

class PetDetailsViewController: UIViewController {
    var pet:FOBPet!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = pet.name
    }
    
}
