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
        var test: String = ""
        for lel in selectedheroes {
            test = test + " \n" + lel
            print(lel)
        }
        
        
        
        
        
        
        var Second = SKLabelNode(text: test)
        Second.fontName = "Chalkboard SE Bold"  // задаем имя шрифта.
        Second.fontColor = SKColor.whiteColor() // задаем цвет шрифта.
        Second.position = CGPointMake(frame.midX, frame.midY) // задаем позицию.
        Second.fontSize = 20 // задаем размер шрифта.
        Second.name = "Second" // задаем имя спрайта
        self.addChild(Second) // добавляем наш спрайт на нашу сцену.
        
        
        
    }
    
    override func update(currentTime: NSTimeInterval) {
        //label.text = test
    }
}