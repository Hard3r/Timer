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
    var backbut: SKSpriteNode!
    
    let numrows = 7;
    let numcols = 3;
    var squareSize: CGSize! = nil;
    let xOffset:CGFloat = 5
    let yOffset:CGFloat = 5
    var count: Int! = 0;
    var icons = HeroNames();
    var touched: Set<String> = [];
    
    
    override func didMoveToView(view: SKView) {
        let background2 = SKSpriteNode(imageNamed: "Background");
        background2.position = CGPointMake(0, 0)
        background2.size = CGSizeMake(self.frame.width, self.frame.height);
        background2.zPosition = 1;
        background2.anchorPoint = CGPointMake(0, 0)
        self.addChild(background2);
        
        //Фрейм содержащий hero кнопки
        mainframe = SKSpriteNode(color: UIColor.whiteColor(), size: CGSizeMake(self.frame.width * 0.45, self.frame.height * 0.8))
        mainframe.position = CGPointMake(self.frame.midX, self.frame.midY * 0.9) //задаем позицию.
        mainframe.zPosition = 2 // задаем  положение нашего объекта относительно оси Z.
        self.addChild(mainframe)
        
        //Start button
        startbut = SKSpriteNode(imageNamed: "PlayText")
        startbut.position = CGPointMake(mainframe.frame.maxX - startbut.frame.width, mainframe.frame.maxY + startbut.frame.size.height / 2 + 20)
        startbut.anchorPoint = CGPointMake(0, 0.5)
        startbut.zPosition = 3;
        self.addChild(startbut)
        
        //Back button
        backbut = SKSpriteNode(imageNamed: "PlayBack");
        backbut.position = CGPointMake(mainframe.frame.minX, mainframe.frame.maxY + startbut.frame.size.height / 2 + 20);
        backbut.size = CGSizeMake(mainframe.frame.width - startbut.frame.width - 5, startbut.frame.height);
        backbut.anchorPoint = CGPointMake(0, 0.5);
        backbut.zPosition = 3;
        self.addChild(backbut)
        
        //расчет размера нодов в соответствии с количеством колонок и строк
        squareSize = CGSizeMake(mainframe.frame.size.width / CGFloat(numcols), mainframe.frame.size.height / CGFloat(numrows))

        //Loop to create field of nodes whith static size
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
                
                let transition:SKTransition = SKTransition.fadeWithDuration(0.5)
                let scene:SKScene = GameScreen(size: CGSizeMake(1080, 1920), set: touched, heroscreensize: self.size)
                scene.scaleMode = .AspectFill
                self.view?.presentScene(scene, transition: transition);
                
            } else if backbut.containsPoint(start){
                let transition:SKTransition = SKTransition.fadeWithDuration(0.5)
                let scene:SKScene = GameScene(size: self.size);
                scene.scaleMode = .AspectFill
                self.view?.presentScene(scene, transition: transition);
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
