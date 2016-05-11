//
//  PetListItemTableViewCell.swift
//  Feed or Die
//
//  Created by Sumesh John on 5/1/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit

class PetListItemTableViewCell: UITableViewCell {

    //TODO:- create an extension of tableviewcell that spits out the identifier
    
    // MARK:- IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    // MARK:- public variables
    // MARK: getters/setters
    /// Fetch the <UIImage> attached to the cell.
    var avatarImage: UIImage? {
        get {
            return self.avatarImageView.image
        }
        
        set {
            self.avatarImageView.image = newValue
        }
    }
    
    /// Fetch the title <String> associated with the cell
    var title: String? {
        get {
            return self.titleLabel.text
        }
        
        set {
            self.titleLabel.text = newValue
        }
    }
    
    /// Fetch the detail <String> associated with the cell
    var detail: String? {
        get {
            return self.detailLabel.text
        }
        
        set {
            self.detailLabel.text = newValue
        }
    }
}
