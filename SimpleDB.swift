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
        Tidehunter = Character(uid: 1, name: "Tidehunter", ultiname: "Ravage", aghanim: false, lvl6cool: 150, lvl11cool: 150, lvl16cool: 150, lvl6agha: 150, lvl11agha: 150, lvl16agha: 150);
        HeroSet.insert(Tidehunter);
        
        Enigma = Character(uid: 2, name: "Enigma", ultiname: "Black hole", aghanim: false, lvl6cool: 200, lvl11cool: 180, lvl16cool: 160, lvl6agha: 200, lvl11agha: 180, lvl16agha: 160);
        HeroSet.insert(Enigma);
        
        ChaosKnight = Character(uid: 3, name: "ChaosKnight", ultiname: "ChaosKnight", aghanim: false, lvl6cool: 140, lvl11cool: 140, lvl16cool: 140, lvl6agha: 140, lvl11agha: 140, lvl16agha: 140);
        HeroSet.insert(ChaosKnight);
        
        Doom = Character(uid: 4, name: "Doom", ultiname: "Doom", aghanim: false, lvl6cool: 125, lvl11cool: 125, lvl16cool: 125, lvl6agha: 125, lvl11agha: 125, lvl16agha: 125);
        HeroSet.insert(Doom);
        
        CentaurWarrunner = Character(uid: 5, name: "CentaurWarrunner", ultiname: "CentaurWarrunner", aghanim: false, lvl6cool: 90, lvl11cool: 75, lvl16cool: 60, lvl6agha: 90, lvl11agha: 75, lvl16agha: 60);
        HeroSet.insert(CentaurWarrunner);
        
        Brewmaster = Character(uid: 6, name: "Brewmaster", ultiname: "Brewmaster", aghanim: false, lvl6cool: 140, lvl11cool: 120, lvl16cool: 100, lvl6agha: 140, lvl11agha: 120, lvl16agha: 100);
        HeroSet.insert(Brewmaster);
        
        TreantProtector = Character(uid: 7, name: "TreantProtector", ultiname: "TreantProtector", aghanim: false, lvl6cool: 70, lvl11cool: 70, lvl16cool: 70, lvl6agha: 70, lvl11agha: 70, lvl16agha: 70);
        HeroSet.insert(TreantProtector);
        
        Magnus = Character(uid: 8, name: "Magnus", ultiname: "Magnus", aghanim: false, lvl6cool: 120, lvl11cool: 110, lvl16cool: 100, lvl6agha: 120, lvl11agha: 110, lvl16agha: 100);
        HeroSet.insert(Magnus);
        
        Earthshaker = Character(uid: 9, name: "Earthshaker", ultiname: "Earthshaker", aghanim: false, lvl6cool: 150, lvl11cool: 130, lvl16cool: 100, lvl6agha: 150, lvl11agha: 130, lvl16agha: 100);
        HeroSet.insert(Earthshaker);
        
        Omniknight = Character(uid: 10, name: "Omniknight", ultiname: "Omniknight", aghanim: false, lvl6cool: 150, lvl11cool: 150, lvl16cool: 150, lvl6agha: 150, lvl11agha: 150, lvl16agha: 150);
        HeroSet.insert(Omniknight);
        
        ShadowShaman = Character(uid: 11, name: "ShadowShaman", ultiname: "ShadowShaman", aghanim: false, lvl6cool: 120, lvl11cool: 120, lvl16cool: 120, lvl6agha: 120, lvl11agha: 120, lvl16agha: 120);
        HeroSet.insert(ShadowShaman);
        
        Chen = Character(uid: 12, name: "Chen", ultiname: "Chen", aghanim: false, lvl6cool: 160, lvl11cool: 140, lvl16cool: 120, lvl6agha: 160, lvl11agha: 140, lvl16agha: 120);
        HeroSet.insert(Chen);
        
        WitchDoctor = Character(uid: 13, name: "WitchDoctor", ultiname: "WitchDoctor", aghanim: false, lvl6cool: 80, lvl11cool: 80, lvl16cool: 80, lvl6agha: 80, lvl11agha: 80, lvl16agha: 80);
        HeroSet.insert(WitchDoctor);
        
        Warlock = Character(uid: 14, name: "Warlock", ultiname: "Warlock", aghanim: false, lvl6cool: 165, lvl11cool: 165, lvl16cool: 165, lvl6agha: 165, lvl11agha: 165, lvl16agha: 165);
        HeroSet.insert(Warlock);
        
        Lich = Character(uid: 15, name: "Lich", ultiname: "Lich", aghanim: false, lvl6cool: 120, lvl11cool: 90, lvl16cool: 60, lvl6agha: 120, lvl11agha: 90, lvl16agha: 60);
        HeroSet.insert(Lich);
        
        Venomancer = Character(uid: 16, name: "Venomancer", ultiname: "Venomancer", aghanim: true, lvl6cool: 140, lvl11cool: 120, lvl16cool: 100, lvl6agha: 140, lvl11agha: 120, lvl16agha: 60);
        HeroSet.insert(Venomancer);
        
        Bane = Character(uid: 17, name: "Bane", ultiname: "Bane", aghanim: false, lvl6cool: 100, lvl11cool: 100, lvl16cool: 100, lvl6agha: 100, lvl11agha: 100, lvl16agha: 100);
        HeroSet.insert(Bane);
        
        Puck = Character(uid: 18, name: "Puck", ultiname: "Puck", aghanim: false, lvl6cool: 75, lvl11cool: 75, lvl16cool: 75, lvl6agha: 75, lvl11agha: 75, lvl16agha: 75);
        HeroSet.insert(Bane);
        
        Devouver = Character(uid: 19, name: "Devouver", ultiname: "Devouver", aghanim: false, lvl6cool: 160, lvl11cool: 160, lvl16cool: 160, lvl6agha: 160, lvl11agha: 160, lvl16agha: 160);
        HeroSet.insert(Devouver);
        
        DarkSeer = Character(uid: 20, name: "DarkSeer", ultiname: "DarkSeer", aghanim: false, lvl6cool: 100, lvl11cool: 100, lvl16cool: 100, lvl6agha: 100, lvl11agha: 100, lvl16agha: 100);
        HeroSet.insert(DarkSeer);
        
        Spectre = Character(uid: 21, name: "Spectre", ultiname: "Spectre", aghanim: false, lvl6cool: 120, lvl11cool: 120, lvl16cool: 120, lvl6agha: 120, lvl11agha: 120, lvl16agha: 120);
        HeroSet.insert(Spectre);
    }
    
    
}