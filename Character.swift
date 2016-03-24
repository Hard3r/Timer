//
//  Character.swift
//  Dota2Timers
//
//  Created by влад Богдан on 22.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import Foundation

class Character: Hashable {
    
    var uid: Int;
    
    var hashValue: Int {
        return self.uid
    }
    
    //charname
    var name: String!
    
    //ultimate name
    var ultiname: String!
    
    //aghanim
    var aghanim: Bool!
    
    //simple lvl cooldowns
    var lvl6cool: Double!
    var lvl11cool: Double!
    var lvl16cool: Double!
    
    //aghanimlvl cooldowns
    var lvl6agha: Double!
    var lvl11agha: Double!
    var lvl16agha: Double!
    
    init(uid: Int, name: String, ultiname: String, aghanim: Bool,
        lvl6cool: Double, lvl11cool: Double, lvl16cool: Double,
        lvl6agha: Double, lvl11agha: Double, lvl16agha: Double){
        
            self.uid = uid;
            
            self.name = name;
            self.ultiname = ultiname;
            
            self.aghanim = aghanim;
            
            self.lvl6cool = lvl6cool;
            self.lvl11cool = lvl11cool;
            self.lvl16cool = lvl16cool;
            
            self.lvl6agha = lvl6agha;
            self.lvl11agha = lvl11agha;
            self.lvl16agha = lvl16agha;
    }
    
}

func ==(lhs: Character, rhs: Character) -> Bool {
    return lhs.uid == rhs.uid
}