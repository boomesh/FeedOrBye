//
//  ViewController.swift
//  Feed or Die
//
//  Created by Sumesh John on 4/28/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit
import FOBKit

class PetListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK:- IBOutlets
    @IBOutlet weak var petsTableView: UITableView!
    
    // MARK:- Life cycle methods
    var pets:Array<FOBPet>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FOBKit.fetchAllPets { [weak self] (pets) in
            self?.pets = pets
            self?.petsTableView.reloadData()
        }
    }
    
    // MARK:- <UITableViewDataSource>
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pets?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.petsTableView.dequeueReusableCellWithIdentifier("pet_list_item", forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK:- <UITableViewDelegate>
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let row: Int = indexPath.row
        
        guard let pet:FOBPet = pets?[row] else {
            return;
        }
        
        if let cell: PetListItemTableViewCell = cell as? PetListItemTableViewCell {
            cell.title = pet.name
            cell.detail = pet.breed
        }
    }
    
    //I don't know why I need to do this to deselect the row
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
    }
    
    // MARK:- <UIViewController> methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let row:Int = self.petsTableView.indexPathForSelectedRow?.row else {
            return
        }
        
        guard let pet:FOBPet = pets?[row] else {
            return
        }
        
        guard let vc : UIViewController = segue.destinationViewController else {
            return
        }
        
        if let vc : PetDetailsViewController = vc as? PetDetailsViewController {
            vc.pet = pet
        }
    }
}

