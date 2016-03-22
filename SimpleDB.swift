//
//  SimpleDB.swift
//  Dota2Timers
//
//  Created by влад Богдан on 22.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import Foundation

//Stupid....i mean simple DB 
class SimpleDB {
    
    var HeroSet: Set<Character> = [];
    
    var Tidehunter: Character!;
    var Enigma: Character!;
    
    init() {
        Tidehunter = Character(uid: 1, name: "Tidehunter", ultiname: "Ravage", aghanim: true, lvl6cool: 6, lvl11cool: 11, lvl16cool: 16, lvl6agha: 12, lvl11agha: 22, lvl16agha: 32);
        HeroSet.insert(Tidehunter);
        
        Enigma = Character(uid: 2, name: "Enigma", ultiname: "Black hole", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Enigma);
    }
    
    
}