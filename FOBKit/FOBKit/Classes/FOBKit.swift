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
    FOBPet(name: "Dogface", breed: "German Dog"),
    FOBPet(name: "Catface", breed: "Siamese Dog"),
    FOBPet(name: "Fishface", breed: "Aqua Dog"),
    FOBPet(breed: "pure evil"),
    FOBPet(name: "Gimpy1"),
    FOBPet(name: "Gimpy2"),
    FOBPet(name: "Gimpy3"),
    FOBPet(name: "Gimpy4")
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