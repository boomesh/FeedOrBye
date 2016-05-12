//
//  FOBKit.swift
//  Pods
//
//  Created by Sumesh John on 5/4/16.
//
//

import Foundation

private let starvationService:FOBStarvationService = FOBStarvationService()

private let listOfPets: Array<FOBPet> = [
    FOBPet(name: "Dogface", breed: "German Dog", fullness: MAX_FULLNESS),
    FOBPet(name: "Catface", breed: "Siamese Dog", fullness: MAX_FULLNESS),
    FOBPet(name: "Fishface", breed: "Aqua Dog", fullness: MAX_FULLNESS),
    FOBPet(breed: "pure evil", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy1", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy2", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy3", fullness: MAX_FULLNESS),
    FOBPet(name: "Gimpy4", fullness: MAX_FULLNESS)
]

private var watchingPets:Dictionary<String, FOBPet> = Dictionary<String, FOBPet>()

public func fetchAllPets(callback:((pets:Array<FOBPet>?) -> Void)?) {
    callback?(pets: listOfPets)
}

public func fetchWatchingPets(callback:((Dictionary<String, FOBPet>?) -> Void)?) {
    callback?(watchingPets)
}

public func isWatchingPet(pet:FOBPet?) -> Bool {
    guard let pet = pet where watchingPets[pet.id] != nil else {
        return false
    }
    return true
}

public func watchPet(pet:FOBPet?, observer:FOBPetFullnessObserver?) {
    guard let pet = pet else {
        return
    }
    
    watchingPets[pet.id] = pet
    starvationService.observer = observer
    starvationService.beginStarvation(pet)
}

public func unwatchPet(pet:FOBPet?) {
    guard let pet = pet else {
        return
    }
    
    watchingPets.removeValueForKey(pet.id)
    starvationService.pauseStarvation(pet)
}

public func feedPet(pet:FOBPet?) {
    feed(pet)
}