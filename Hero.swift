//
//  ParentSprite.swift
//  Dota2Timers
//
//  Created by влад Богдан on 17.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import Foundation
import SpriteKit

class Hero: SKSpriteNode {
    
    var seconds: Int = 0
    
    //Hero name
    var iconID: String!
    
    //Levels
    var ulti6: Int!
    var ulti11: Int!
    var ulti16: Int!
    
    var isStarted: Bool = false
    
    
    
    //Check for aghanim and octarine
    var aghanim: Bool = true
    var octarine: Bool!
    
    //Main sprites
    var icon: SKSpriteNode!
    var label: SKLabelNode!
    var labelframe: SKSpriteNode!
    var levelframe: SKSpriteNode!
    var level6: SKSpriteNode!
    var level11: SKSpriteNode!
    var level16: SKSpriteNode!
    var scepter: SKSpriteNode!
    var core: SKSpriteNode!
    var start: SKSpriteNode!
    var reset: SKSpriteNode!
    var skill: SKSpriteNode!
    
    init() {
    super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, iconID: String, aghanim: Bool) {
       super.init(texture: texture, color: color, size: size)
        self.iconID = iconID;
        self.aghanim = aghanim
        self.anchorPoint = CGPointMake(0, 0)
        initchilds()
    }
    
    
    func initchilds() {
        
        //Hero icon
        icon = SKSpriteNode(imageNamed: iconID)
        icon.position = CGPointMake(0, icon.frame.height)
        icon.anchorPoint = CGPointMake(0, 0)
        icon.zPosition = 4;
        icon.name = "Icon"
        self.addChild(icon)
        
        
        //Timer
        labelframe = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 7, icon.frame.height))
        labelframe.anchorPoint = CGPointMake(0, 0)
        labelframe.position = CGPointMake(icon.position.x + icon.frame.width, icon.frame.height)
        self.addChild(labelframe)
        label = SKLabelNode(text: "\(0)")
        label.name = "Timer"
        label.fontSize = 100
        label.position = CGPointMake(labelframe.frame.width / 2, labelframe.frame.height / 2 - label.frame.height / 2)
        labelframe.addChild(label)
        
        
        //Agha
        scepter = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 6, icon.frame.height))
        scepter.anchorPoint = CGPointMake(0, 0)
        scepter.name = "Aghanim"
        scepter.position = CGPointMake(icon.frame.width + labelframe.frame.width, icon.frame.height)
        
        //Octarine
        core = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 6, icon.frame.height))
        core.anchorPoint = CGPointMake(0, 0)
        core.name = "Octarine"
        core.position = CGPointMake(scepter.position.x + scepter.frame.width, icon.frame.height)
        
        //Start timer button
        start = SKSpriteNode(imageNamed: "startbutt")
        start.size = CGSizeMake((self.frame.width - icon.frame.width) / 3, icon.frame.height)
        start.position = CGPointMake(core.position.x + core.frame.width, icon.frame.height)
        start.anchorPoint = CGPointMake(0, 0)
        start.name = "Start"
        
        //Reset timer button
        reset = SKSpriteNode(imageNamed: "info")
        reset.size = CGSizeMake((self.frame.width - icon.frame.width) / 5, icon.frame.height)
        reset.position = CGPointMake(start.position.x + start.frame.width - 10, icon.frame.height)
        reset.anchorPoint = CGPointMake(0, 0)
        reset.name = "Reset"
        
        
        //Check for aghanim
        if aghanim {
            self.addChild(scepter)
            self.addChild(core)
            self.addChild(start)
            self.addChild(reset)
        } else {
            core.size = CGSizeMake((self.frame.width - icon.frame.width - label.frame.width) / 5, icon.frame.height)
            core.position = CGPointMake(labelframe.position.x + labelframe.frame.width, icon.frame.height)
            self.addChild(core)
            start.size = CGSizeMake((self.frame.width - icon.frame.width - label.frame.width) / 2, icon.frame.height)
            start.position = CGPointMake(core.position.x + core.frame.width, icon.frame.height)
            self.addChild(start)
            reset.size = CGSizeMake((self.frame.width - icon.frame.width - label.frame.width) / 5, icon.frame.height)
            reset.position = CGPointMake(start.position.x + start.frame.width, icon.frame.height)
            self.addChild(reset)
        }
        
        //Skill sprite
        let skilltexture: String = "skill_" + iconID;
        skill = SKSpriteNode(imageNamed: skilltexture)
        skill.size = CGSizeMake(icon.frame.width, icon.frame.height)
        
        //Frame for 3 lvl buttons
        levelframe = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(self.frame.width, icon.frame.height))
        levelframe.anchorPoint = CGPointMake(0, 0)
        levelframe.position = CGPointMake(0, 0)
        levelframe.name = "Levelframe"
        //self.addChild(levelframe)
        
        
        skill.anchorPoint = CGPointMake(0, 0)
        skill.position = CGPointMake(0, 0)
        skill.name = "Skill"
        self.addChild(skill)
        
        level6 = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake((levelframe.size.width - skill.frame.width) / 3, levelframe.size.height))
        level6.anchorPoint = CGPointMake(0, 0)
        level6.position = CGPointMake(skill.position.x + skill.frame.width, 0)
        level6.name = "Level6"
        self.addChild(level6)
        
        level11 = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake((levelframe.size.width - skill.frame.width) / 3, levelframe.size.height))
        level11.anchorPoint = CGPointMake(0, 0)
        level11.position = CGPointMake(level6.position.x + level6.frame.width, 0)
        level11.name = "Level11"
        self.addChild(level11)
        
        level16 = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake((levelframe.size.width - skill.frame.width) / 3, levelframe.size.height))
        level16.anchorPoint = CGPointMake(0, 0)
        level16.position = CGPointMake(level11.position.x + level11.frame.width, 0)
        level16.name = "Level16"
        self.addChild(level16)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}