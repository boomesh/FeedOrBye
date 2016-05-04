//
//  FOBPet.swift
//  Pods
//
//  Created by Sumesh John on 5/3/16.
//
//

import Foundation

public class FOBPet {
    public var name:String!
    public var breed:String!
    
    public init(name:String? = "No Name", breed:String? = "Unknown Breed") {
        self.name = name
        self.breed = breed
    }
}