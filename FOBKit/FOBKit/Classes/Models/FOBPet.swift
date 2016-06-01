//
//  FOBPet.swift
//  Pods
//
//  Created by Sumesh John on 5/3/16.
//
//

import Foundation

public class FOBPet : NSObject, NSCoding {
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
    
    // MARK:- init
    required public init(name:String? = "No Name",
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
        
        super.init()
    }
    
    required convenience public init?(coder aDecoder:NSCoder) {
        let id = aDecoder.decodeObjectForKey("id") as! String
        let name = aDecoder.decodeObjectForKey("name") as! String
        let breed = aDecoder.decodeObjectForKey("breed") as! String
        let fullness = aDecoder.decodeFloatForKey("fullness") as! Float
        let happy = aDecoder.decodeIntegerForKey("happy") as! Int
        let hair = aDecoder.decodeIntegerForKey("hair") as! Int
        let hate = aDecoder.decodeIntegerForKey("hate") as! Int
        let height = aDecoder.decodeIntegerForKey("height") as! Int
        
        self.init(name: name,
                  breed: breed,
                  happy: happy,
                  hair: hate,
                  hate: hate,
                  height: height,
                  fullness: fullness)
    }
    
    // MARK:- public
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
    
    // MARK:- <NSCoding>
    public func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(breed, forKey: "breed")
        aCoder.encodeFloat(fullness, forKey: "fullness")
        aCoder.encodeInteger(happy, forKey: "happy")
        aCoder.encodeInteger(hair, forKey: "hair")
        aCoder.encodeInteger(hate, forKey: "hate")
        aCoder.encodeInteger(height, forKey: "height")
    }
}

// MARK:- <Equatable>
public func ==(lhs:FOBPet, rhs:FOBPet) -> Bool {
    return lhs.id == rhs.id
}

public func !=(lhs:FOBPet, rhs:FOBPet) -> Bool {
    return lhs.id != rhs.id
}