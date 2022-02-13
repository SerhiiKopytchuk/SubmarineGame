//
//  SettingsClass.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 13.02.2022.
//

import Foundation
import UIKit

class Settings: Codable{
    
    var image: Int
    var name: String
    var reloadMissiles: Bool
    var reloadOxygen: Bool
    var missilesOnStart: Int
    
    init (image:Int, name:String, reloadMissiles:Bool, reloadOxygen:Bool, missilesOnStart:Int){
        self.image = image
        self.name = name
        self.reloadMissiles = reloadMissiles
        self.reloadOxygen = reloadOxygen
        self.missilesOnStart = missilesOnStart
    }
    
    enum CodingKeys:String, CodingKey {
        //we can change only names
        case image, name, reloadMissiles, reloadOxygen, missilesOnStart
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.image = try container.decode(Int.self, forKey: .image)
        self.name = try container.decode(String.self, forKey: .name)
        self.reloadMissiles = try container.decodeIfPresent(Bool.self, forKey: .reloadMissiles) ?? true
        self.reloadOxygen = try container.decodeIfPresent(Bool.self, forKey: .reloadOxygen) ?? true
        self.missilesOnStart = try container.decode(Int.self, forKey: .missilesOnStart)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.image, forKey: .image)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.reloadMissiles, forKey: .reloadMissiles)
        try container.encode(self.reloadOxygen, forKey: .reloadOxygen)
        try container.encode(self.missilesOnStart, forKey: .missilesOnStart)
        
    }
}

