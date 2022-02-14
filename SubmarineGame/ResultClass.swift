//
//  RecordsClass.swift
//  SubmarineGame
//
//  Created by Serhii Kopytchuk on 13.02.2022.
//

import Foundation

class Result: Codable{
    
    var name: String
    var score: Int
    
    init(name:String, score:Int){
        self.name = name
        self.score = score
    }
    
    enum CodingKeys:String, CodingKey {
        //we can change only names
        case name, score
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.score = try container.decode(Int.self, forKey: .score)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.name, forKey: .name)
        try container.encode(self.score, forKey: .score)

        
    }
}
