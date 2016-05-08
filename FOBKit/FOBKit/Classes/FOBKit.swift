//
//  FOBKit.swift
//  Pods
//
//  Created by Sumesh John on 5/4/16.
//
//

import Foundation

private let listOfPets: Array<FOBPet> = [
    FOBPet(name: "Dogface", breed: "German Dog"),
    FOBPet(name: "Catface", breed: "Siamese Dog"),
    FOBPet(name: "Fishface", breed: "Aqua Dog"),
    FOBPet(breed: "pure evil"),
    FOBPet(name: "Gimpy1"),
    FOBPet(name: "Gimpy2"),
    FOBPet(name: "Gimpy3"),
    FOBPet(name: "Gimpy4"),
]

public func fetchPets(callback:((pets:Array<FOBPet>) -> Void)?) {
    callback?(pets: listOfPets)
}