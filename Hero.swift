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
    
    var seconds: Int = 1
    
    //Levels check
    var lvl6: Double = 0;
    var lvl6pressed: Bool = true;
    var lvl11: Double = 0;
    var lvl11pressed: Bool = false;
    var lvl16: Double = 0;
    var lvl16pressed: Bool = false;

    
    var lvl6agha: Double = 0
    var lvl6aghapressed: Bool = false;
    var lvl11agha: Double = 0
    var lvl11aghapressed: Bool = false;
    var lvl16agha: Double = 0;
    var lvl16aghapressed: Bool = false;
    
    
    //Hero name
    var iconID: String!
    
    //Levels
    var ulti6: Double = 0;
    var ulti11: Double = 0;
    var ulti16: Double = 0;
    var aulti6: Double = 0;
    var aulti11: Double = 0;
    var aulti16: Double = 0;
    
    
    var isStarted: Bool = true
    
    //Check for aghanim
    var aghanim: Bool = false
    
    //Check for buttons press
    var aghanimpressed: Bool = false;
    var octarine: Bool = false;
    var octarinepressed: Bool = false;
    var soundTEN: Bool = true;
    var soundZERO: Bool = true;
    
    
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
    var readyspell: SKSpriteNode!
    
    var timer = NSTimer()
    
    
    
    init() {
    super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    //iconID: String, aghanim: Bool,
    //level6cool: Int, level11cool: Int, level16cool: Int, level6agha: Int, level11agha: Int, level16agha: Int
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, hero: Character) {
        super.init(texture: texture, color: color, size: size)
        self.iconID = hero.name;
        self.aghanim = hero.aghanim;
        self.lvl6 = hero.lvl6cool;
        self.lvl11 = hero.lvl11cool;
        self.lvl16 = hero.lvl16cool;
        self.lvl6agha = hero.lvl6agha;
        self.lvl11agha = hero.lvl11agha;
        self.lvl16agha = hero.lvl16agha;
        self.ulti6 = hero.lvl6cool;
        self.ulti11 = hero.lvl11cool;
        self.ulti16 = hero.lvl16cool;
        self.aulti6 = hero.lvl6agha;
        self.aulti11 = hero.lvl11agha;
        self.aulti16 = hero.lvl16agha;
        self.anchorPoint = CGPointMake(0, 0);
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
        labelframe = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 7, icon.frame.height));
        labelframe.anchorPoint = CGPointMake(0, 0);
        labelframe.position = CGPointMake(icon.position.x + icon.frame.width, icon.frame.height);
        labelframe.name = "Labelframe";
        self.addChild(labelframe);
        label = SKLabelNode(text: "\(lvl6)");
        label.name = "Timer";
        label.fontSize = 30;
        label.fontName = "Optima-ExtraBlack";
        label.position = CGPointMake(labelframe.frame.width / 2, labelframe.frame.height / 2 - label.frame.height / 2);
        labelframe.addChild(label);
        
        
        //Agha
        scepter = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 6, icon.frame.height));
        scepter.texture = SKTexture(imageNamed: "Aghanim");
        scepter.anchorPoint = CGPointMake(0, 0);
        scepter.name = "Aghanim";
        scepter.position = CGPointMake(icon.frame.width + labelframe.frame.width, icon.frame.height);
        
        //Octarine
        core = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 6, icon.frame.height));
        core.anchorPoint = CGPointMake(0, 0);
        core.texture = SKTexture(imageNamed: "octarine");
        core.name = "Octarine";
        core.position = CGPointMake(scepter.position.x + scepter.frame.width, icon.frame.height);
        
        //Start timer button
        start = SKSpriteNode(imageNamed: "startbutt");
        start.size = CGSizeMake((self.frame.width - icon.frame.width) / 3, icon.frame.height);
        start.texture = SKTexture(imageNamed: "Starttext");
        start.position = CGPointMake(core.position.x + core.frame.width + start.frame.width / 2, icon.frame.height + start.frame.height / 2);
        start.anchorPoint = CGPointMake(0.5, 0.5);
        start.name = "Start";
        
        
        //Reset timer button
        reset = SKSpriteNode(imageNamed: "info");
        reset.texture = SKTexture(imageNamed: "ResetText");
        reset.size = CGSizeMake((self.frame.width - icon.frame.width) / 5, icon.frame.height);
        reset.position = CGPointMake(start.position.x + start.frame.width / 2 + reset.frame.width / 2 - 5, icon.frame.height + reset.frame.height / 2);
        reset.anchorPoint = CGPointMake(0.5, 0.5);
        reset.name = "Reset";
        
        
        //Check for aghanim
        if aghanim {
            self.addChild(scepter);
            self.addChild(core);
            self.addChild(start);
            self.addChild(reset);
        } else {
            core.size = CGSizeMake((self.frame.width - icon.frame.width - labelframe.frame.width) / 5, icon.frame.height)
            core.position = CGPointMake(labelframe.position.x + labelframe.frame.width, icon.frame.height)
            self.addChild(core)
            start.size = CGSizeMake((self.frame.width - icon.frame.width - labelframe.frame.width - core.frame.width) / 2, icon.frame.height)
            start.position = CGPointMake(core.position.x + core.frame.width + start.frame.width / 2, icon.frame.height + start.frame.height / 2)
            self.addChild(start)
            reset.size = CGSizeMake((self.frame.width - icon.frame.width - labelframe.frame.width - core.frame.width) / 2, icon.frame.height)
            reset.position = CGPointMake(start.position.x + start.frame.width, icon.frame.height + start.frame.height / 2)
            self.addChild(reset)
        }
        
        //Skill sprite
        let skilltexture: String = "skill_" + iconID;
        skill = SKSpriteNode(imageNamed: skilltexture);
        skill.size = CGSizeMake(icon.frame.width, icon.frame.height);
        
        //Frame for 3 lvl buttons
        levelframe = SKSpriteNode(color: UIColor.clearColor(), size: CGSizeMake(self.frame.width, icon.frame.height));
        levelframe.anchorPoint = CGPointMake(0, 0);
        levelframe.position = CGPointMake(0, 0);
        levelframe.name = "Levelframe";
        //self.addChild(levelframe)
        
        
        skill.anchorPoint = CGPointMake(0, 0);
        skill.position = CGPointMake(0, 0);
        skill.name = "Skill";
        self.addChild(skill);
        
        level6 = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake((levelframe.size.width - skill.frame.width) / 3, levelframe.size.height));
        level6.anchorPoint = CGPointMake(0, 0);
        level6.texture = SKTexture(imageNamed: "Level6");
        level6.position = CGPointMake(skill.position.x + skill.frame.width, 0);
        level6.name = "Level6";
        self.addChild(level6);
        
        level11 = SKSpriteNode(color: UIColor.redColor(), size: CGSizeMake((levelframe.size.width - skill.frame.width) / 3, levelframe.size.height));
        level11.anchorPoint = CGPointMake(0, 0);
        level11.texture = SKTexture(imageNamed: "Level11");
        level11.position = CGPointMake(level6.position.x + level6.frame.width, 0);
        level11.name = "Level11";
        self.addChild(level11);
        
        level16 = SKSpriteNode(color: UIColor.blueColor(), size: CGSizeMake((levelframe.size.width - skill.frame.width) / 3, levelframe.size.height));
        level16.anchorPoint = CGPointMake(0, 0);
        level16.texture = SKTexture(imageNamed: "Level16");
        level16.position = CGPointMake(level11.position.x + level11.frame.width, 0);
        level16.name = "Level16";
        self.addChild(level16);

        
        readyspell = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake(80, 80));
        readyspell.position = CGPointMake(skill.frame.midX, skill.frame.midY);
        readyspell.name = "Ready";
        readyspell.texture = SKTexture(imageNamed: "accept");
        readyspell.zPosition = 10;
        readyspell.alpha = 0;
        skill.addChild(readyspell);
       
    }
   
    var dobl: Double = 1
    
    
    func update(nstime: NSTimeInterval) {
    
        //Cooldowns update
        switch(octarine) {
        case true:
            if isStarted {
                if lvl6pressed && !aghanimpressed{
                    label.text = "\(octarine(ulti6))"
                } else if lvl6pressed && aghanimpressed {
                    label.text = "\(octarine(aulti6))"
                } else if lvl11pressed && !aghanimpressed {
                    label.text = "\(octarine(ulti11))"
                } else if lvl11pressed && aghanimpressed  {
                    label.text = "\(octarine(aulti11))"
                } else if lvl16pressed && !aghanimpressed {
                    label.text = "\(octarine(ulti16))"
                } else if lvl16pressed && aghanimpressed {
                    label.text = "\(octarine(aulti16))"
                }        }
        case false:
            if isStarted {
                if lvl6pressed && !aghanimpressed{
                    label.text = "\(Int(ulti6))"
                } else if lvl6pressed && aghanimpressed {
                    label.text = "\(Int(aulti6))"
                } else if lvl11pressed && !aghanimpressed {
                    label.text = "\(Int(ulti11))"
                } else if lvl11pressed && aghanimpressed {
                    label.text = "\(Int(aulti11))"
                } else if lvl16pressed && !aghanimpressed {
                    label.text = "\(Int(ulti16))"
                } else if lvl16pressed && aghanimpressed {
                    label.text = "\(Int(aulti16))"
                }        }
        }
        
       //Check cooldowns to end, whet timer reach 10 sec call method wih sound
        if soundTEN {
            if lvl6 < 2 || lvl6agha < 2 {
                soundTEN("10 SECONDS");
            } else if lvl11 < 2 || lvl11agha < 2 {
                soundTEN("10 SECONDS");
            } else if lvl16 < 2 || lvl16agha < 2 {
                soundTEN("10 SECONDS");
            }
        } else if soundZERO {
            if lvl6 < 0 || lvl6agha < 0 {
                soundZERO("0 SECONDS");
            } else if lvl11 < 0 || lvl11agha < 0 {
                soundZERO("0 SECONDS");
            } else if lvl16 < 0 || lvl16agha < 0 {
                soundZERO("0 SECONDS");
            }
        }
        
        
        
        
    }
    
    //Add a timer
    func testtimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)

    }
    
    
    //Selector for timer
    func countdown() {

        switch(octarine) {
        case true:
            if lvl6pressed && !aghanimpressed{
                label.text = "\(lvl6--)"
            } else if lvl6pressed && aghanimpressed {
                label.text = "\(lvl6agha--)"
            } else if lvl11pressed && !aghanimpressed {
                label.text = "\(lvl11--)"
            } else if lvl11pressed && aghanimpressed {
                label.text = "\(lvl11agha--)"
            } else if lvl16pressed && !aghanimpressed {
                label.text = "\(lvl16--)"
            } else if lvl16pressed && aghanimpressed {
                label.text = "\(lvl16agha--)"
            }
        case false:
            if lvl6pressed && !aghanimpressed{
                label.text = "\(Int(lvl6--))"
            } else if lvl6pressed && aghanimpressed {
                label.text = "\(Int(lvl6agha--))"
            } else if lvl11pressed && !aghanimpressed {
                label.text = "\(Int(lvl11--))"
            } else if lvl11pressed && aghanimpressed {
                label.text = "\(Int(lvl11agha--))"
            } else if lvl16pressed && !aghanimpressed {
                label.text = "\(Int(lvl16--))"
            } else if lvl16pressed && aghanimpressed {
                label.text = "\(Int(lvl16agha--))"
            }
        }
        
    

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func octarine(cooldown: Double) -> Double {
        return Double(cooldown) * 75 / 100
    }
    
    //Change cooldowns to octarine
    func octarinechange() {
        
        lvl6 = octarine(lvl6);
        lvl6agha = octarine(lvl6agha);
        
        lvl11 = octarine(lvl11);
        lvl11agha = octarine(lvl11agha);
        
        lvl16 = octarine(lvl16);
        lvl16agha = octarine(lvl16agha);
        
    }
    
    //Change cooldowns back from
    func octarineback() {
        
        lvl6 = ulti6
        lvl6agha = aulti6;
        
        lvl11 = ulti11;
        lvl11agha = aulti11;
        
        lvl16 = ulti16;
        lvl16agha = aulti16;
        
    }
    
    //Reset all cooldowns to default
    func resetcooldowns() {
        switch(octarinepressed) {
        case true:
            if lvl6pressed && !aghanimpressed{
                lvl6 = ulti6 * 0.75
            } else if lvl6pressed && aghanimpressed {
                lvl6agha = aulti6 * 0.75
            } else if lvl11pressed && !aghanimpressed {
                lvl11 = ulti11 * 0.75
            } else if lvl11pressed && aghanimpressed {
                lvl11agha = aulti11 * 0.75
            } else if lvl16pressed && !aghanimpressed {
                lvl16 = ulti16 * 0.75
            } else if lvl16pressed && aghanimpressed {
                lvl16agha = aulti16 * 0.75
            }
        case false:
            if lvl6pressed && !aghanimpressed{
                lvl6 = ulti6
            } else if lvl6pressed && aghanimpressed {
                lvl6agha = aulti6
            } else if lvl11pressed && !aghanimpressed {
                lvl11 = ulti11
            } else if lvl11pressed && aghanimpressed {
                lvl11agha = aulti11
            } else if lvl16pressed && !aghanimpressed {
                lvl16 = ulti16
            } else if lvl16pressed && aghanimpressed {
                lvl16agha = aulti16
            }
        }

    }
    
    
    func resetTimer() {
        //Stop timer
        timer.invalidate();
        
        //Reset readyspell sprite
        readyspell.alpha = 0;
        
        //Start updating and check what to update
        isStarted = true;
        
        //Reset cooldowns
        resetcooldowns();
        
        //Reset cooldown controller
        soundTEN = true;
        soundZERO = true;
    }

    //Test func to play sound when timer reach 10 sec
    func soundTEN(soundname: String) {
        //add sound
        print(soundname);
        soundTEN = false;
    }
    
    //Test func to play sound when timer reach 0 sec
    func soundZERO(soundname: String) {
        //add sound
        print(soundname);
        
        timer.invalidate();
        readyspell.alpha = 1;
        
        soundZERO = false;
    }
}