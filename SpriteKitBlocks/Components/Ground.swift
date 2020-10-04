//
//  Ground.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/4/20.
//

import SpriteKit

class Ground: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "ground")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "Ground"
        self.zPosition = -1.0
        self.anchorPoint = CGPoint(x: 0.0, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Ground {
    
    func setupGround(_ scene: SKScene) {
        for i in -1...1 {
            let ground = Ground()
            ground.position = CGPoint(x: CGFloat(i) * ground.frame.size.width, y: 390.0)
            scene.addChild(ground)
        }
    }
}
