//
//  HeroScreen.swift
//  Dota2Timers
//
//  Created by влад Богдан on 01.03.16.
//  Copyright © 2016 влад Богдан. All rights reserved.
//

import SpriteKit

class HeroScreen: SKScene {
    
    var mainframe: SKSpriteNode!
    var startbut: SKSpriteNode!
    
    let numrows = 7;
    let numcols = 3;
    var squareSize: CGSize! = nil;
    let xOffset:CGFloat = 5
    let yOffset:CGFloat = 5
    var count: Int! = 0;
    var icons = HeroNames();
    var touched: Set<String> = [];
    
    
    override func didMoveToView(view: SKView) {
        let background2 = SKSpriteNode(imageNamed: "dota2walpapaer");
        background2.position = CGPointMake(0, 0)
        background2.zPosition = 1;
        background2.anchorPoint = CGPointMake(0, 0)
        background2.setScale(0.8)
        //background2.yScale = 1.45
        //background2.xScale = 1.1
        self.addChild(background2);
        
        
        mainframe = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.48, self.frame.height * 0.8))
        mainframe.position = CGPointMake(self.frame.midX, self.frame.midY * 0.9) //задаем позицию.
        //mainframe.alpha = 0.1
        
        mainframe.zPosition = 2 // задаем  положение нашего объекта относительно оси Z.
        self.addChild(mainframe)
        
        
        startbut = SKSpriteNode(imageNamed: "startbutt")
        startbut.position = CGPointMake(mainframe.frame.maxX - startbut.frame.width, mainframe.frame.maxY + startbut.frame.size.height / 2)
         startbut.anchorPoint = CGPointMake(0, 0.5)
        startbut.zPosition = 3;
        self.addChild(startbut)
        
        //расчет размера нодов в соответствии с количеством колонок и строк
        squareSize = CGSizeMake(mainframe.frame.size.width / CGFloat(numcols), mainframe.frame.size.height / CGFloat(numrows))

        
        for row in 0...numrows-1 {
            for col in 0...numcols-1 {
                let node = heroicon(icons.names[count])
                node.size = squareSize
                //отсчитывает от центра фрейма до края и прибавляет ноды по количеству колонок или строк
                node.position = CGPointMake( -(mainframe.frame.size.width / 2) + squareSize.width * CGFloat(col), (mainframe.frame.size.height / 2) - squareSize.height - (squareSize.height * CGFloat(row)))
                node.anchorPoint = CGPointMake(0, 0)
                node.zPosition = 3;
            
                mainframe.addChild(node)
                count = count + 1;
                
                
                
            }
        }
        
    }
    
    override func  update(currentTime: NSTimeInterval) {
       // not
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
         for touch: AnyObject in touches {
            let locationbuttons = touch.locationInNode(mainframe)
            let start = touch.locationInNode(self)
            
            let touchedNode = mainframe.nodeAtPoint(locationbuttons)

            if touchedNode.containsPoint(locationbuttons) {
            
            if touchedNode.alpha == 0.5 { 
            touchedNode.alpha = 1
                touched.remove(touchedNode.name!)
            } else {
                touchedNode.alpha = 0.5
                touched.insert(touchedNode.name!)
                }
            } else if startbut.containsPoint(start){
                
                let transition:SKTransition = SKTransition.fadeWithDuration(1)
                let scene:SKScene = GameScreen(size: self.size, set: touched)
                scene.scaleMode = .AspectFill
                self.view?.presentScene(scene, transition: transition)
                
            }
            
        
            
    }
}
    
    
    //func созд спрайта по имени из енума
    func heroicon(name: String) -> SKSpriteNode {
        let SimpleSprite = SKSpriteNode(imageNamed: name)
        SimpleSprite.name = "\(name)"
        return SimpleSprite
    }
    
}
