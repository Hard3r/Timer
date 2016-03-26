//
//  Commons.swift
//  Dota2Timers
//
//  Created by влад Богдан on 25.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import Foundation
import SpriteKit


class Commons: SKSpriteNode {
    
    //IconID == filename
    var iconID: String!;
    var cooldown: Double = 0;
    var cooldownsave: Double = 0;
    var highborder: Double = 0;
    var highestborder: Double = 0;
    
    //Icon, timer, buttons
    var icon: SKSpriteNode!;
    var labelframe: SKSpriteNode!;
    var label: SKLabelNode!;
    var start: SKSpriteNode!;
    var reset: SKSpriteNode!;
    
    //Bool for update
    var isStarted: Bool = false;
    var soundTEN: Bool = true;
    var soundZERO: Bool = true;
    
    var timer = NSTimer();
    
    //Init methods
    init() {
        super.init(texture: nil, color: UIColor.clearColor(), size: CGSizeMake(0, 0))
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, iconId: String, cooldown: Double, highborder: Double, highestborder: Double) {
        super.init(texture: texture, color: color, size: size)
        self.iconID = iconId;
        self.cooldown = cooldown;
        self.highborder = highborder;
        self.highestborder = highestborder;
        self.anchorPoint = CGPointMake(0, 0);
        initchild();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initchild() {
        
        //Icon image
        icon = SKSpriteNode(imageNamed: iconID);
        icon.size = CGSizeMake(icon.frame.width * 2, self.frame.height);
        icon.anchorPoint = CGPointMake(0, 0);
        icon.position = CGPointMake(0, 0);
        icon.name = "commonIcon";
        self.addChild(icon);
        
        //frame for timer and timer label
        labelframe = SKSpriteNode(color: UIColor.blackColor(), size: CGSizeMake((self.frame.width - icon.frame.width) / 3, icon.frame.height));
        labelframe.anchorPoint = CGPointMake(0, 0);
        labelframe.position = CGPointMake(icon.position.x + icon.frame.width, 0);
        labelframe.name = "commonLabelframe";
        label = SKLabelNode(text: "\(0)");
        label.name = "commonTimer";
        label.fontSize = 50;
        label.fontColor = UIColor.whiteColor();
        label.fontName = "AlNile-Bold";
        label.position = CGPointMake(labelframe.frame.width / 2, labelframe.frame.height / 2 - label.frame.height / 2);
        labelframe.addChild(label);
        self.addChild(labelframe);
        
        //Start button
        start = SKSpriteNode(imageNamed: "startbutt");
        start.size = CGSizeMake((self.frame.width - icon.frame.width) / 3, icon.frame.height);
        start.position = CGPointMake(labelframe.position.x + labelframe.frame.width + start.frame.width / 2, start.frame.height / 2);
        start.anchorPoint = CGPointMake(0.5, 0.5);
        start.name = "commonStart";
        self.addChild(start);
        
        reset = SKSpriteNode(imageNamed: "info");
        reset.size = CGSizeMake((self.frame.width - icon.frame.width) / 3, icon.frame.height);
        reset.position = CGPointMake(labelframe.position.x + labelframe.frame.width + start.frame.width, 0);
        reset.anchorPoint = CGPointMake(0, 0);
        reset.name = "commonReset";
        self.addChild(reset);
            }
    
    func update() {
        
        if isStarted {
            label.text = "\(Int(cooldownsave))";
        }
        
        //Reset timer.  plays sound before 10 sec and enables zero check. 
        //then triggers zero, reset seconds and turn on 10 sec countdown
        if soundTEN && cooldown > highborder {
            print("PLAY 10 SEC SOUND");
            soundTEN = false;
            soundZERO = true;
        } else if soundZERO && cooldown == highestborder + 1 {
            print("ZERO SECON MY FRIEND");
            cooldown = cooldownsave;
            soundTEN = true;
            soundZERO = false;
        }
    }
    
    func startTimer(){
        
        //Add a timer
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countdown", userInfo: nil, repeats: true)
        
    }
    
    func resetTimer(){
        //Stop timer
        timer.invalidate();
        
        cooldown = cooldownsave;
        
        //Start updating label
        isStarted = true;
        
    }
    
    
    //Selector for timer
    func countdown() {
        label.text = "\(Int(cooldown++))"
    }
    
}