//
//  Player.swift
//  BlockDemo
//
//  Created by Saigaurav Purushothaman on 9/23/20.
//

import SpriteKit

//Representation of the player in the game grid, special type of block
class Player: Block {
    var direction: Direction {
        didSet {
            self.updateBlock(in: self.skScene)
        }
    }
    var hasLog: Bool
    
    init(x:Int, y:Int, direction:Direction, hasLog:Bool, scene:SKScene, levelDim: (width:Int, height:Int)) {
        self.direction = direction
        self.hasLog = hasLog
        super.init(x: x, y: y, type: .beaver, scene: scene, levelDim: levelDim)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //For debugging
    override func toString() -> String {
        return "X: \(self.x), Y: \(self.y), Direction: \(self.direction), Has Log: \(self.hasLog)"
    }
}
