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
    var lvl6cool: Int!
    var lvl11cool: Int!
    var lvl16cool: Int!
    
    //aghanimlvl cooldowns
    var lvl6agha: Int!
    var lvl11agha: Int!
    var lvl16agha: Int!
    
    init(uid: Int, name: String, ultiname: String, aghanim: Bool,
        lvl6cool: Int, lvl11cool: Int, lvl16cool: Int,
        lvl6agha: Int, lvl11agha: Int, lvl16agha: Int){
        
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