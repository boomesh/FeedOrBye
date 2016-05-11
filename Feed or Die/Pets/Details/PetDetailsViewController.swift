//
//  PetDetailsViewController.swift
//  Feed or Die
//
//  Created by Sumesh John on 4/28/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit
import FOBKit

class PetDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FOBPetFullnessObserver {
    
    @IBOutlet private weak var detailsTableView: UITableView!
    @IBOutlet private weak var watchButton: UIBarButtonItem!
    
    var pet:FOBPet!
    
    // MARK:- Life Cycle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = pet.name
        refreshWatchingState()
    }
    
    // MARK:- IBAction
    @IBAction func onFeedTouchUpInside(sender: AnyObject) {
        FOBKit.feedPet(pet)
    }
    
    @IBAction func onWatchTouchUpInside(sender: AnyObject) {
        if (FOBKit.isWatchingPet(pet)) {
            FOBKit.unwatchPet(pet)
        } else {
            FOBKit.watchPet(pet, observer: self)
        }
        refreshWatchingState()
    }
    
    // MARK:- private methods
    private func refreshWatchingState() {
        self.watchButton.title = FOBKit.isWatchingPet(pet) ? "Unwatch" : "Watch"
    }
    
    // MARK:- <UITableViewDelegate>
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier:String!
        switch (indexPath.row, indexPath.section) {
        case (_, 0):
            identifier = "fullness"
            break;
        case (_, 1...2):
            identifier = "info_detail"
            break;
        default:
            identifier = nil
        }
        return tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.row, indexPath.section) {
        case (0,0) :
            guard let cell:PetFullnessTableViewCell = cell as? PetFullnessTableViewCell else {
                return
            }
            
            cell.setFullnessProgress(self.pet.fullnessProgress)
            break;
        case (0,1):
            cell.textLabel?.text = "Breed"
            cell.detailTextLabel?.text = pet.breed
            break;
        case (0, 2):
            cell.textLabel?.text = "Happy"
            cell.detailTextLabel?.text = String(pet.happy)
            break;
        case (1, 2):
            cell.textLabel?.text = "Hair"
            cell.detailTextLabel?.text = String(pet.hair)
            break;
        case (2, 2):
            cell.textLabel?.text = "Hate"
            cell.detailTextLabel?.text = String(pet.hate)
            break;
        case (3, 2):
            cell.textLabel?.text = "Height"
            cell.detailTextLabel?.text = String(pet.height)
            break;
        default:
            break;
        }
    }
    
    // MARK:- <UITableViewDataSource>
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 2 ? 4 : 1;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case 0:
            return "Fullness"
        case 1:
            return "Info"
        case 2:
            return "Stats"
        default:
            return ""
        }
    }
    
    // MARK:- <FOBPetFullnessObserver>
    func fullnessUpdated(pet: FOBPet!) {
        print("\(pet.name) fullness is \(pet.fullnessProgress)")
        self.detailsTableView.reloadData()
    }
    
    func sayGoodbye(pet: FOBPet!) {
        print("\(pet.name) has went to a farm...")
    }
}
