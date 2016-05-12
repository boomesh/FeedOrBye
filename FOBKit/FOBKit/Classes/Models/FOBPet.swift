//
//  FOBPet.swift
//  Pods
//
//  Created by Sumesh John on 5/3/16.
//
//

import Foundation

public class FOBPet : Equatable {
    public var id:String!
    public var name:String! {
        didSet {
            // TODO: uniquely identify pets via some other attribute, not just name
            self.id = self.name
        }
    }
    
    public var breed:String!
    
    public private(set) var fullness:Float!
    
    public var happy:Int!
    public var hair:Int!
    public var hate:Int!
    public var height:Int!
    
    public init(name:String? = "No Name",
                breed:String? = "Unknown Breed",
                happy:Int? = 0,
                hair:Int? = 0,
                hate:Int? = 0,
                height:Int? = 0,
                fullness:Float? = 0) {
        // TODO: uniquely identify pets via some other attribute, not just name
        self.id = name
        self.name = name
        self.breed = breed
        self.happy = happy
        self.hair = hair
        self.hate = hate
        self.height = height
        self.fullness = fullness
    }
    
    public func subtractFullnessBy(subtrahend:Float?) {
        guard let subtrahend = subtrahend else {
            return
        }
        self.fullness = self.fullness - subtrahend
    }
    
    public func addFullnessBy(addend:Float?) {
        guard let addend = addend else {
            return
        }
        self.fullness = self.fullness + addend
    }
}

public func ==(lhs:FOBPet, rhs:FOBPet) -> Bool {
    return lhs.id == rhs.id
}