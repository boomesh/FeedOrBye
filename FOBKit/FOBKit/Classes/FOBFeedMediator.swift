//
//  FOBFeedMediator.swift
//  Pods
//
//  Created by Sumesh John on 5/11/16.
//
//

import Foundation

private let FEED_FACTOR:Float = 10.0

func feed(pet:FOBPet?) {
    guard let pet = pet where isAbleToFeed(pet) else {
        return
    }
    pet.addFullnessBy(FEED_FACTOR)
}

private func isAbleToFeed(pet:FOBPet?) -> Bool {
    guard let pet = pet where 0.0 < pet.fullnessProgress && pet.fullnessProgress <= 100.0 else {
        return false
    }
    
    return true
}