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
    var infolabel: SKLabelNode!;

    var count: Double! = 0;
    
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor.whiteColor();
        
      //  let background2 = SKSpriteNode(imageNamed: "dota2walpapaer");
        let background2 = SKSpriteNode(imageNamed: "Background");
        background2.size = CGSizeMake(self.frame.width, self.frame.height);
        background2.position = CGPointMake(0, 0)
        background2.zPosition = 1;
        background2.anchorPoint = CGPointMake(0, 0)

        self.addChild(background2);
        
        
        //Parent frame for buttons
        mainbutt = SKSpriteNode(imageNamed: "buttonframe")
        mainbutt.zPosition = 0;
        mainbutt.position = CGPointMake(self.frame.midX, self.frame.midY)
        self.addChild(mainbutt)
        
        
        
        //Start button
        startbut = SKSpriteNode(imageNamed: "PlayText")
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
        //mainbutt.addChild(settbut)
        
        //Infobutton
        infobut = SKSpriteNode(imageNamed: "question")
        infobut.position = CGPointMake(-70, -150)
        infobut.name = "Info"
        infobut.setScale(0.2);
        infobut.zPosition = 2;
        mainbutt.addChild(infobut)
        
        //Infolabel
        infolabel = SKLabelNode();
        infolabel.text = "Press START \n then choose heroes and win Dota";
        infolabel.fontSize = 20;
        infolabel.fontName = "Optima-ExtraBlack";
        infolabel.fontColor = UIColor.whiteColor();
        infolabel.position = CGPointMake(mainbutt.frame.midX, mainbutt.frame.midY + mainbutt.frame.height);
        infolabel.zPosition = 10;
        infolabel.alpha = 0;
        self.addChild(infolabel);
        
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
                
                if infolabel.alpha == 1 {
                    infolabel.alpha = 0;
                } else {
                    infolabel.alpha = 1;
                }

            }
        }
    }
        
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}



