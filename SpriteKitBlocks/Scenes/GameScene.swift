//
//  GameScene.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/3/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var groundNode = Ground()
    var level: Level?
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(hex: 0xB3E5FC)
        self.setupNodes()
        level = Level(levelData: self.getLevelData(), for: self)
    }
}

extension GameScene {
        
    func setupNodes() {
        self.groundNode.setupGround(self)
    }
    
    func getLevelData() -> LevelDataFormat {
        let logList: [(x: Int,y: Int)] = [(0,0),(1,0),(2,0),(2,1),(3,1),(2,3),(3,3),(3,4),(2,7),(3,7),(1,8),(2,8),(3,8),(0,9),(1,9)]
        let rockList: [(x: Int,y: Int)] = [(3,0),(2,5),(3,5),(2,9),(3,9)]
        let beaverPos: (x: Int,y: Int) = (1,5)
        let id: String = "Level 1"
        let width = 10
        let height = 4
        let levelData: LevelDataFormat = (id, width, height, logList, rockList, beaverPos)
        return levelData
    }
}
