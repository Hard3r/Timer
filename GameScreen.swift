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
    var xdelta: CGFloat = 0;
    var olddelta:CGFloat? = 0;
    var oldxdelta:CGFloat? = 0;
    var RoundedRect:SKSpriteNode!
    var counts: Int = 1;
    var counte: Int = 60;
    var herocount: Int = 0;
    var count: SKLabelNode!
    //var tests: SKSpriteNode!
    
    
    //var testero: Hero!
    var Heroes: Set<Hero> = [];
    var Common: Set<Commons> = [];
    var HeroDB = SimpleDB();
    var node: Hero!;
    var node2: SKNode!;
    var rune: Commons!;

    
    var timer:SKSpriteNode!;
    var aghanim:SKSpriteNode!;
    var start:SKSpriteNode!;
    var reset:SKSpriteNode!;
    var started: Bool = false;
    var isremoved: Bool = false;
    
    let icon = SKSpriteNode(imageNamed: "Tidehunter");
    var oldpos: CGFloat!;
    
    
    //var sizee: CGSize!
    
    //Defauls init from superclass
    override init() {
        super.init()
    }
    
    //Init with size and set of selected heroes Set<String>
    init(size: CGSize, set: Set<String>) {
        super.init(size: size);
        self.selectedheroes = set;
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func didMoveToView(view: SKView) {

        
        var test: String = "";
        for lel in selectedheroes {
            test = test + " \n" + lel;
            print(test);
        }
        
        backgroundColor = SKColor.grayColor();
        self.name = "Main";

        //Add camera
        self.camera = cam;
        cam.position = CGPointMake(self.frame.width / 2, self.frame.height / 2);
        
        //Like back button frame;
        start = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width, icon.frame.height / 2));
        start.anchorPoint = CGPointMake(0, 0);
        start.position = CGPointMake(0, self.frame.maxY - start.frame.height);
        start.name = "Menuframe";
        self.addChild(start);
        
        
        //Add roshan timer
        let roshan = Commons(texture: nil, color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.98 , 150), iconId: "roshan", cooldown: 0.0, highborder: 470.0, highestborder: 480.0);
        roshan.position = CGPointMake(self.frame.midX - roshan.frame.width / 2, start.position.y - start.frame.height - roshan.frame.height / 2 - 20); // задаем позицию.
        roshan.name = "roshan";
        roshan.anchorPoint = CGPointMake(0, 0);
        Common.insert(roshan);
        self.addChild(roshan);
        
        //Add neutral timer
        let centaur = commontimer("centaur", previousnode: roshan, highborder: 40.0, highestborder: 52.0);
        Common.insert(centaur);
        self.addChild(centaur);
        
        //Add rune timer
        rune = commontimer("rune", previousnode: centaur, highborder: 110.0, highestborder: 120.0);
        Common.insert(rune);
        self.addChild(rune);
        
        //Create hero nodes using set from previos scene and SimpleDB
        //2x loop. 1 iterating by Set<String>, second iterating SimpleDB.HeroSet<Character>
        //var herocount: Int = 0;
        for heros in selectedheroes {
            for herosDB in HeroDB.HeroSet {
                if heros == herosDB.name {
                    let character = Hero(texture: nil, color: UIColor.whiteColor(),
                        size: CGSizeMake(self.frame.width * 0.98, icon.frame.height * 2),
                        hero: herosDB);
                    
                    character.position = CGPointMake((self.frame.width - character.frame.width) / 2, (rune.position.y - rune.frame.height - character.frame.height / 2 - 20) - (character.frame.height + 20) * CGFloat(herocount));
                    character.name = herosDB.name;
                    Heroes.insert(character);
                    self.addChild(character);
                }
                
            }
            herocount++;
        }
        
        herocount = 0;
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            //Check touch location and previos touch location
            //Calculating delta to scroll camera
            let start = touch.locationInNode(self);
            let previousLocation = touch.previousLocationInNode(self);
            delta = start.y - previousLocation.y;
            print("\(start.x)", "\(start.y)");
            
            //Check touch location and previos touch location
            //Calculating delta to move nodes and delete them
            let xstart = touch.locationInNode(self);
            let xpreviosloc = touch.previousLocationInNode(self);
            let nodee = self.nodeAtPoint(xstart);//.parent! as! Hero
            let name: String = nodee.name!;
            
            if name == "Icon" || name == "Skill" {
                xdelta = start.x - previousLocation.x;
            }
            
            //Find touched node and move by xdelta in touch
            for hero in Heroes {
                //if hero.name == node.name {
                if hero.name == nodee.parent?.name! {
                    if (xstart.x != xpreviosloc.x) {
                        delta = 0;
                        hero.position.x += xdelta;

                    } else { xdelta = 0; }
                    
                    
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self);
            let nodee = self.nodeAtPoint(location);//.parent! as! Hero
            let name: String = nodee.name!;
            print(nodee.name!);
            
            //iterate commons
            for common in Common {
                if common.name == nodee.parent?.name! {
            switch(name) {
                case "commonStart":
                    
                    //Reset
                    common.resetTimer();
                    
                    //Stop timer
                    common.timer.invalidate();
                    
                    //Start timer
                    common.startTimer();
                
                    //Stop udpdate
                    common.isStarted = false;
                
                    //Make fake animation of button pressed
                    common.start.setScale(0.9);
            case "commonReset":
                
                    //Reset
                    common.resetTimer();
            default:
                print("nothing");
                    }
                }
            }
            
            //iterate hero nodes on scene
            //check name of pressed node equal it to set of existing nodes
            for hero in Heroes {
                //if hero.name == node.name {
                if hero.name == nodee.parent?.name! {
                    
                    switch(name) {
                        case "Start":
                            //Reset timer
                            hero.resetTimer();
                            
                            //Stop timer
                            hero.timer.invalidate();
                            
                            //Start timer
                            hero.testtimer();
                            
                            //Stop updating
                            hero.isStarted = false;
                            
                            //Change scale to make pressed button effect
                            hero.start.setScale(0.9);
                        case "Reset":
                            
                            //Reset timer
                            hero.resetTimer();
                        
                        case "Aghanim":
                            hero.timer.invalidate();
                            
                            hero.aghanimpressed = !hero.aghanimpressed
                            if hero.scepter.alpha == 0.5 {
                                hero.scepter.alpha = 1;
                            } else { hero.scepter.alpha = 0.5; }
                        
                        case "Octarine":
                            hero.timer.invalidate();
                            
                            hero.octarine = !hero.octarine;
                            hero.octarinepressed = !hero.octarinepressed;
                            
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
                            //Reset timer
                            hero.resetTimer();
                            
                            hero.lvl6pressed = true;
                            hero.lvl11pressed = false;
                            hero.lvl16pressed = false;
                            hero.level6.alpha = 0.5;
                            hero.level11.alpha = 1;
                            hero.level16.alpha = 1;

                        case "Level11":
                            //Reset timer
                            hero.resetTimer();
                            
                            hero.lvl6pressed = false;
                            hero.lvl11pressed = true;
                            hero.lvl16pressed = false;
                            hero.level6.alpha = 1;
                            hero.level11.alpha = 0.5;
                            hero.level16.alpha = 1;

                        
                        case "Level16":
                            //Reset timer
                            hero.resetTimer();
                            
                            hero.lvl6pressed = false;
                            hero.lvl11pressed = false;
                            hero.lvl16pressed = true;
                            hero.level6.alpha = 1;
                            hero.level11.alpha = 1;
                            hero.level16.alpha = 0.5;

                        
                    default:
                        print("Try again")
                    }
                    
                }
            }

        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self);
            let nodee = self.nodeAtPoint(location);
            let name: String = nodee.name!;
            //let locationbuttons = touch.locationInNode(RoundedRect)

            //iterate commons
            for common in Common {
                if common.name == nodee.parent?.name! {
                    switch(name) {
                    case "commonStart":
                        
                        //Make fake animation of button pressed
                        common.start.setScale(1);
                    case "commonReset":
                        
                        print("7 bed odin rezet");
                    default:
                        print("nothing");
                    }
                }
            }

            
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
        }
    }
    
    
    override func update(currentTime: NSTimeInterval) {
        
            //Update heroes
            for hero in Heroes {
                hero.update(currentTime);
                
                
                //Movement of node
                if hero.position.x > (self.frame.width - hero.frame.width) / 2 {
                        hero.position.x -= 5;
                } else if hero.position.x - 5 <= (self.frame.width - hero.frame.width) / 2 {
                        hero.position.x = (self.frame.width - hero.frame.width) / 2;
                    }
                
                //Delete node
                if hero.position.x > self.frame.midX {
                    hero.removeFromParent();
                    Heroes.remove(hero);
                    isremoved = true;
                    }
                }
    
                //Update commons
                for common in Common {
                    common.update();
                }
        
        if isremoved {
            
            for (hero) in Heroes {
            hero.position = CGPointMake((self.frame.width - hero.frame.width) / 2, (rune.position.y - rune.frame.height - hero.frame.height / 2 - 20) - (hero.frame.height + 20) * CGFloat(herocount));
                herocount++;
            }
            isremoved = false;
        }
   
        //Update camera (scroll)
        if (olddelta != delta) {
            if (cam.position.y - delta!) >= self.frame.midY {
                
                cam.position.y = self.frame.midY;
            } else if (cam.position.y - delta!) <= -1000 {
                cam.position.y = -1000;
                } else {
                cam.position.y += -delta!; }
            
                    olddelta = delta;
        }
    }
    
    
    func commontimer(name: String, previousnode: SKSpriteNode, highborder: Double, highestborder: Double) -> Commons {
        let testerino = Commons(texture: nil, color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.98 , icon.frame.height), iconId: name, cooldown: 0.0, highborder: highborder, highestborder: highestborder);
        testerino.position = CGPointMake(self.frame.midX - testerino.frame.width / 2, previousnode.position.y - previousnode.frame.height  - 20);
        testerino.name = name;
        testerino.anchorPoint = CGPointMake(0, 0);
        
        return testerino;
    }
}



