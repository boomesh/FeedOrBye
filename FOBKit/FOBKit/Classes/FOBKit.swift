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
    FOBPet(name: "Fishface", breed: "Aqua Dog")
]

func fetchPets(callback:((pets:Array<FOBPet>) -> ())?) {
    callback?(pets: listOfPets)
}