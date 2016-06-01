//
//  FOBKit.swift
//  Pods
//
//  Created by Sumesh John on 5/4/16.
//
//

import Foundation

private let starvationService:FOBStarvationService = FOBStarvationService()

private var watchingPet:FOBPet?

private let dataLayer:FOBData = FOBData.sharedInstance;

private let listOfPets: Array<FOBPet> =
[
    FOBPet(name: "Dogface", breed: "German Dog", fullness: MAX_FULLNESS),
    FOBPet(name: "Catface", breed: "Siamese Dog", fullness: MAX_FULLNESS),
    FOBPet(name: "Fishface", breed: "Aqua Dog", fullness: MAX_FULLNESS),
    FOBPet(breed: "pure evil", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy1", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy2", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy3", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy4", fullness: MAX_FULLNESS)
]

public func fetchAllPets(callback:((pets:Array<FOBPet>?) -> Void)?) {
    callback?(pets: listOfPets)
}

public func fetchWatchingPets(callback:((Array<FOBPet>?) -> Void)?) {
    callback?(dataLayer.getWatchedPets())
}

public func isWatchingPet(pet:FOBPet?) -> Bool {
    guard let pet = pet where dataLayer.getWatchedPets()?.filter({$0 == pet}).count > 0 else {
        return false
    }
    return true
}

public func watchPet(pet:FOBPet?) {
    guard let pet = pet where !isWatchingPet(pet) else {
        return
    }
    
    unwatchPet(watchingPet)
    dataLayer.putWatchedPet(pet)
    starvationService.beginStarvation(pet)
}

public func unwatchPet(pet:FOBPet?) {
    guard let pet = pet where isWatchingPet(pet) else {
        return
    }

    starvationService.pauseStarvation(pet)
    dataLayer.deleteWatchedPet(pet)
}

public func feedPet(pet:FOBPet?) {
    feed(pet)
}