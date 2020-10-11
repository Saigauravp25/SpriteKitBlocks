//
//  Victory.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/8/20.
//

import SpriteKit

class Victory: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "damVictory")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "VictoryText"
        self.zPosition = 1.0
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        self.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}

extension Victory {
    
    func setupText(_ scene: SKScene) {
        self.position = CGPoint(x: scene.frame.size.width / 2, y: scene.frame.size.height)
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.texture!.size())
//        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.isDynamic = false
        self.physicsBody?.restitution = 0.25
        self.physicsBody!.contactTestBitMask = self.physicsBody!.collisionBitMask
//        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
//        self.physicsBody = SKPhysicsBody(texture: self.texture!, alphaThreshold: 0.3, size: self.size)
        scene.addChild(self)
    }
    
    func drop() {
        self.physicsBody?.isDynamic = true
    }
    
    func hide() {
        self.isHidden = true
    }
}
