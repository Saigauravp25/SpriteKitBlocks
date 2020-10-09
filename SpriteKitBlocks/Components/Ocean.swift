//
//  Ocean.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/8/20.
//

import SpriteKit

class Ocean: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "ocean")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "Ocean"
        self.zPosition = -3.0
        self.anchorPoint = CGPoint(x: 0.0, y: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Ocean {
    
    func setupOcean(_ scene: SKScene) {
        self.position = CGPoint(x: 0.0, y: 400.0)
        scene.addChild(self)
        
//        for i in -1...1 {
//            let ground = Ground()
//            ground.position = CGPoint(x: CGFloat(i) * ground.frame.size.width, y: 390.0)
//            scene.addChild(ground)
//        }
    }
    
    func flood() {
        self.zPosition = 2.0
    }
    
    func unflood() {
        self.zPosition = -3.0
    }
}
