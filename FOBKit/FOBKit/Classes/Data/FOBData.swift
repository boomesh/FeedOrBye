//
//  File.swift
//  Pods
//
//  Created by Sumesh John on 5/25/16.
//
//

import Foundation

class FOBData {
    
    static let sharedInstance = FOBData()
    
    //expect to crash if shared defaults not configured properly
    private let sharedDefaults:NSUserDefaults! = NSUserDefaults(suiteName: "group.boomesh.FeedOrByExtensionSharingDefaults")
    
    private let kWatchedPetsKey:String = "WATCHED_PETS_KEY"
    
    // MARK:- init
    private init() {
        //cannot initialize manually
    }
    
    func putWatchedPet(pet:FOBPet?) {
        var pets:Array<FOBPet>
        
        guard let pet:FOBPet = pet else {
            return
        }
        
        if let petsArray:Array<FOBPet> = getWatchedPets() {
            pets = petsArray
        } else {
            pets = []
        }
        
        pets.append(pet)
        
        let archivedPets = NSKeyedArchiver.archivedDataWithRootObject(pets as Array<FOBPet>)
        sharedDefaults.setObject(archivedPets, forKey: kWatchedPetsKey)
        sharedDefaults.synchronize()
    }
    
    func getWatchedPets() -> Array<FOBPet>? {
        guard let unarchivedObject:NSData = sharedDefaults.objectForKey(kWatchedPetsKey) as? NSData,
            let pets:Array<FOBPet> = NSKeyedUnarchiver.unarchiveObjectWithData(unarchivedObject) as? Array<FOBPet>
            where pets.count > 0 else {
                return nil
        }
        
        return pets
    }
    
    func updateWatchedPet(pet:FOBPet?) {
        deleteWatchedPet(pet)
        putWatchedPet(pet)
    }
    
    func deleteWatchedPet(pet:FOBPet?) {
        guard let pet:FOBPet = pet else {
            return
        }
        
        guard var pets:Array<FOBPet> = getWatchedPets() else {
            return
        }
        
        pets = pets.filter({$0 != pet})
        
        sharedDefaults.removeObjectForKey(kWatchedPetsKey)
        
        let archivedPets = NSKeyedArchiver.archivedDataWithRootObject(pets as Array<FOBPet>)
        sharedDefaults.setObject(archivedPets, forKey: kWatchedPetsKey)
        sharedDefaults.synchronize()
    }
}