//
//  GameScene.swift
//  pop-the-bubble
//
//  Created by Ryan Nguyen on 9/20/18.
//  Copyright © 2018 Danh Phu Nguyen. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class GameScene: SKScene {
    override func didMove(to view: SKView){
        let wait = SKAction.wait(forDuration: 1.5)
        let makeABox = SKAction.run {
            self.makeBox()
        }
        let seq = SKAction.sequence([wait, makeABox])
        let req = SKAction.repeatForever(seq)
        
        run (req)
        
    }
    
    func makeBox() {
        
        // define a size for a box
        let boxSize = CGSize(width: 40, height: 40)
        // make a red box of size
        let box = SKSpriteNode(texture: nil, color: .red, size: boxSize)
        box.name = "box"
        
        // Get a random possition within the width of the scene
        let x = CGFloat(randomize(number: Int(size.width - 40)) + 20)
        
        // position the box
        box.position.x = x
        box.position.y = 0
        
        // Add the box
        addChild(box)
        
        // craete an action to move the move up teh screen
        let moveUp = SKAction.moveTo(y: size.height, duration: 4)
        let seq = SKAction.sequence([moveUp, .removeFromParent()])
        box.run(seq)
    }
    
    // function that returns a random int from 0 to n-1
    func randomize(number: Int) -> Int{
        return Int(arc4random()) % number
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        if let touch = touches.first {
            
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "box" {
                node.removeFromParent()
            }
        }
    }
}
