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
    //var test:CGFloat = 0;
    var delta:CGFloat? = 0;
    var olddelta:CGFloat? = 0;
    var RoundedRect:SKSpriteNode!
    var counts: Int = 1;
    var counte: Int = 60;
    var count: SKLabelNode!
    //var tests: SKSpriteNode!
    
    
    //var testero: Hero!
    var Heroes: Set<Hero> = []
    var HeroDB = SimpleDB();
    var node: Hero!
    var node2: SKNode!

    
    var timer:SKSpriteNode!
    var aghanim:SKSpriteNode!
    var start:SKSpriteNode!
    var reset:SKSpriteNode!
    var started: Bool = false;
    
    var oldpos: CGFloat!
    
    //var sizee: CGSize!
    
    //Defauls init from superclass
    override init() {
        super.init()
    }
    
    //Init with size and set of selected heroes Set<String>
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
        self.name = "Main"

        //Add camera
        self.camera = cam
        cam.position = CGPointMake(self.frame.width / 2, self.frame.height / 2)
        
        
        let icon = SKSpriteNode(imageNamed: "Tidehunter")
        
        RoundedRect = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.98, icon.frame.height))
        RoundedRect.position = CGPointMake(self.frame.midX - RoundedRect.frame.width / 2, self.frame.maxY - RoundedRect.frame.height) // задаем позицию.
        RoundedRect.anchorPoint = CGPointMake(0, 0)
        RoundedRect.name = "RoundedRect" // задаем имя.
        RoundedRect.zPosition = 10;
        self.addChild(RoundedRect) // добавляем наш объект на нашу сцену.
        
        
        icon.position = CGPointMake(0, 0)
        icon.anchorPoint = CGPointMake(0, 0)
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
        
        //Create hero nodes using set from previos scene and SimpleDB
        //2x loop. 1 iterating by Set<String>, second iterating SimpleDB.HeroSet<Character>
        var herocount: Int = 0;
        for heros in selectedheroes {
            for herosDB in HeroDB.HeroSet {
                if heros == herosDB.name {
                    let character = Hero(texture: nil, color: UIColor.whiteColor(),
                        size: CGSizeMake(self.frame.width * 0.98, icon.frame.height * 2),
                        hero: herosDB);
                    
                    character.position = CGPointMake((self.frame.width - character.frame.width) / 2, self.frame.midY - (character.frame.height + 20) * CGFloat(herocount));
                    character.name = herosDB.name;
                    Heroes.insert(character);
                    self.addChild(character);
                }
                herocount++
            }
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            //Check touch location and previos touch location
            //Calculating delta to scroll camera
            let start = touch.locationInNode(self)
            let previousLocation = touch.previousLocationInNode(self)
            delta = start.y - previousLocation.y
            print("\(start.x)", "\(start.y)")
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            let nodee = self.nodeAtPoint(location)//.parent! as! Hero
            let name: String = nodee.name!;
            print(nodee.name!)
            
            //iterate hero nodes on scene
            //check name of pressed node equal it to set of existing nodes
            for hero in Heroes {
                //if hero.name == node.name {
                if hero.name == nodee.parent?.name! {
                    
                    switch(name) {
                        case "Start":
                            //Stop timer
                            hero.timer.invalidate()
                            
                            //Start timer
                            hero.testtimer()
                            
                            //Stop updating
                            hero.isStarted = false
                            
                            //Change scale to make pressed button effect
                            hero.start.setScale(0.9)
                        case "Reset":
                            
                            //Stop timer
                            hero.timer.invalidate()
                            
                            //Start updating and check what to update
                            hero.isStarted = true
                            if hero.lvl6pressed && !hero.aghanimpressed{
                                hero.lvl6 = hero.ulti6
                            } else if hero.lvl6pressed && hero.aghanimpressed {
                                hero.lvl6agha = hero.aulti6
                            } else if hero.lvl11pressed && !hero.aghanimpressed {
                                hero.lvl11 = hero.ulti11
                            } else if hero.lvl11pressed && hero.aghanimpressed {
                                hero.lvl11agha = hero.aulti11
                            } else if hero.lvl16pressed && !hero.aghanimpressed {
                                hero.lvl16 = hero.ulti16
                            } else if hero.lvl16pressed && hero.aghanimpressed {
                                hero.lvl16agha = hero.aulti16
                            }
                        
                        case "Aghanim":
                            hero.aghanimpressed = !hero.aghanimpressed
                            if hero.scepter.alpha == 0.5 {
                                hero.scepter.alpha = 1;
                            } else { hero.scepter.alpha = 0.5; }
                        
                        case "Octarine":
                            hero.octarine = !hero.octarine
                            hero.octarinepressed = !hero.octarinepressed
                            
                            switch(hero.octarinepressed) {
                                case true:
                                    hero.octarinechange();
                                case false:
                                    hero.octarineback();
                            }
                            
                            if hero.core.alpha == 0.5 {
                                hero.core.alpha = 1;
                            } else { hero.core.alpha = 0.5; }
                        
                        case "Level6":
                            hero.lvl6pressed = true;
                            hero.lvl11pressed = false;
                            hero.lvl16pressed = false;
                            hero.level6.alpha = 0.5
                            hero.level11.alpha = 1
                            hero.level16.alpha = 1

                        case "Level11":
                            hero.lvl6pressed = false;
                            hero.lvl11pressed = true;
                            hero.lvl16pressed = false;
                            hero.level6.alpha = 1
                            hero.level11.alpha = 0.5
                            hero.level16.alpha = 1
                        
                        
                        case "Level16":
                            hero.lvl6pressed = false;
                            hero.lvl11pressed = false;
                            hero.lvl16pressed = true;
                            hero.level6.alpha = 1
                            hero.level11.alpha = 1
                            hero.level16.alpha = 0.5
                        
                        
                    default:
                        print("Try again")
                    }
                    
                }
            }

        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            let nodee = self.nodeAtPoint(location)//.parent! as! Hero
            let name: String = nodee.name!;
            let locationbuttons = touch.locationInNode(RoundedRect)

            
            //Bring scale of start button to normal size
            for hero in Heroes {
                //if hero.name == node.name {
                if hero.name == nodee.parent?.name! {
        
            switch(name) {
            case "Start":
                hero.start.setScale(1);
            
            default:
                print("Try again")
            }
        }
    }
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
        
            for hero in Heroes {
                hero.update(currentTime)
            }
   
        //Update camera (scroll)
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


