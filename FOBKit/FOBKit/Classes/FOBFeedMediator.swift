//
//  FOBFeedMediator.swift
//  Pods
//
//  Created by Sumesh John on 5/11/16.
//
//

import Foundation

let MAX_FULLNESS:Float! = 100.0

private let FEED_FACTOR:Float = 10.0

public func getFullnessProgress(pet:FOBPet?) -> Float! {
    guard let pet = pet where pet.fullness >= 0.0 else {
        return 0.0
    }
    return pet.fullness / MAX_FULLNESS
}

func feed(pet:FOBPet?) {
    guard let pet = pet where isAbleToFeed(pet) else {
        return
    }
    pet.addFullnessBy(FEED_FACTOR)
}

public func isAbleToFeed(pet:FOBPet?) -> Bool {
    guard let pet = pet, let progress = getFullnessProgress(pet) where 0.0 < progress && progress <= 1.0 else {
        return false
    }
    return true
}