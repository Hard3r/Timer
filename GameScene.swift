//
//  GameScene.swift
//  Dota2Timers
//
//  Created by влад Богдан on 27.02.16.
//  Copyright (c) 2016 влад Богдан. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var startbut: SKNode! = nil;
    var settbut: SKNode! = nil;
    var mainbutt: SKNode! = nil;
    var infobut: SKNode! = nil;
    var Second: SKLabelNode! = nil;

    var count: Double! = 0;
    
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor.whiteColor();
        
        let background2 = SKSpriteNode(imageNamed: "dota2walpapaer");
        background2.position = CGPointMake(0, 0)
        background2.zPosition = 1;
        background2.anchorPoint = CGPointMake(0, 0)
        background2.setScale(0.8)
        //background2.yScale = 1.45
        //background2.xScale = 1.1
        self.addChild(background2);
        
        
        //Parent frame for buttons
        mainbutt = SKSpriteNode(imageNamed: "buttonframe")
        mainbutt.zPosition = 0;
        mainbutt.position = CGPointMake(self.frame.midX, self.frame.midY)
        self.addChild(mainbutt)
        
        
        
        //Start button
        startbut = SKSpriteNode(imageNamed: "startbutt")
        startbut.zPosition = 2;
        mainbutt.addChild(startbut)
        
        //Settings button
        settbut = SKSpriteNode(imageNamed: "settings.png")
        settbut.position = CGPointMake(70, -150)
        settbut.name = "SettignsButton"
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        settbut.runAction(SKAction.repeatActionForever(action))
        settbut.setScale(0.1)
        settbut.zPosition = 2;
        mainbutt.addChild(settbut)
        
        //Infobutton
        infobut = SKSpriteNode(imageNamed: "info")
        infobut.position = CGPointMake(-70, -150)
        infobut.name = "InfoButton"
        infobut.setScale(0.1)
        infobut.zPosition = 2;
        mainbutt.addChild(infobut)
        
        
    }
    
    

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
           // let location = touch.locationInNode(self)
            let locationbuttons = touch.locationInNode(mainbutt)
            
            if startbut.containsPoint(locationbuttons) {
                print("tapped! + Start")
                
                
                let transition:SKTransition = SKTransition.fadeWithDuration(1)
                let scene:SKScene = HeroScreen(size: self.size)
                scene.scaleMode = .AspectFill
                self.view?.presentScene(scene, transition: transition)
                
                
            } else if settbut.containsPoint(locationbuttons) {
                print("tapped! + Settings")
                startbut.alpha = 1;
            } else if infobut.containsPoint(locationbuttons) {
                print("tapped! + Info")
                startbut.alpha = 0;

            }
        }
    }
        
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    

    
}



