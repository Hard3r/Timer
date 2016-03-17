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
    
    var iconID: String!
    
    var ulti6: Int!
    var ulti11: Int!
    var ulti16: Int!
    
    var aghanim: Bool!
    var octarine: Bool!
    
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
    
    init() {
    super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, iconID: String) {
       super.init(texture: texture, color: color, size: size)
        self.iconID = iconID;
        self.anchorPoint = CGPointMake(0, 0)
        initchilds()
    }
    
    
    func initchilds() {
        
        icon = SKSpriteNode(imageNamed: iconID)
        icon.position = CGPointMake(0, 0)
        icon.anchorPoint = CGPointMake(0, 0)
        icon.zPosition = 4;
        icon.name = "Icon"
        self.addChild(icon)
        
        labelframe = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.width / 2 - icon.frame.width, icon.frame.height / 2))
        labelframe.anchorPoint = CGPointMake(0, 0)
        labelframe.position = CGPointMake(icon.frame.width, icon.frame.height / 2)
        self.addChild(labelframe)
        label = SKLabelNode(text: "\(0)")
        label.name = "Timer"
        label.position = CGPointMake(labelframe.frame.width / 2, labelframe.frame.height / 2)
        labelframe.addChild(label)
        
        levelframe = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(self.frame.width / 2 - icon.frame.width, icon.frame.height / 2))
        levelframe.anchorPoint = CGPointMake(0, 0)
        levelframe.position = CGPointMake(icon.frame.width, 0)
        levelframe.name = "levelframe"
        self.addChild(levelframe)
        
        level6 = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeMake(levelframe.size.width / 3, levelframe.size.height))
        level6.anchorPoint = CGPointMake(0, 0)
        level6.position = CGPointMake(0, 0)
        level6.name = "level6"
        levelframe.addChild(level6)
        
        level11 = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(levelframe.size.width / 3, levelframe.size.height))
        level11.anchorPoint = CGPointMake(0, 0)
        level11.position = CGPointMake(level6.frame.width, 0)
        level11.name = "level11"
        levelframe.addChild(level11)
        
        level16 = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake(levelframe.size.width / 3, levelframe.size.height))
        level16.anchorPoint = CGPointMake(0, 0)
        level16.position = CGPointMake(level6.frame.width * 2, 0)
        level16.name = "level16"
        levelframe.addChild(level16)
        
        level6 = SKSpriteNode(color: UIColor.greenColor(), size: CGSizeMake(levelframe.size.width / 3, levelframe.size.height))
        level6.anchorPoint = CGPointMake(0, 0)
        level6.position = CGPointMake(0, 0)
        level6.name = "level6"
        levelframe.addChild(level6)
        
        start = SKSpriteNode(imageNamed: "startbutt")
        start.size = CGSizeMake(self.frame.width / 4, self.frame.height)
        start.position = CGPointMake(icon.frame.width + levelframe.frame.width, 0)
        start.anchorPoint = CGPointMake(0, 0)
        start.name = "start"
        self.addChild(start)
        
        reset = SKSpriteNode(imageNamed: "info")
        reset.size = CGSizeMake(self.frame.width / 4, self.frame.height)
        reset.position = CGPointMake(icon.frame.width + levelframe.frame.width + start.frame.width, 0)
        reset.anchorPoint = CGPointMake(0, 0)
        self.addChild(reset)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}