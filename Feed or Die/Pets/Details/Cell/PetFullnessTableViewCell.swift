//
//  PetFullnessTableViewCell.swift
//  Feed or Bye
//
//  Created by Sumesh John on 5/11/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit

class PetFullnessTableViewCell: UITableViewCell {

    @IBOutlet private weak var fullnessSlider: UISlider!
    
    func setFullnessProgress (progress:Float!) {
        self.fullnessSlider.value = Float(progress)
    }
}
