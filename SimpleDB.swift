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
    var ChaosKnight: Character!;
    var Doom: Character!;
    var CentaurWarrunner: Character!;
    var Brewmaster: Character!;
    var TreantProtector: Character!;
    var Magnus: Character!;
    var Earthshaker: Character!;
    var Omniknight: Character!;
    var ShadowShaman: Character!;
    var Chen: Character!;
    var WitchDoctor: Character!;
    var Warlock: Character!;
    var Lich: Character!;
    var Venomancer: Character!;
    var Bane: Character!;
    var Puck: Character!;
    var Devouver: Character!;
    var DarkSeer: Character!;
    var Spectre: Character!;

    
    init() {
        Tidehunter = Character(uid: 1, name: "Tidehunter", ultiname: "Ravage", aghanim: false, lvl6cool: 6, lvl11cool: 11, lvl16cool: 16, lvl6agha: 12, lvl11agha: 22, lvl16agha: 32);
        HeroSet.insert(Tidehunter);
        
        Enigma = Character(uid: 2, name: "Enigma", ultiname: "Black hole", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Enigma);
        
        ChaosKnight = Character(uid: 3, name: "ChaosKnight", ultiname: "ChaosKnight", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(ChaosKnight);
        
        Doom = Character(uid: 4, name: "Doom", ultiname: "Doom", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Doom);
        
        CentaurWarrunner = Character(uid: 5, name: "CentaurWarrunner", ultiname: "CentaurWarrunner", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(CentaurWarrunner);
        
        Brewmaster = Character(uid: 6, name: "Brewmaster", ultiname: "Brewmaster", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Brewmaster);
        
        TreantProtector = Character(uid: 7, name: "TreantProtector", ultiname: "TreantProtector", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(TreantProtector);
        
        Magnus = Character(uid: 8, name: "Magnus", ultiname: "Magnus", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Magnus);
        
        Earthshaker = Character(uid: 9, name: "Earthshaker", ultiname: "Earthshaker", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Earthshaker);
        
        Omniknight = Character(uid: 10, name: "Omniknight", ultiname: "Omniknight", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Omniknight);
        
        ShadowShaman = Character(uid: 11, name: "ShadowShaman", ultiname: "ShadowShaman", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(ShadowShaman);
        
        Chen = Character(uid: 12, name: "Chen", ultiname: "Chen", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Chen);
        
        WitchDoctor = Character(uid: 13, name: "WitchDoctor", ultiname: "WitchDoctor", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(WitchDoctor);
        
        Warlock = Character(uid: 14, name: "Warlock", ultiname: "Warlock", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Warlock);
        
        Lich = Character(uid: 15, name: "Lich", ultiname: "Lich", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Lich);
        
        Venomancer = Character(uid: 16, name: "Venomancer", ultiname: "Venomancer", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Venomancer);
        
        Bane = Character(uid: 17, name: "Bane", ultiname: "Bane", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Bane);
        
        Puck = Character(uid: 18, name: "Puck", ultiname: "Puck", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Bane);
        
        Devouver = Character(uid: 19, name: "Devouver", ultiname: "Devouver", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Devouver);
        
        DarkSeer = Character(uid: 20, name: "DarkSeer", ultiname: "DarkSeer", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(DarkSeer);
        
        Spectre = Character(uid: 21, name: "Spectre", ultiname: "Spectre", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Spectre);
    }
    
    
}