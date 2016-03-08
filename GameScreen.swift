//
//  GameScreen.swift
//  Dota2Timers
//
//  Created by влад Богдан on 08.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import Foundation
import SpriteKit

class GameScreen: SKScene {
    
    var label: SKLabelNode!
    var selectedheroes: Set<String>!
    var cam: SKCameraNode!
    var test:CGFloat = 0;
    var delta:CGFloat? = 0;
    var olddelta:CGFloat? = 0;
    
    
    override init() {
        super.init()
    }
    
    
    init(size: CGSize, set: Set<String>) {
        super.init(size: size)
        self.selectedheroes = set;
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func didMoveToView(view: SKView) {
        
        self.anchorPoint = CGPointMake(0, 0)
        
        var test: String = ""
        for lel in selectedheroes {
            test = test + " \n" + lel
            print(lel)
        }
        
        
        let background2 = SKSpriteNode(imageNamed: "dota2walpapaer");
        background2.position = CGPointMake(0, 0)
        background2.zPosition = 0;
        background2.anchorPoint = CGPointMake(0, 0)
        background2.setScale(0.8)
        self.addChild(background2);
        
        cam = SKCameraNode();
        self.camera = cam
        cam.position = CGPointMake(self.frame.midX, self.frame.midY)
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let start = touch.locationInNode(self)
            let previousLocation = touch.previousLocationInNode(self)
            //let deltaY = start.y - previousLocation.y
            delta = start.y - previousLocation.y
        }
    } 
    
    override func update(currentTime: NSTimeInterval) {
        
        while (olddelta != delta) {
            if cam.position.y > 500 {
                cam.position.y = 500
            } else if cam.position.y < -100 {
                cam.position.y = -100
                } else {
                cam.position.y += -delta! }
            
                olddelta = delta
            }
    }
}