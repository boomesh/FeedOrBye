//
//  TodayViewController.swift
//  Feed Or Bye Widget
//
//  Created by Sumesh John on 5/1/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit
import NotificationCenter
import FOBKit


class TodayViewController: UIViewController, NCWidgetProviding {
    
    private var pet:FOBPet?
    
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        FOBKit.fetchWatchingPets { [weak self](pets:Array<FOBPet>?) in
            self?.pet = pets?.last
            self?.configureWidgetForPet(self?.pet)
        }
        
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        if ((self.pet) != nil) {
            self.configureWidgetForPet(self.pet)
            completionHandler(NCUpdateResult.NewData)
        } else {
            completionHandler(NCUpdateResult.NoData)
        }
    }
    
    // MARK:- Helper
    func configureWidgetForPet(pet:FOBPet?) {
        guard let pet:FOBPet = pet else {
            return
        }
        
        self.progressSlider.value =  FOBKit.getFullnessProgress(pet)
        self.name.text = pet.name
    }
}
