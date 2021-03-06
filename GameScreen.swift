//
//  GameScreen.swift
//  Dota2Timers
//
//  Created by влад Богдан on 08.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import Foundation
import SpriteKit
import iAd

class GameScreen: SKScene {

    var label: SKLabelNode!
    var selectedheroes: Set<String>!
    var cam: SKCameraNode = SKCameraNode()
    var delta:CGFloat? = 0;
    var xdelta: CGFloat = 0;
    var olddelta:CGFloat? = 0;
    var oldxdelta:CGFloat? = 0;
    var RoundedRect:SKSpriteNode!
    var counts: Int = 1000;
    var counte: Int = -1000;
    var herocount: Int = 0;
    var count: SKLabelNode!
    
    var heroscreensize: CGSize!;
    
    var Heroes: Set<Hero> = [];
    var Common: Set<Commons> = [];
    var HeroDB = SimpleDB();
    var node: Hero!;
    var node2: SKNode!;
    var rune: Commons!;

    var back: SKSpriteNode!;
    var timer:SKSpriteNode!;
    var aghanim:SKSpriteNode!;
    var start:SKSpriteNode!;
    var reset:SKSpriteNode!;
    var world: SKSpriteNode!;
    var lowborder: SKSpriteNode!;
    var highborder: SKSpriteNode!;
    var leftborder: SKSpriteNode!;
    var nodeborder: CGFloat = 0;
    
    
    var started: Bool = true;
    var isremoved: Bool = false;
    var scrollup: Bool = false;
    var scrolldown: Bool = true;
    
    let icon = SKSpriteNode(imageNamed: "Tidehunter");
    var oldpos: CGFloat!;
    var offsetx: Int = 100;
    
    
    //Defauls init from superclass
    override init() {
        super.init()
    }
    
    //Init with size and set of selected heroes Set<String>
    init(size: CGSize, set: Set<String>, heroscreensize: CGSize) {
        super.init(size: size);
        self.selectedheroes = set;
        self.heroscreensize = heroscreensize;
        
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
        
        backgroundColor = SKColor.blackColor();
        self.name = "Main";

        //Add camera
        self.camera = cam;
        cam.position = CGPointMake(self.frame.width / 2, self.frame.height / 2);
        
        //Coords for test
        let x: SKSpriteNode = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(5000, 20));
        x.position = CGPointMake(0, 0);
        x.name = "x";
        self.addChild(x);
        
        let y: SKSpriteNode = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(20, 5000));
        y.position = CGPointMake(0, 0);
        y.name = "y";
        self.addChild(y);
        
        
        //Add world
        world = SKSpriteNode(color: UIColor.grayColor(), size: CGSizeMake(self.frame.width, self.frame.height * 2));
        world.zPosition = 0;
        world.position = CGPointMake(0, 0);
        world.anchorPoint = CGPointMake(0, 0.5);
        world.name = "World";
        world.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(world.frame.width, world.frame.height), center: CGPointMake(world.frame.midX, world.frame.midY));
        world.physicsBody?.affectedByGravity = false;
        world.physicsBody?.allowsRotation = false;
        world.physicsBody?.dynamic = false;
        world.physicsBody?.restitution = 0.1;
        world.physicsBody?.velocity = CGVectorMake(0, 0);
        world.physicsBody?.mass = 10000;
        world.physicsBody?.friction = 0;
        world.texture = SKTexture(imageNamed: "Background");
        self.addChild(world);
        
        //Like back button frame;
        start = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake(self.frame.width, icon.frame.height / 2));
        start.anchorPoint = CGPointMake(0, 0);
        start.position = CGPointMake(0, world.frame.maxY - start.frame.height);
        start.name = "Menuframe";
        start.texture = SKTexture(imageNamed: "Menu");
        start.zPosition = 1;
        world.addChild(start);
        
        //Back button
        back = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(start.frame.height * 0.95, start.frame.height * 0.95));
        back.position = CGPointMake(back.frame.width / 2 + 10, back.frame.height / 2 + 10);
        back.name = "Back";
        back.zPosition = 2;
        back.texture = SKTexture(imageNamed: "Back");
        start.addChild(back);
        
        //Count low border
        nodeborder = nodeborder + start.frame.height + 100;
        
        //Add roshan timer
        let roshan = Commons(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(self.frame.width * 0.98 , 150), iconId: "Roshan", cooldown: 0.0, highborder: 470.0, highestborder: 480.0);
        roshan.position = CGPointMake(self.frame.midX - roshan.frame.width / 2, start.position.y - start.frame.height - roshan.frame.height / 2 - 100); // задаем позицию.
        roshan.name = "Roshan";
        roshan.anchorPoint = CGPointMake(0, 0);
        roshan.zPosition = 1;
        Common.insert(roshan);
        world.addChild(roshan);
        
        //Common timers description
        let roshanlabel = SKLabelNode(text: "Roshan, neutral stack, rune timers");
        roshanlabel.fontSize = 60;
        roshanlabel.position = CGPointMake(world.frame.midX, roshan.frame.height + 30);
        roshanlabel.name = "commonDescription";
        roshanlabel.fontName = "Optima-ExtraBlack";
        roshanlabel.zPosition = 1;
        roshan.addChild(roshanlabel);
        
        //Add neutral timer
        let centaur = commontimer("Neutrals", previousnode: roshan, highborder: 40.0, highestborder: 60);
        centaur.zPosition = 1;
        Common.insert(centaur);
        world.addChild(centaur);
        
        //Add rune timer
        rune = commontimer("Rune", previousnode: centaur, highborder: 110.0, highestborder: 120.0);
        rune.zPosition = 1;
        Common.insert(rune);
        world.addChild(rune);
        
        //Count low border
        nodeborder = nodeborder + roshan.frame.height + centaur.frame.height + rune.frame.height + 20 * 2 + CGFloat(offsetx) * 3;
        
        //Common timers description
        let herolabel = SKLabelNode(text: "Hero timers");
        herolabel.zPosition = 1;
        herolabel.fontSize = 60;
        herolabel.position = CGPointMake(world.frame.midX, -70);
        herolabel.name = "HeroDescription";
        herolabel.fontName = "Optima-ExtraBlack";
        rune.addChild(herolabel);
        
        
        //Create hero nodes using set from previos scene and SimpleDB
        //2x loop. 1 iterating by Set<String>, second iterating SimpleDB.HeroSet<Character>
        //var herocount: Int = 0;
        for heros in selectedheroes {
            for herosDB in HeroDB.HeroSet {
                if heros == herosDB.name {
                    let character = Hero(texture: nil, color: UIColor.clearColor(),
                        size: CGSizeMake(self.frame.width * 0.98, icon.frame.height * 2),
                        hero: herosDB);
                    
                    character.position = CGPointMake((self.frame.width - character.frame.width) / 2, (rune.position.y - rune.frame.height - character.frame.height / 2 - CGFloat(offsetx)) - (character.frame.height + CGFloat(offsetx)) * CGFloat(herocount));
                    character.name = herosDB.name;
                    character.zPosition = 1;
                    Heroes.insert(character);
                    world.addChild(character);
                    
                    //Count low border
                    nodeborder = nodeborder + character.frame.height + CGFloat(offsetx) * 2;
                }
                
            }
            herocount++;
        }
        
        herocount = 0;
        
        
        //High border for World node
        highborder = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.width, 30));
        highborder.anchorPoint = CGPointMake(0.5, 0.5);
        highborder.position = CGPointMake(0, world.frame.maxY + world.frame.height / 2);
        highborder.name = "Highborder";
        highborder.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(highborder.frame.width, highborder.frame.height));
        highborder.physicsBody?.affectedByGravity = false;
        highborder.physicsBody?.dynamic = false;
        self.addChild(highborder);
        
        
        //Low border for World node
        lowborder = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(self.frame.width, 30));
        lowborder.anchorPoint = CGPointMake(0.5, 0.5);
        lowborder.position = CGPointMake(lowborder.frame.width / 2, world.frame.minY - lowborder.frame.height / 2);
        lowborder.name = "Lowborder";
        lowborder.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(lowborder.frame.width, lowborder.frame.height));
        lowborder.physicsBody?.affectedByGravity = false;
        lowborder.physicsBody?.dynamic = false;
        self.addChild(lowborder);
    
        //left border for World node
        leftborder = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(30, world.frame.height * 2));
        leftborder.anchorPoint = CGPointMake(0.5, 0.5);
        leftborder.position = CGPointMake(-leftborder.frame.width / 2, world.frame.minY);
        leftborder.name = "Leftborder";
        leftborder.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(leftborder.frame.width, leftborder.frame.height));
        leftborder.physicsBody?.affectedByGravity = false;
        leftborder.physicsBody?.dynamic = false;
        self.addChild(leftborder);
        
        print(nodeborder);
        //Low border check
        if nodeborder < world.frame.height / 2 {
            nodeborder = 0;
        } else {
            nodeborder = nodeborder - world.frame.height / 2;
        }
        
        NSNotificationCenter.defaultCenter().postNotificationName("showBanner", object: nil);

    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            //Check touch location and previos touch location
            //Calculating delta to scroll camera
            let start = touch.locationInNode(self);
            let previousLocation = touch.previousLocationInNode(self);
            delta = start.y - previousLocation.y;
            world.position.y += -delta!;
            
            
            //Chek for scrool world up or down
            if start.y > previousLocation.y {
                scrollup = false;
                scrolldown = false;
            } else if start.y < previousLocation.y {
                scrolldown = false;
            }
            
            print("\(start.x)", "\(start.y)");
            
            //Check touch location and previos touch location
            //Calculating delta to move nodes and delete them
            let xstart = touch.locationInNode(self);
            let xpreviosloc = touch.previousLocationInNode(self);
            let nodee = self.nodeAtPoint(xstart);//.parent! as! Hero
            let name: String = nodee.name!;
            
            //Delta changes if icon or skill node is touched only
            if (name == "Icon" || name == "Skill") && scrolldown {
                xdelta = start.x - previousLocation.x;
            }
            
            //Find touched node and move by xdelta in touch
            for hero in Heroes {
                //if hero.name == node.name {
                if hero.name == nodee.parent?.name! {
                    if (xstart.x != xpreviosloc.x) {
                        
                        //Block y delta
                        delta = 0;
                        
                        //Start moving node by x
                        hero.position.x += xdelta;

                    } else {
                        xdelta = 0;
                    }
                }
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            //Stop mooving node
            started = false;
            
            
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
                case "World":
                    print("WOLD");
                
            default:
                print("nothing");
                    }
                }
            }
            
            if scrolldown {
                
                //iterate hero nodes on scene
                //check name of pressed node equal it to set of existing nodes
                for hero in Heroes {
                    //if hero.name == node.name {
                    if hero.name == nodee.parent?.name! {
                        
                        switch(name) {
                        case "Start":
                            //Change scale to make pressed button effect
                            hero.start.setScale(0.9);
                        case "Reset":
                            hero.reset.setScale(0.9);
                            default:
                            print("Try again")
                        }
                    }
                }
            }
        }
    }

    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            
            //Start Node movement to default position
            started = true;
            
            
            let location = touch.locationInNode(self);
            let nodee = self.nodeAtPoint(location);
            let name: String = nodee.name!;

            if nodee.name! == "Back" {
                let transition:SKTransition = SKTransition.fadeWithDuration(0.5)
                let scene:SKScene = HeroScreen(size: heroscreensize);
                scene.scaleMode = .AspectFill
                self.view?.presentScene(scene, transition: transition);
            }
            
            
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
            
            if scrolldown {
            
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
                        hero.start.setScale(1);
                    case "Reset":
                        
                        //Reset timer
                        hero.resetTimer();
                        
                        //Reset push effect
                        hero.reset.setScale(1);
                        
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
        scrolldown = true;
        
        for hero in Heroes {
            hero.start.setScale(1);
            hero.reset.setScale(1);
        }

}

    var lastupdated: NSTimeInterval = 0;

    override func update(currentTime: NSTimeInterval) {
        
        
        
            //Update heroes
            for hero in Heroes {
                
                if scrolldown {
                //Update Heroes
                hero.update(currentTime);
                
                //Movement of node
                if started {
                if hero.position.x > (self.frame.width - hero.frame.width) / 2 {
                        hero.position.x -= 5;
                }
            }
                
                if hero.position.x - 5 <= (self.frame.width - hero.frame.width) / 2 {
                    hero.position.x = (self.frame.width - hero.frame.width) / 2;
                }
        } //scrollup down
                
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
        
        
        //Check for deleting one of the nodes
        //And redraw other nodes
        if isremoved {
            
            for (hero) in Heroes {
            hero.position = CGPointMake((self.frame.width - hero.frame.width) / 2, (rune.position.y - rune.frame.height - hero.frame.height / 2 - CGFloat(offsetx)) - (hero.frame.height + CGFloat(offsetx)) * CGFloat(herocount));
                herocount++;
            }
            isremoved = false;
        }
       
     
            if (world.position.y - delta!) >= nodeborder + 200 {
                world.position.y = nodeborder + 200;
            } else if (world.position.y - delta!) <= 0 {
                world.position.y = 0;
            }
            olddelta = delta;
 
}
    
    func commontimer(name: String, previousnode: SKSpriteNode, highborder: Double, highestborder: Double) -> Commons {
        let testerino = Commons(texture: nil, color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.98 , icon.frame.height), iconId: name, cooldown: 0.0, highborder: highborder, highestborder: highestborder);
        testerino.position = CGPointMake(self.frame.midX - testerino.frame.width / 2, previousnode.position.y - previousnode.frame.height - 20);
        testerino.name = name;
        testerino.anchorPoint = CGPointMake(0, 0);
        
        return testerino;
    }
    
    
    func label(name: String) -> SKLabelNode {
        let label = SKLabelNode();
        label.name = name;
        label.fontColor = UIColor.whiteColor();
        label.fontSize = 45;
        return label;
    }
}



