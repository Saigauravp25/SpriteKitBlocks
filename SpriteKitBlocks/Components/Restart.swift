//
//  Restart.swift
//  SpriteKitBlocks
//
//  Created by Saigaurav Purushothaman on 10/8/20.
//

import SpriteKit

class Restart: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "retryButton")
        super.init(texture: texture, color: .clear, size: texture.size())
        self.name = "Restart"
        self.zPosition = 3.0
        self.anchorPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Restart {
    
    func setupRetryButton(_ scene: SKScene) {
        let xFactor = 0.98
        let yFactor = (UIDevice.current.userInterfaceIdiom == .pad) ? 0.93 : 0.78
        self.position = CGPoint(x: CGFloat(xFactor) * scene.frame.size.width, y: CGFloat(yFactor) * scene.frame.size.height)
        scene.addChild(self)
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}
