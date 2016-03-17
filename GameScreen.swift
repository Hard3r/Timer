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
    var cam: SKCameraNode = SKCameraNode()
    var test:CGFloat = 0;
    var delta:CGFloat? = 0;
    var olddelta:CGFloat? = 0;
    var RoundedRect:SKSpriteNode!
    var counts: Int = 0;
    var counte: Int = 0;
    var count: SKLabelNode!
    var tests: SKSpriteNode!
    
    
    var timer:SKSpriteNode!
    var aghanim:SKSpriteNode!
    var start:SKSpriteNode!
    var reset:SKSpriteNode!
    var started: Bool = false;
    
    var oldpos: CGFloat!
    
    var sizee: CGSize!
    
    
    
    
    
    
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
        
        backgroundColor = SKColor.grayColor()
    
        self.camera = cam
        //cam.setScale(10)
        //cam.xScale = 2
        //cam.yScale = 2
        cam.position = CGPointMake(self.frame.width / 2, self.frame.height / 2)
        
        //self.frame.maxY - cam.frame.height , self.frame.height - cam.frame.height
        //cam.position = CGPointMake(self.frame.midX - self.frame.width / 4, self.frame.midY)
        
        
        let icon = SKSpriteNode(imageNamed: "Tidehunter")
        
        RoundedRect = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.98, icon.frame.height))
        RoundedRect.position = CGPointMake(self.frame.midX - RoundedRect.frame.width / 2, self.frame.maxY - RoundedRect.frame.height) // задаем позицию.
        RoundedRect.anchorPoint = CGPointMake(0, 0)
        RoundedRect.name = "RoundedRect" // задаем имя.
        RoundedRect.zPosition = 10;
        self.addChild(RoundedRect) // добавляем наш объект на нашу сцену.
        
        //size = RoundedRect.size
        
        icon.position = CGPointMake(0, 0)
        icon.anchorPoint = CGPointMake(0, 0)
        //icon.setScale(0.95)
        icon.zPosition = 4;
        RoundedRect.addChild(icon)
        
        timer = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(RoundedRect.frame.width / 2 - icon.frame.width, icon.frame.height / 2))
        timer.anchorPoint = CGPointMake(0, 0)
        timer.position = CGPointMake(icon.frame.width, icon.frame.height / 2)
        RoundedRect.addChild(timer)
        count = SKLabelNode(text: "\(counts)")
        count.name = "bla"
        count.position = CGPointMake(timer.frame.width / 2, timer.frame.height / 2)
        timer.addChild(count)
        
        aghanim = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(RoundedRect.frame.width / 2 - icon.frame.width, icon.frame.height / 2))
        aghanim.anchorPoint = CGPointMake(0, 0)
        aghanim.position = CGPointMake(icon.frame.width, 0)
        aghanim.name = "Aghanim"
        RoundedRect.addChild(aghanim)
        
        start = SKSpriteNode(imageNamed: "startbutt")
        start.size = CGSizeMake(RoundedRect.frame.width / 4, RoundedRect.frame.height)
        start.position = CGPointMake(icon.frame.width + aghanim.frame.width, 0)
        start.anchorPoint = CGPointMake(0, 0)
        start.name = "start"
        RoundedRect.addChild(start)
        
        reset = SKSpriteNode(imageNamed: "info")
        reset.size = CGSizeMake(RoundedRect.frame.width / 4, RoundedRect.frame.height)
        reset.position = CGPointMake(icon.frame.width + aghanim.frame.width + start.frame.width, 0)
        reset.anchorPoint = CGPointMake(0, 0)
        RoundedRect.addChild(reset)
        
        print(cam.frame.width)
        print(cam.frame.height)
       //tests = newshit(self)
        //self.addChild(tests)
        
        //let shit = tests.childNodeWithName("BLABLA")
        //let mySprite:SKSpriteNode = tests.childNodeWithName("Aghanim2") as! SKSpriteNode
     
        let testero = Hero(texture: nil, color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.98, icon.frame.height), iconID: "Tidehunter")
        testero.position = CGPointMake((self.frame.width - testero.frame.width) / 2, self.frame.midY)
        self.addChild(testero)
        
      
      
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let start = touch.locationInNode(self)
            let previousLocation = touch.previousLocationInNode(self)
            //let deltaY = start.y - previousLocation.y
            delta = start.y - previousLocation.y
            print("\(start.x)", "\(start.y)")
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            // let location = touch.locationInNode(self)
            let locationbuttons = touch.locationInNode(RoundedRect)
            
            if start.containsPoint(locationbuttons) {
                print("tapped! + Start")
                started = true
                
            } else if reset.containsPoint(locationbuttons) {
                print("tapped! + Settings")
                started = false
            }
        }
    }
    
    override func update(currentTime: NSTimeInterval) {
        
       count.text = "\(counts)"
     //   let mySprite:SKLabelNode = tests.childNodeWithName("BLABLA") as! SKLabelNode
//mySprite.text = "\(lel)"
        
        
        
        if started {
            counts += 1
        } else { counts = 0 }
        
        
        
        while (olddelta != delta) {
            if (cam.position.y - delta!) >= self.frame.midY {
                
                cam.position.y = self.frame.midY
            } else if (cam.position.y - delta!) <= -1000 {
                cam.position.y = -1000
                } else {
                cam.position.y += -delta! }
            
                olddelta = delta
            }
    }
}




func newshit(scene: SKScene) -> SKSpriteNode{
    let icon = SKSpriteNode(imageNamed: "Tidehunter")
    
    let RoundedRect = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(scene.frame.width * 0.98, icon.frame.height))
    RoundedRect.position = CGPointMake(scene.frame.midX - RoundedRect.frame.width / 2, scene.frame.maxY - RoundedRect.frame.height + icon.frame.height - 500) // задаем позицию.
    RoundedRect.anchorPoint = CGPointMake(0, 0)
    RoundedRect.name = "Tidehunter" // задаем имя.
    RoundedRect.zPosition = 3;
    //scenesize.addChild(RoundedRect) // добавляем наш объект на нашу сцену.
    
    
    icon.position = CGPointMake(0, 0)
    icon.anchorPoint = CGPointMake(0, 0)
    //icon.setScale(0.95)
    icon.zPosition = 4;
    RoundedRect.addChild(icon)
    
    let timer = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(RoundedRect.frame.width / 2 - icon.frame.width, icon.frame.height / 2))
    timer.anchorPoint = CGPointMake(0, 0)
    timer.position = CGPointMake(icon.frame.width, icon.frame.height / 2)
    RoundedRect.addChild(timer)
    let count = SKLabelNode(text: "\(0)")
    count.name = "BLABLA"
    count.position = CGPointMake(timer.frame.width / 2, timer.frame.height / 2)
    timer.addChild(count)
    
    let aghanim = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(RoundedRect.frame.width / 2 - icon.frame.width, icon.frame.height / 2))
    aghanim.anchorPoint = CGPointMake(0, 0)
    aghanim.position = CGPointMake(icon.frame.width, 0)
    aghanim.name = "Aghanim2"
    RoundedRect.addChild(aghanim)
    
    let start = SKSpriteNode(imageNamed: "startbutt")
    start.size = CGSizeMake(RoundedRect.frame.width / 4, RoundedRect.frame.height)
    start.position = CGPointMake(icon.frame.width + aghanim.frame.width, 0)
    start.anchorPoint = CGPointMake(0, 0)
    start.name = "start3"
    RoundedRect.addChild(start)
    
    let reset = SKSpriteNode(imageNamed: "info")
    reset.size = CGSizeMake(RoundedRect.frame.width / 4, RoundedRect.frame.height)
    reset.position = CGPointMake(icon.frame.width + aghanim.frame.width + start.frame.width, 0)
    reset.anchorPoint = CGPointMake(0, 0)
    RoundedRect.addChild(reset)
    
    return RoundedRect;
}