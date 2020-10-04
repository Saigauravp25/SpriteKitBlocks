//
//  Block.swift
//  BlockDemo
//
//  Created by Saigaurav Purushothaman on 9/23/20.
//

import SpriteKit

//Representation of each block in the game grid
class Block: SKSpriteNode {
    var x: Int
    var y: Int
    var type: BlockType
    var levelHeight: Int
    
    init(x:Int, y:Int, type:BlockType, scene:SKScene, levelHeight:Int) {
        self.x = x
        self.y = y
        self.type = type
        self.levelHeight = levelHeight
        let imageName = self.type == .log ? "log" : (self.type == .rock ? "rock" : (self.type == .beaver ? "beaverRight" : "air"))
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = self.type == .beaver ? "Beaver" : imageName.capitalized
        // maybe change zPos for air
        self.zPosition = 1.0
        self.setUpBlock(in: scene)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getBlockPosition() -> (Int, Int) {
        return (self.y, self.levelHeight - self.x - 1)
    }
    
    //For debugging
    func toString() -> String {
        return "X: \(self.x), Y: \(self.y), Type: \(self.type)"
    }
    
    //Prints symbol of each block - for debugging
    func blockSymbol(showPositions: Bool) -> String {
        var pos = ""
        if showPositions {
            pos.append("\(self.getBlockPosition())")
        }
        switch type {
        case .air:
            return "🟦\(pos)"
        case .log:
            return "🟫\(pos)"
        case .rock:
            return "⬜️\(pos)"
        case .beaver:
            let player = self as! Player
            let direction = player.direction
            return direction == .right ? "▶️\(pos)" : "◀️\(pos)"
        }
    }
}

extension Block {
    func setUpBlock(in scene: SKScene) {
        let xPad: CGFloat = 200
        let yPad: CGFloat = 490
        let blockPos: (x:Int, y:Int) = self.getBlockPosition()
        self.position = CGPoint(x: xPad + CGFloat(blockPos.x) * self.frame.width, y: yPad + CGFloat(blockPos.y) * self.frame.height)
        scene.addChild(self)
    }
}
