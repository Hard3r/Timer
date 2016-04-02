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
    var help: SKSpriteNode!;
    var close: SKSpriteNode!;
    
    var count: Double! = 0;
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor.grayColor();
        
        let background2 = SKSpriteNode(imageNamed: "Background");
        background2.size = CGSizeMake(self.frame.width / 2 + 100, self.frame.height);
        background2.position = CGPointMake(self.frame.midX, self.frame.midY);
        background2.zPosition = 1;
        background2.anchorPoint = CGPointMake(0.5, 0.5);
        self.addChild(background2);
        
        help = SKSpriteNode(imageNamed: "Helpscreen");
        help.position = CGPointMake(background2.frame.midX, background2.frame.midY);
        help.size = CGSizeMake(background2.size.width * 0.9, background2.size.height);
        help.zPosition = 10;
        help.name = "Help";
        help.alpha = 0;
        self.addChild(help);
        
        //Parent frame for buttons
        mainbutt = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(100, 100));
        mainbutt.zPosition = 0;
        mainbutt.position = CGPointMake(self.frame.midX, self.frame.midY);
        self.addChild(mainbutt);
        
        
        
        //Start button
        startbut = SKSpriteNode(imageNamed: "PlayText")
        startbut.zPosition = 2;
        mainbutt.addChild(startbut)
        
      
        
        //Infobutton
        infobut = SKSpriteNode(imageNamed: "question");
        infobut.position = CGPointMake(0, -150);
        infobut.name = "Info";
        infobut.setScale(0.1);
        infobut.zPosition = 2;
        mainbutt.addChild(infobut);
        
        //Infolabel
        infolabel = SKLabelNode();
        infolabel.text = "Press START \n then choose heroes and win Dota";
        infolabel.fontSize = 20;
        infolabel.fontName = "Optima-ExtraBlack";
        infolabel.fontColor = UIColor.whiteColor();
        infolabel.position = CGPointMake(mainbutt.frame.midX, mainbutt.frame.midY + mainbutt.frame.height);
        infolabel.zPosition = 10;
        infolabel.alpha = 0;
        //self.addChild(infolabel);
        
    }
    
    

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let locationbuttons = touch.locationInNode(mainbutt);
            let location = touch.locationInNode(self);

            
            if startbut.containsPoint(locationbuttons) {
                print("tapped! + Start");
                
                
                let transition:SKTransition = SKTransition.fadeWithDuration(1);
                let scene:SKScene = HeroScreen(size: self.size);
                scene.scaleMode = .AspectFill;
                self.view?.presentScene(scene, transition: transition);
                
            }  else if infobut.containsPoint(locationbuttons) {
                print("tapped! + Info")
                help.alpha = 1;
            }  else if help.containsPoint(location) {
                help.alpha = 0;            }
        }
    }
        
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
}



