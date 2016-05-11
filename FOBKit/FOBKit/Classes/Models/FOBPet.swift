//
//  FOBPet.swift
//  Pods
//
//  Created by Sumesh John on 5/3/16.
//
//

import Foundation

public class FOBPet : Equatable {
    private let MAX_FULLNESS:Float! = 100.0
    
    public var id:String!
    public var name:String! {
        didSet {
            // TODO: uniquely identify pets via some other attribute, not just name
            self.id = self.name
        }
    }
    
    public var breed:String!
    
    public var fullnessProgress:Float! {
        get {
            guard self.fullness >= 0.0 else {
                return 0.0
            }
            return self.fullness / MAX_FULLNESS
        }
    }
    
    private var fullness:Float!
    
    public var happy:Int!
    public var hair:Int!
    public var hate:Int!
    public var height:Int!
    
    public init(name:String? = "No Name",
                breed:String? = "Unknown Breed",
                happy:Int? = 0,
                hair:Int? = 0,
                hate:Int? = 0,
                height:Int? = 0) {
        // TODO: uniquely identify pets via some other attribute, not just name
        self.id = name
        self.name = name
        self.breed = breed
        self.happy = happy
        self.hair = hair
        self.hate = hate
        self.height = height
        self.fullness = MAX_FULLNESS
    }
    
    public func subtractFullnessBy(subtractor:Float?) {
        guard let subtractor = subtractor else {
            return
        }
        self.fullness = self.fullness - subtractor
    }
}

public func ==(lhs:FOBPet, rhs:FOBPet) -> Bool {
    return lhs.id == rhs.id
}