//
//  ViewController.swift
//  Feed or Die
//
//  Created by Sumesh John on 4/28/16.
//  Copyright © 2016 Boomesh Bohn. All rights reserved.
//

import UIKit

class PetListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK:- IBOutlets
    @IBOutlet weak var petsTableView: UITableView!

    // MARK:- private vars
    let pets: Array<Pet> = [
        Pet(name: "Dogface", breed: "German Dog"),
        Pet(name: "Catface", breed: "Siamese Dog"),
        Pet(name: "Fishface", breed: "Aqua Dog")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK:- <UITableViewDataSource>
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = self.petsTableView.dequeueReusableCellWithIdentifier("pet_list_item", forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK:- <UITableViewDelegate>
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let row: Int = indexPath.row
        
        if let cell: PetListItemTableViewCell = cell as? PetListItemTableViewCell {
            cell.title = pets[row].name
            cell.detail = pets[row].breed
        }
    }
    
    // MARK:- <UIViewController> methods
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc : UIViewController = segue.destinationViewController
        
        if let vc : PetDetailsViewController = vc as? PetDetailsViewController {
            let row : Int = self.petsTableView.indexPathForSelectedRow!.row
            vc.pet = pets[row]
        }
    }
}

