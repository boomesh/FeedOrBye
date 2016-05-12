//
//  FOBStarvationService.swift
//  Pods
//
//  Created by Sumesh John on 5/8/16.
//
//

import Foundation

public protocol FOBPetFullnessObserver {
    func fullnessUpdated(pet:FOBPet!)
    func sayGoodbye(pet:FOBPet!)
}

class FOBStarvationService {
    
    private let STARVATION_FACTOR:Float = 10.0
    
    private var currentPet:FOBPet? = FOBPet()
    private var currentTimer:NSTimer?;
    
    var observer:FOBPetFullnessObserver?
    
    func beginStarvation(pet:FOBPet?) {
        guard let pet:FOBPet = pet where pet != self.currentPet else {
            return
        }
        
        let duration:NSTimeInterval = 2.0
        
        self.currentPet = pet
        self.currentTimer = NSTimer.scheduledTimerWithTimeInterval(duration,
                                                                   target: self,
                                                                   selector: #selector(FOBStarvationService.updateTick),
                                                                   userInfo: nil,
                                                                   repeats: true);
        self.currentTimer?.fire()
    }
    
    func pauseStarvation(pet:FOBPet?) {
        guard let pet:FOBPet = pet where pet == self.currentPet else {
            return
        }
        
        currentTimer?.invalidate()
        currentTimer = nil
        currentPet = nil
    }
    
    // TODO: unsure why #selector() needs the @objc annotation
    @objc private func updateTick() {
        guard let pet:FOBPet = currentPet else {
            return
        }
        
        guard getFullnessProgress(pet) > 0.0 else {
            pauseStarvation(pet)
            self.observer?.sayGoodbye(pet)
            return
        }
        
        pet.subtractFullnessBy(STARVATION_FACTOR)
        self.observer?.fullnessUpdated(pet)
    }
}